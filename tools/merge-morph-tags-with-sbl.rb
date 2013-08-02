require 'xml'
require 'unicode_utils/u'
xmldoc = XML::Parser.file('sbl.xml').parse
strongs = XML::Parser.file("../strongs-dictionary-xml/strongsgreek.xml").parse
strongHash = {}

strongs.find("//entry").each do |e|
  g = e.find("greek").first
  if g
    strongHash[U.nfc(U.downcase(g.attributes["unicode"]))] = e.attributes["strongs"]
  end
end

ARGV.replace(Dir.glob("*.txt").to_a)
xmldoc.find("//w").each do |w|
  line = ARGF.readline
  (ref, pos, morph, parse2, text, word, norm, lemma) = line.split(" ")
  (book, chapter, verse) = ref.scan(/../)
  w.attributes["pos"] = pos
  w.attributes["morph"] = morph
  w.attributes["lemma"] = lemma
  if strongHash[U.nfc(U.downcase(lemma))]
    w.attributes["strongs"] = strongHash[U.nfc(U.downcase(lemma))]
  end
end
puts xmldoc
#xmldoc.save("sbl-morph.xml")