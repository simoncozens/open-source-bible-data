<xsl:stylesheet  version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xpath-default-namespace="http://openscriptures.github.com/morphhb/namespace">
	<xsl:output method="xml" indent="yes"/>
	<xsl:template match="text()" />
	<xsl:template match="/">
		<lift version="0.15">
			<xsl:apply-templates/>
		</lift>
	</xsl:template>
	<xsl:template match="*[local-name()='entry' and not(@strong)]"/>
	<xsl:template match="*[local-name()='entry' and @strong]">
		<entry>
			<xsl:attribute name="id"><xsl:value-of select="format-number(@strong,'H00000')"/></xsl:attribute>
			<lexical-unit>
				<form lang="he"><text><xsl:value-of select="*[local-name()='w']"/></text></form>
			</lexical-unit>
			<xsl:apply-templates/>
		</entry>
	</xsl:template>	
	<xsl:template match="*[local-name()='sense']/*[local-name()='sense']/">
	</xsl:template>

	<xsl:template match="*[local-name()='entry']/*[local-name()='sense']">
		<sense>
			<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<xsl:apply-templates/>
			<xsl:for-each select="*[local-name()='sense']">
			<subsense>
				<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
				<definition><form lang="en"><text><xsl:value-of select="."/></text></form></definition>
				<xsl:for-each select="*[local-name()='def']"><gloss lang="en"><text><xsl:value-of select="."/></text></gloss>
				</xsl:for-each>
			</subsense>			
			</xsl:for-each>
			<xsl:if test="not(*[local-name()='sense'])">
				<definition><form lang="en"><text><xsl:value-of select="."/></text></form></definition>
				<xsl:for-each select="*[local-name()='def']"><gloss lang="en"><text><xsl:value-of select="."/></text></gloss>
				</xsl:for-each>
			</xsl:if>
		</sense>
	</xsl:template>
	<xsl:template match="*[local-name()='entry']/*[local-name()='def']">
		<sense>
			<xsl:attribute name="id"><xsl:value-of select="generate-id(.)"/></xsl:attribute>
			<gloss lang="en"><text><xsl:value-of select="text()"/></text></gloss>
		</sense>
	</xsl:template>
	<xsl:template match="*[local-name()='sense']/*[local-name()='stem']">
		<grammatical-info><xsl:attribute name="value"><xsl:value-of select="../../*[local-name()='pos']"/></xsl:attribute>
		<trait name="stem"><xsl:attribute name="value"><xsl:value-of select="text()"/></xsl:attribute></trait>
		</grammatical-info>
	</xsl:template>
	<xsl:template match="*[local-name()='status']"/>
	<xsl:template match="*[local-name()='w']"/>
	<xsl:template match="*[local-name()='source']">
		<!-- We can't use etymology for this because it's not well enough specified -->
		<note type="general"><form lang="en"><text><xsl:apply-templates/></text></form></note>
	</xsl:template>

</xsl:stylesheet>