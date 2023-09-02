## UUID付きアイテム /give: 0001-rotten_flesh
#> データの取得
# アイテムIdを設定
data modify storage usjm:items Give.Id set value "0001-rotten_flesh"
data modify storage usjm:items Give.hasUUID set value false

# function
function usjm-items:assets/generic/give
