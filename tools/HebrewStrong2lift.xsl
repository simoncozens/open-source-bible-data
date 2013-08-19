<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://openscriptures.github.com/morphhb/namespace">
	<xsl:template match="/">
		<lift version="0.15">
			<xsl:apply-templates/>
		</lift>
	</xsl:template>
	<xsl:template match="*[local-name()='entry']">
		<entry>
			<xsl:attribute name="id"><xsl:value-of select="format-number(substring(@id,2),'H00000')"/></xsl:attribute>
			<lexical-unit>
				<form lang="he"><text><xsl:value-of select="*[local-name()='w']"/></text></form>
			</lexical-unit>
			<sense>
				<xsl:attribute name="id"><xsl:value-of select="format-number(substring(@id,2),'H00000-1')"/></xsl:attribute>
				<grammatical-info>
					<xsl:attribute name="value"><xsl:value-of select="*[local-name()='w']/@pos"/></xsl:attribute>
				</grammatical-info>
				<xsl:if test="*[local-name()='meaning']/*[local-name()='def']/text()">
					<gloss lang="en"><text><xsl:value-of select="*[local-name()='meaning']/*[local-name()='def']/text()"/></text></gloss>	
				</xsl:if>
			<xsl:apply-templates/>
			</sense>
		</entry>
	</xsl:template>	
	<xsl:template match="*[local-name()='entry']/*[local-name()='note']">
		<note type="general"><form lang="en"><text><xsl:copy-of select="node()"/></text></form></note>
	</xsl:template>
	<xsl:template match="*[local-name()='note']"/>
	<xsl:template match="*[local-name()='entry']/*[local-name()='w']"/>
	<xsl:template match="*[local-name()='source']">
		<!-- We can't use etymology for this because it's not well enough specified -->
		<note type="general"><form lang="en"><text><xsl:apply-templates/></text></form></note>
	</xsl:template>
	<xsl:template match="*[local-name()='meaning']">
		<definition>
			<form lang="en"><text><xsl:apply-templates/></text></form>
		</definition>
	</xsl:template>
	<xsl:template match="*[local-name()='usage']">
		<gloss lang="en"><text><xsl:apply-templates/></text></gloss>
	</xsl:template>

</xsl:stylesheet>