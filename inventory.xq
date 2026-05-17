declare default element namespace "http://www.plpasig.com/inventory";

<CategoryReport>
{
    let $document := doc("inventory.xml")
    for $category in distinct-values($document//item/@category)
    let $items := $document//item[@category = $category]

    return
        <Category name="{$category}">
            <ItemCount>{count($items)}</ItemCount>
            <TotalQuantity>{sum($items/quantity)}</TotalQuantity>
        </Category>
}
</CategoryReport>
