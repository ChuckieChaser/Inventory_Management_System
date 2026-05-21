<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="sidebar">
        <xsl:param name="title"/>

        <aside id="sidebar" class="sidebar">
            <div class="sidebar__logo">
                <img src="../assets/img/logo.jpg" alt="Logo"/>

                <h2>
                    <xsl:value-of select="$title"/>
                </h2>
            </div>

            <div class="sidebar__navigation">
                <a class="sidebar__navigation-link" href="#">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-service"></use>
                    </svg>

                    <span>Student Service Request System</span>
                </a>

                <a class="sidebar__navigation-link" href="#">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-domain"></use>
                    </svg>

                    <span>Facility Reservation System</span>
                </a>

                <a class="sidebar__navigation-link --active" href="#">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-inventory"></use>
                    </svg>

                    <span>Inventory Management System</span>
                </a>

                <a class="sidebar__navigation-link" href="#">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-commute"></use>
                    </svg>

                    <span>Campus Transport System</span>
                </a>

                <a class="sidebar__navigation-link" href="#">
                    <svg>
                        <use href="assets/icon/icons.svg#icon-medical"></use>
                    </svg>

                    <span>Health Service System</span>
                </a>
            </div>
        </aside>
    </xsl:template>

</xsl:stylesheet>
