## UUID 付きアイテム 定義: 0001-rotten_flesh
#> データ作成
# 空データ
data modify storage usjm:index item.no_uuid append value {}

# Id
data modify storage usjm:index item.no_uuid[-1].Id set value "0001-rotten_flesh"

# 種類とレアリティ
data modify storage usjm:index item.no_uuid[-1].ItemType set value "Material-Loot"
data modify storage usjm:index item.no_uuid[-1].Rarity set value 1b

# その他
data modify storage usjm:index item.no_uuid[-1].StackSize set value 64b

# 表示データ
data modify storage usjm:index item.no_uuid[-1].tag.display.Name set value '{"text":"腐った肉","color":"white","italic":false}'

data modify storage usjm:index item.no_uuid[-1].tag.display.Lore set value []
data modify storage usjm:index item.no_uuid[-1].tag.display.Lore append value '{"text":"酷いにおいだ。","italic":false}'

# CustomModelData
data modify storage usjm:index item.no_uuid[-1].tag.CustomModelData set value 3010001
