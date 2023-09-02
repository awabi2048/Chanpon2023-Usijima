## UUID付きアイテム /give: 0000-template
#> データの取得
# アイテムIdを設定
data modify storage usjm:items Give.Id set value "0000-template"
data modify storage usjm:items Give.hasUUID set value true

# function
function usjm-items:assets/generic/give
