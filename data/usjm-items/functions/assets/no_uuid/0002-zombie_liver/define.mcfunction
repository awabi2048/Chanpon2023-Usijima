## UUID 付きアイテム 定義: 0002-zombie_liver
#> データ作成
# 空データ
data modify storage usjm:index item.no_uuid append value {}

# Id
data modify storage usjm:index item.no_uuid[-1].Id set value "0002-zombie_liver"

# 種類とレアリティ
data modify storage usjm:index item.no_uuid[-1].ItemType set value "Material-Loot"
data modify storage usjm:index item.no_uuid[-1].Rarity set value 2b

# その他
data modify storage usjm:index item.no_uuid[-1].StackSize set value 16b

# 表示データ
data modify storage usjm:index item.no_uuid[-1].tag.display.Name set value '{"text":"ゾンビの肝","color":"white","italic":false}'

data modify storage usjm:index item.no_uuid[-1].tag.display.Lore set value []
data modify storage usjm:index item.no_uuid[-1].tag.display.Lore append value '{"text":"(未定)","italic":false}'

# CustomModelData
data modify storage usjm:index item.no_uuid[-1].tag.CustomModelData set value 3010002
