## アイテム Place用
#> データの取得
# Indexから検索
data modify storage usjm:index Search.in set from storage usjm:items Give.Id
execute if data storage usjm:items {Give:{hasUUID:true}} run data modify storage usjm:index Search.Index set from storage usjm:index item.has_uuid
execute if data storage usjm:items {Give:{hasUUID:false}} run data modify storage usjm:index Search.Index set from storage usjm:index item.no_uuid

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

#> アイテムの作成
# (0, -64, 0) に一時置き場としてシュルカーボックスを設置
setblock 0 -64 0 bedrock
setblock 0 -64 0 shulker_box replace

# 配置データを作成
data modify storage usjm:items PlaceItem set value {}

execute if data storage usjm:items {Give:{hasUUID:false}} if data storage usjm:index {Search:{out:{StackSize:1b}}} run data modify storage usjm:items PlaceItem.id set value "minecraft:minecart"
execute if data storage usjm:items {Give:{hasUUID:false}} if data storage usjm:index {Search:{out:{StackSize:16b}}} run data modify storage usjm:items PlaceItem.id set value "minecraft:armor_stand"
execute if data storage usjm:items {Give:{hasUUID:false}} if data storage usjm:index {Search:{out:{StackSize:64b}}} run data modify storage usjm:items PlaceItem.id set value "minecraft:stick"

execute if data storage usjm:items {Give:{hasUUID:true}} run data modify storage usjm:items PlaceItem.id set from storage usjm:index Search.out.MinecraftId

data modify storage usjm:items PlaceItem.Count set value 1b
data modify storage usjm:items PlaceItem.Slot set value 0b

data modify storage usjm:items PlaceItem.tag set from storage usjm:index Search.out.tag

data modify storage usjm:items PlaceItem.tag.Usjm.ItemStats set from storage usjm:index Search.out.ItemStats
data modify storage usjm:items PlaceItem.tag.Usjm.Rarity set from storage usjm:index Search.out.Rarity
data modify storage usjm:items PlaceItem.tag.Usjm.ItemType set from storage usjm:index Search.out.ItemType

data modify storage usjm:items PlaceItem.hasLore set value false
execute unless data storage usjm:items {PlaceItem:{tag:{display:{Lore:[]}}}} run data modify storage usjm:items PlaceItem.hasLore set value true

execute if data storage usjm:items {PlaceItem:{hasLore:true}} run data modify storage usjm:items PlaceItem.tag.display.Lore append value '{"text":"------------------","color":"gray","italic":false}'
execute if data storage usjm:items {PlaceItem:{hasLore:true}} run data modify storage usjm:items PlaceItem.tag.display.Lore prepend value '{"text":"------------------","color":"gray","italic":false}'

data modify storage usjm:items PlaceItem.tag.HideFlags set value 255

# UUIDを生成, 必要ならコピー
summon marker ~ ~ ~ {Tags:["Usjm.Item.Temp"]}
execute if data storage usjm:items {Give:{hasUUID:true}} run data modify storage usjm:items PlaceItem.tag.Usjm.UUID set from entity @e[tag=Usjm.Item.Temp,limit=1] UUID

kill @e[tag=Usjm.Item.Temp]

# アイテムを配置, 作成したデータをコピー
item replace block 0 -64 0 container.0 with stone

# data modify block 0 -64 0 Items[{Slot:0b}] set from storage usjm:items PlaceItem

data modify storage usjm:items PlaceItem set value {}

#> Lore設定
# StatsのLore設定
execute if data storage usjm:items {PlaceItem:{hasLore:true}} run function usjm-items:assets/generic/stats_lore

# アイテムの種類
execute if data storage usjm:index {Search:{out:{ItemType:"Sword"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "剣"
execute if data storage usjm:index {Search:{out:{ItemType:"Spear"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "槍"
execute if data storage usjm:index {Search:{out:{ItemType:"Hammer"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "鎚"
execute if data storage usjm:index {Search:{out:{ItemType:"Accessory"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "装飾品"
execute if data storage usjm:index {Search:{out:{ItemType:"Wand"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "杖"
execute if data storage usjm:index {Search:{out:{ItemType:"Armor"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "防具"

execute if data storage usjm:index {Search:{out:{ItemType:"Material-Loot"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "ドロップ素材"
execute if data storage usjm:index {Search:{out:{ItemType:"Material-Upgrade"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "強化素材"
execute if data storage usjm:index {Search:{out:{ItemType:"Material-Other"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "素材"

# アイテムレア度
execute if data storage usjm:index {Search:{out:{Rarity:1b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"★☆☆☆☆","color":"white","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:2b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"★★☆☆☆","color":"white","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:3b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"★★★☆☆","color":"white","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:4b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"★★★★☆","color":"white","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:5b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"★★★★★","color":"white","italic":false}'

# ItemModifer適応
item modify block 0 -64 0 container.0 usjm-items:set_lore/empty_line

item modify block 0 -64 0 container.0 usjm-items:set_lore/item_type
item modify block 0 -64 0 container.0 usjm-items:set_lore/item_rarity

# 攻撃速度の設定
data modify storage usjm:items ItemType set from storage usjm:items PlaceItem.Other.ItemType
function usjm-items:recalc_atk_speed

# 特定のアイテムの場合は攻撃速度を設定しない
data modify storage usjm:items PlaceItem.hasAttackSpeed set value true

execute if data storage usjm:items {PlaceItem:{ItemType:"Armor"}} run data modify storage usjm:items PlaceItem.hasAttackSpeed set value false
execute if data storage usjm:items {PlaceItem:{ItemType:"Crossbow"}} run data modify storage usjm:items PlaceItem.hasAttackSpeed set value false

execute if data storage usjm:items {Give:{hasUUID:false}} run data modify storage usjm:items PlaceItem.hasAttackSpeed set value false

execute unless data storage usjm:items {PlaceItem:{hasAttackSpeed:false}} store result block 0 -64 0 Items[0].tag.Usjm.ItemStats.AtkSpeed float 0.001 run scoreboard players get $AtkSpeed Usjm.Temp
