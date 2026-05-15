# INVENTORY MANAGEMENT SYSTEM

### Xpath Queries

Getting all the items in the inventory.xml

```XPATH
count(//inventory:item) # from status.xsl
```

//: count(//inventory:item[inventory:status='Available']) # from status.xsl

//: count(//inventory:item[inventory:status='Low Stock']) # from status.xsl

//: count(//inventory:item[inventory:status='Out of Stock']) # from status.xsl
