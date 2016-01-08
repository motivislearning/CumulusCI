<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"  xmlns:sf="http://soap.sforce.com/2006/04/metadata" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template match="node() | @*">
	    <xsl:copy>
	        <xsl:apply-templates select="node() | @*"/>
	    </xsl:copy>
	</xsl:template>

	<xsl:template match="/sf:PermissionSet/sf:userPermissions[ sf:name = 'ManageSelfService' or sf:name = 'ManageEncryptionKeys' or sf:name = 'ViewEncryptedData' or sf:name = 'ApproveContract' or sf:name = 'EditPublicReports']"/>

</xsl:stylesheet>
