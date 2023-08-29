## UUID 付きアイテム 定義: 0000-template
#> データ作成
# 空データ
data modify storage usjm:index item.has_uuid append value {}

# Id
data modify storage usjm:index item.has_uuid[-1].Id set value "0001-crystal_sword"
data modify storage usjm:index item.has_uuid[-1].MinecraftId set value "minecraft:stick"

# 種類とレアリティ
data modify storage usjm:index item.has_uuid[-1].ItemType set value "Sword"
data modify storage usjm:index item.has_uuid[-1].Rarity set value 5b

# アイテムStats
data modify storage usjm:index item.has_uuid[-1].ItemStats.Damage set value 130
data modify storage usjm:index item.has_uuid[-1].ItemStats.Mana set value 50
data modify storage usjm:index item.has_uuid[-1].ItemStats.Luck set value 5
data modify storage usjm:index item.has_uuid[-1].ItemStats.Health set value 0
data modify storage usjm:index item.has_uuid[-1].ItemStats.Defence set value 0
data modify storage usjm:index item.has_uuid[-1].ItemStats.Speed set value 5

# その他
data modify storage usjm:index item.has_uuid[-1].UUID set value [I;0,0,0,0]

# 表示データ
data modify storage usjm:index item.has_uuid[-1].tag.display.Name set value '{"text":"クリスタルの剣","color":"light_purple","italic":false}'

data modify storage usjm:index item.has_uuid[-1].tag.display.Lore set value []
data modify storage usjm:index item.has_uuid[-1].tag.display.Lore append value '{"text":"Lore A","italic":false}'
data modify storage usjm:index item.has_uuid[-1].tag.display.Lore append value '{"text":"Lore 2","italic":false}'

# CustomModelData
data modify storage usjm:index item.has_uuid[-1].tag.CustomModelData set value 1010000

# Trim 
# data modify storage usjm:index item.has_uuid[-1].tag.Trim set value {"material":"","pattern":""}
