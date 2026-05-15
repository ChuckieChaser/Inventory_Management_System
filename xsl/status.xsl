<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:inventory="http://www.plpasig.com/inventory">

    <xsl:template name="status">
        <xsl:param name="label"/>
        <xsl:param name="description"/>

        <section class="status">
            <div class="status__greet">
                <h2>
                    <xsl:value-of select="$label"/>
                </h2>

                <span>
                    <xsl:value-of select="$description"/>
                </span>
            </div>

            <div class="status__date">
                <div class="status__date-dropdown">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-calendar"></use>
                    </svg>

                    <div></div>

                    <span>May 14, 2026</span>
                </div>
            </div>

            <div class="status__display">
                <div class="status__display-card --inventory">
                    <div class="card__icon">
                        <svg>
                            <use href="assets/icon/icons.svg#icon-inventory"></use>
                        </svg>
                    </div>

                    <div class="card__detail">
                        <span>Total Items</span>

                        <h1>
                            <xsl:value-of select="count(//inventory:item)"/>
                        </h1>
                    </div>
                </div>

                <div class="status__display-card --available">
                    <div class="card__icon">
                        <svg>
                            <use href="assets/icon/icons.svg#icon-success"></use>
                        </svg>
                    </div>

                    <div class="card__detail">
                        <span>Available Items</span>

                        <h1>
                            <xsl:value-of select="count(//inventory:item[inventory:status='Available'])"/>
                        </h1>
                    </div>
                </div>

                <div class="status__display-card --low-stock">
                    <div class="card__icon">
                        <svg>
                            <use href="assets/icon/icons.svg#icon-warning"></use>
                        </svg>
                    </div>

                    <div class="card__detail">
                        <span>Low Stock Items</span>

                        <h1>
                            <xsl:value-of select="count(//inventory:item[inventory:status='Low Stock'])"/>
                        </h1>
                    </div>
                </div>

                <div class="status__display-card --out-of-stock">
                    <div class="card__icon">
                        <svg>
                            <use href="assets/icon/icons.svg#icon-error"></use>
                        </svg>
                    </div>

                    <div class="card__detail">
                        <span>Out of Stock Items</span>

                        <h1>
                            <xsl:value-of select="count(//inventory:item[inventory:status='Out of Stock'])"/>
                        </h1>
                    </div>
                </div>
            </div>
        </section>
    </xsl:template>

</xsl:stylesheet>
