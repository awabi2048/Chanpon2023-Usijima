## UUID 付きアイテム 定義: 0000-template
#> データ作成
# 空データ
data modify storage usjm:index item.has_uuid append value {}

# Id
data modify storage usjm:index item.has_uuid[-1].Id set value "0000-template"
data modify storage usjm:index item.has_uuid[-1].MinecraftId set value "minecraft:stick"

# 種類とレアリティ
data modify storage usjm:index item.has_uuid[-1].ItemType set value "Sword"
data modify storage usjm:index item.has_uuid[-1].Rarity set value 3b

# アイテムStats
data modify storage usjm:index item.has_uuid[-1].ItemStats.Damage set value 100
data modify storage usjm:index item.has_uuid[-1].ItemStats.Mana set value 100
data modify storage usjm:index item.has_uuid[-1].ItemStats.Luck set value 100
data modify storage usjm:index item.has_uuid[-1].ItemStats.Health set value 200
data modify storage usjm:index item.has_uuid[-1].ItemStats.Defence set value 100
data modify storage usjm:index item.has_uuid[-1].ItemStats.Speed set value 100

# その他
data modify storage usjm:index item.has_uuid[-1].UUID set value [I;0,0,0,0]

# 表示データ
data modify storage usjm:index item.has_uuid[-1].tag.display.Name set value '{"text":"Template","color":"yellow","italic":false}'

data modify storage usjm:index item.has_uuid[-1].tag.display.Lore set value []
data modify storage usjm:index item.has_uuid[-1].tag.display.Lore append value '{"text":"Template Lore 1","italic":false}'
data modify storage usjm:index item.has_uuid[-1].tag.display.Lore append value '{"text":"Template Lore 2","italic":false}'

# CustomModelData
data modify storage usjm:index item.has_uuid[-1].tag.CustomModelData set value 1010000

# Trim 
# data modify storage usjm:index item.has_uuid[-1].tag.Trim set value {"material":"","pattern":""}
