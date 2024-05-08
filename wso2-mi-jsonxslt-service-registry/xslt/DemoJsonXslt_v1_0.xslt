<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl soapenv ">  
    
    <xsl:output method="text" indent="yes" media-type="application/json" encoding="UTF-8"/>	
    <xsl:strip-space elements="*"/>
	
    <xsl:template match="/record">{
    "transactionId": "<xsl:value-of select="./field[@name='ID']"/>,",
    "status":
    <xsl:choose>
        <xsl:when test="./field[@name='TRANSACTIONSTATUS']='202'">
            <xsl:text>"pending"</xsl:text>
        </xsl:when>
        <xsl:when test="./field[@name='TRANSACTIONSTATUS']='204'">
            <xsl:text>"initiated"</xsl:text>
       </xsl:when>
       <xsl:when test="./field[@name='TRANSACTIONSTATUS']='203'">
            <xsl:text>"completed"</xsl:text>
        </xsl:when>
        <xsl:otherwise><xsl:text>""</xsl:text></xsl:otherwise>
    </xsl:choose>,
    "credittransfer": {
        "amount": <xsl:value-of select="./field[@name='TRANSAMT']"/>,
        "sendername": "<xsl:value-of select="./field[@name='SNDNAME']"/>",
        "receivername": "<xsl:value-of select="./field[@name='RECVNAME']"/>",
        "senderacctnumber": "<xsl:value-of select="./field[@name='SNDACCTNUMBER']"/>",
        "receiveracctnumber": "<xsl:value-of select="./field[@name='RECVACCTNUMBER']"/>"
    }
}</xsl:template>
</xsl:stylesheet>

