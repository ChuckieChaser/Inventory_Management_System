<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:inventory="http://www.plpasig.com/inventory">

    <xsl:template name="table">
        <xsl:param name="label"/>
        <xsl:param name="description"/>

        <section class="table">
            <header class="table__header">
                <div class="table__header-greet">
                    <h2>
                        <xsl:value-of select="$label"/>
                    </h2>

                    <span>
                        <xsl:value-of select="$description"/>
                    </span>
                </div>

                <div class="table__header-search">
                    <div class="search__textfield">
                        <svg>
                            <use href="assets/icon/icons.svg#icon-search"></use>
                        </svg>

                        <input type="text" placeholder="Search for an item"/>
                    </div>

                    <button>Search</button>
                </div>
            </header>

            <div class="table__content">
                <table>
                    <thead>
                        <tr>
                            <th>Index</th>
                            <th>Item ID</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Status</th>
                            <th>Last Updated</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="//inventory:item">
                            <tr>
                                <td>
                                    <xsl:value-of select="position()"/>
                                </td>

                                <td>
                                    <xsl:value-of select="@id"/>
                                </td>

                                <td>
                                    <xsl:value-of select="inventory:name"/>
                                </td>

                                <td>
                                    <xsl:value-of select="inventory:quantity"/>
                                </td>

                                <td data-status="{inventory:status}">
                                    <div class="status__badge">
                                        <div class="status__badge-icon"></div>

                                        <span>
                                            <xsl:value-of select="inventory:status"/>
                                        </span>
                                    </div>
                                </td>

                                <td>
                                    <xsl:value-of select="inventory:last_update"/>
                                </td>
                            </tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>
