Catalogue = [
	{
		type: "bible",
		version: { abbrev: "KJV", full: "King James Version" },
		lang: "eng",
		licence: "Public Domain",
		source: "http://ebible.org/kjv/",
		files: {
			raw: { type: "local", file: "raw/eng-kjv_osis.xml", format: "OSIS" },
			simpleXml: "cooked/simple-xml/kjv.xml",
			sqlite: "cooked/sqlite/kjv.db"
		}
	},
	{
		type: "bible",
		version: { abbrev: "LEB", full: "Lexham English Bible" },
		lang: "eng",
		licence: "Custom",
		licence_url: "http://lexhamenglishbible.com/license/",
		source: "http://lexhamenglishbible.com/",
		files: {
			raw: { type: "local", file: "raw/LEB.xml", format: "OSIS" },
			simpleXml: "cooked/simple-xml/LEB.xml",
			sqlite: "cooked/sqlite/LEB.db"
		}
	},
	{
		type: "bible",
		version: { abbrev: "SBLGNT", full: "SBL Greek New Testament" },
		lang: "grc-koi",
		licence: "Custom",
		licence_url: "http://sblgnt.com/license/",
		source: "http://sblgnt.com/download/",
		files: {
			raw: { type: "local", file: "raw/SBLGNT.osis.xml", format: "OSIS" },
			simpleXml: "cooked/simple-xml/sbl.xml",
			sqlite: "cooked/sqlite/sbl.db"
		}
	},
	{
		type: "commentary",
		name: "SBL Greek New Testament Apparatus",
		licence: "Custom",
		licence_url: "http://sblgnt.com/license/",
		source: "http://sblgnt.com/download/",
		files: {
			raw: { type: "local", file: "raw/SBLGNTapp.osis.xml", format: "OSIS" }
		}
	},
	{
		type: "bible",
		version: { abbrev: "WLC", full: "Westminster-Leningrad Codex" },
		lang: "hbo",
		licence: "Public Domain",
		source: "https://github.com/openscriptures/morphhb/tree/master/wlc",
		files: {
			raw: { type: "remote", url: "https://github.com/openscriptures/morphhb/tree/master/wlc", format: "OSIS" },
			simpleXml: "cooked/simple-xml/wlc.xml",
			sqlite: "cooked/sqlite/wlc.db"
		}
	},
	{
		type: "bible",
		version: { abbrev: "POR-Almeida", full: "Tradução de João Ferreira de Almeida" },
		lang: "por",
		licence: "Public Domain",
		files: {
			simpleXml: "cooked/simple-xml/por.xml",
			sqlite: "cooked/sqlite/por.db"
		}
	},
	{
		type: "bible",
		version: { abbrev: "ReinaV", full: "Reina Valera Actualizada" },
		lang: "spa",
		licence: "Public Domain(?)",
		files: {
			simpleXml: "cooked/simple-xml/rva.xml",
			sqlite: "cooked/sqlite/rva.db"
		}
	},	
	{
		type: "bible",
		version: { abbrev: "ReinaV", full: "Reina Valera 1909" },
		lang: "spa",
		licence: "Public Domain",
		files: {
			simpleXml: "cooked/simple-xml/rvr.xml",
			sqlite: "cooked/sqlite/rvr.db"
		}
	},	
	{
		type: "bible",
		version: { abbrev: "SE", full: "Sagradas Escrituras" },
		lang: "spa",
		licence: "Public Domain",
		files: {
			simpleXml: "cooked/simple-xml/se.xml",
			sqlite: "cooked/sqlite/se.db"
		}
	},	
];