## UUID付きアイテム /item replace: 0000-template
#> データの取得
# アイテムIdを設定
data modify storage usjm:items Give.Id set value "0000-template"
data modify storage usjm:items Give.hasUUID set value true

# function → (0, -64, 0)のItems[0]に配置
function usjm-items:assets/generic/place
