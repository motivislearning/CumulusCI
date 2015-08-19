<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:sf="http://soap.sforce.com/2006/04/metadata" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="node() | @*">
	    <xsl:copy>
	        <xsl:apply-templates select="node() | @*"/>
	    </xsl:copy>
	</xsl:template>

	<xsl:template match="/sf:CustomObject/sf:fields[sf:type='Percent' or sf:type='Number' or sf:type='Currency']/sf:formula/text()">
		<xsl:value-of select="'0'"/>
	</xsl:template>

	<xsl:template match="/sf:CustomObject/sf:fields[sf:type='Checkbox']/sf:formula/text()">
		<xsl:value-of select="'false'"/>
	</xsl:template>

	<xsl:template match="/sf:CustomObject/sf:fields[sf:type='DateTime']/sf:formula/text()">
		<xsl:value-of select="'NOW()'"/>
	</xsl:template>

	<xsl:template match="/sf:CustomObject/sf:fields[sf:type='Date']/sf:formula/text()">
		<xsl:value-of select="'DATEVALUE(NOW())'"/>
	</xsl:template>

	<xsl:template match="/sf:CustomObject/sf:fields[sf:type='Text']/sf:formula/text()">
		<xsl:value-of select="'&quot;&quot;'"/>
	</xsl:template>

</xsl:stylesheet>