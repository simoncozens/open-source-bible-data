require 'sqlite3'
require "xml"
name = ARGV.shift

xmldoc = XML::Parser.file(name).parse

dbname = name.gsub(/.xml$/,".db")
db = SQLite3::Database.new dbname
db.execute("CREATE TABLE bible (book, chapter  INTEGER, verse INTEGER, content TEXT, PRIMARY KEY(book, chapter, verse))");
db.execute("CREATE VIRTUAL TABLE bible_fts USING fts3(book, chapter INTEGER, verse INTEGER, content TEXT)");

db.execute("CREATE TABLE metadata (k,v)");
s = db.prepare("INSERT INTO metadata VALUES (?,?)")

s.execute(["abbrev", xmldoc.root.attributes["abbrev"]])
s.execute(["name", xmldoc.root.attributes["name"]])
s.execute(["fts", 1])

s = db.prepare("INSERT INTO bible VALUES (?,?,?,?)")
s_fts = db.prepare("INSERT INTO bible_fts VALUES (?,?,?,?)")
b = ""

db.transaction do |db| 
	xmldoc.find("//*/verse").each {|v|
		if v.parent.parent.attributes["num"] != b
			b = v.parent.parent.attributes["num"]
			puts b
		end
		s.execute([v.parent.parent.attributes["num"], v.parent.attributes["num"], v.attributes["num"], v.to_s])
		s_fts.execute([v.parent.parent.attributes["num"], v.parent.attributes["num"], v.attributes["num"], v.content])
	}
end