# Inventory Management System

### Xpath Queries

The following are the Xpath Queries done within the xsl.

---

Count all the items in the inventory.xml

```
# from status.xsl
<xsl:value-of select="count(//inventory:item)"/>
```

---

Count all the items in the inventory.xml that has their status tag equal to 'Available'

```
# from status.xsl
<xsl:value-of select="count(//inventory:item[inventory:status='Available'])"/>
```

---

Count all the items in the inventory.xml that has their status tag equal to 'Low Stock'

```
# from status.xsl
<xsl:value-of select="count(//inventory:item[inventory:status='Low Stock'])"/>
```

---

Count all the items in the inventory.xml that has their status tag equal to 'Out of Stock'

```
# from status.xsl
<xsl:value-of select="count(//inventory:item[inventory:status='Out of Stock'])"/>
```

---

Get all the items ready for iteration in the inventory.xml

```
# from table.xsl
<xsl:for-each select="//inventory:item">
  ...
</xsl:for-each>
```

---

Get the current position of the fetched item

```
# from table.xsl
<xsl:value-of select="position()"/>
```

---

Get the value of attribute named "id" in the fetched item

```
# from table.xsl
<xsl:value-of select="@id"/>
```

---

Get the value of child tag named "name" in the fetched item

```
# from table.xsl
<xsl:value-of select="inventory:name"/>
```

---

Get the value of child tag named "quantity" in the fetched item

```
# from table.xsl
<xsl:value-of select="inventory:quantity"/>
```

---

Get the value of child tag named "status" in the fetched item

```
# from table.xsl
<xsl:value-of select="inventory:status"/>
```

---

Get the value of child tag named "last_update" in the fetched item

```
# from table.xsl
<xsl:value-of select="inventory:last_update"/>
```
