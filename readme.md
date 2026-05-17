# Inventory Management System - XPath Query List

This file identifies all XPath queries used across the system’s XSLT stylesheets to handle data calculation, filtering, and display.

### Dashboard Summary Queries (`status.xsl`)

These queries are used to calculate the high-level metrics shown in the summary cards.

- **Total Item Count**
  `count(//inventory:item)`
  _Calculates the total number of items in the database._

- **Available Stock Count**
  `count(//inventory:item[inventory:status='Available'])`
  _Filters and counts only items marked as "Available"._

- **Low Stock Count**
  `count(//inventory:item[inventory:status='Low Stock'])`
  _Filters and counts items that are running low on inventory._

- **Out of Stock Count**
  `count(//inventory:item[inventory:status='Out of Stock'])`
  _Filters and counts items with zero quantity remaining._

### Category Aggregation Queries (`status.xsl`)

These queries work together to group items by their category and provide sub-totals.

- **Unique Category Filter**
  `//inventory:item[not(@category = preceding::inventory:item/@category)]`
  _Identifies every unique category name by skipping duplicates._

- **Category Name Retrieval**
  `@category`
  _Pulls the specific name of the category currently being processed._

- **Items Per Category Count**
  `count(//inventory:item[@category = $currentCategory])`
  _Counts how many items belong to the specific category stored in the variable._

### Data Table Queries (`table.xsl`)

These queries are used to populate the main inventory list with specific item details.

- **Main Table Iteration**
  `//inventory:item`
  _Targets all item nodes to create a repeating list of rows._

- **Item Identity**
  `@id`
  _Retrieves the unique ID attribute for the item._

- **Item Details**
  `inventory:name`
  _Retrieves the name of the equipment._

- **Stock Level**
  `inventory:quantity`
  _Retrieves the numerical count of the item._

- **Item Status**
  `inventory:status`
  _Retrieves the availability label for the item._

- **Update Timestamp**
  `inventory:last_update`
  _Retrieves the date the record was last modified._
