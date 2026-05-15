<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="header">
        <xsl:param name="title"/>

        <header class="header">
            <div class="header__title">
                <svg>
                    <use href="assets/icon/icons.svg#icon-inventory"></use>
                </svg>

                <h2>
                    <xsl:value-of select="$title"/>
                </h2>
            </div>

            <div class="header__user">
                <svg>
                    <use href="assets/icon/icons.svg#icon-person"></use>
                </svg>
            </div>
        </header>
    </xsl:template>

</xsl:stylesheet>
