## UUID 付きアイテム 定義: 0002-crystal_wand
#> データ作成
# 空データ
data modify storage usjm:index item.has_uuid append value {}

# Id
data modify storage usjm:index item.has_uuid[-1].Id set value "0002-wooden_wand"
data modify storage usjm:index item.has_uuid[-1].MinecraftId set value "minecraft:stick"

# 種類とレアリティ
data modify storage usjm:index item.has_uuid[-1].ItemType set value "Wand"
data modify storage usjm:index item.has_uuid[-1].Rarity set value 4b

# アイテムStats
data modify storage usjm:index item.has_uuid[-1].ItemStats.Damage set value 80
data modify storage usjm:index item.has_uuid[-1].ItemStats.Mana set value 50
data modify storage usjm:index item.has_uuid[-1].ItemStats.Luck set value 0
data modify storage usjm:index item.has_uuid[-1].ItemStats.Health set value 0
data modify storage usjm:index item.has_uuid[-1].ItemStats.Defence set value 0
data modify storage usjm:index item.has_uuid[-1].ItemStats.Speed set value 0

# その他
data modify storage usjm:index item.has_uuid[-1].UUID set value [I;0,0,0,0]

# 表示データ
data modify storage usjm:index item.has_uuid[-1].tag.display.Name set value '{"text":"木の杖","color":"light_purple","italic":false}'

data modify storage usjm:index item.has_uuid[-1].tag.display.Lore set value []

# CustomModelData
data modify storage usjm:index item.has_uuid[-1].tag.CustomModelData set value 1040002

# Trim 
# data modify storage usjm:index item.has_uuid[-1].tag.Trim set value {"material":"","pattern":""}
