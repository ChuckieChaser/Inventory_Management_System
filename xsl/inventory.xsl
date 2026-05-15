<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:inventory="http://www.plpasig.com/inventory"
    exclude-result-prefixes="inventory">

    <xsl:include href="sidebar.xsl"/>
    <xsl:include href="header.xsl"/>
    <xsl:include href="status.xsl"/>
    <xsl:include href="table.xsl"/>

    <xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">
        <html>
            <head>
                <title>Inventory Management System</title>

                <link rel="stylesheet" type="text/css" href="../css/theme.css"/>

                <link rel="stylesheet" type="text/css" href="../css/sidebar.css"/>
                <link rel="stylesheet" type="text/css" href="../css/header.css"/>
                <link rel="stylesheet" type="text/css" href="../css/status.css"/>
                <link rel="stylesheet" type="text/css" href="../css/table.css"/>
            </head>

            <body>
                <!-- Sidebar -->
                <xsl:call-template name="sidebar">
                    <xsl:with-param name="title" select="'PLPASIG'"/>
                </xsl:call-template>

                <!-- Header -->
                <xsl:call-template name="header">
                    <xsl:with-param name="title" select="'Inventory Management System'"/>
                </xsl:call-template>

                <main>
                    <!-- Status -->
                    <xsl:call-template name="status">
                        <xsl:with-param name="label" select="'System Overview'"/>
                        <xsl:with-param name="description" select="'Aggregated metrics for procurement planning.'"/>
                    </xsl:call-template>

                    <!-- Table -->
                    <xsl:call-template name="table">
                        <xsl:with-param name="label" select="'Inventory Catalog'"/>
                        <xsl:with-param name="description" select="'Complete records for all active assets.'"/>
                    </xsl:call-template>
                </main>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
