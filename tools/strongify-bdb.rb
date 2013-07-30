require "xml"
require "json"
require 'sqlite3'
db = SQLite3::Database.new "bdb.db"

db.execute("CREATE TABLE lexicon (strongs INTEGER, bdb TEXT, content TEXT, PRIMARY KEY(strongs, bdb))");

bdbStrongMap = {}
xmldoc = XML::Parser.file("LexicalIndex.xml").parse
xmldoc.find("//*[local-name()='xref']").each do |v|
    bdbStrongMap[ v.attributes["bdb"] ] = v.attributes["strong"]
end

File.open("bdb-strong-map.json", "w") {|f| f.write JSON.dump(bdbStrongMap)}

xmldoc = XML::Parser.file("BrownDriverBriggs.xml").parse

s = db.prepare("INSERT INTO lexicon VALUES (?,?,?)")

db.transaction do |db| 
	xmldoc.find("//*[local-name()='entry']").each do |v|
	    if bdbStrongMap[v.attributes["id"]]
	        v.attributes["strong"] = bdbStrongMap[v.attributes["id"]]
	    end
	    s.execute([ v.attributes["strong"], v.attributes["id"], v.to_s ])
	end
end

File.open("strongified-bdb.xml", "w") {|f| f.write xmldoc }
