## アイテム Place用
#> データの取得
# Indexから検索
data modify storage usjm:index Search.in set from storage usjm:items Give.Id
data modify storage usjm:index Search.Index set from storage usjm:index item.has_uuid

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

#> アイテムの作成
# (0, -64, 0) に一時置き場としてシュルカーボックスを設置
setblock 0 -64 0 bedrock
setblock 0 -64 0 shulker_box replace

# 配置データを作成
data modify storage usjm:items PlaceItem set value {}

data modify storage usjm:items PlaceItem.Count set value 1b
data modify storage usjm:items PlaceItem.Slot set value 0b
data modify storage usjm:items PlaceItem.id set from storage usjm:index Search.out.MinecraftId
data modify storage usjm:items PlaceItem.tag set from storage usjm:index Search.out.tag

data modify storage usjm:items PlaceItem.tag.Usjm.ItemStats set from storage usjm:index Search.out.ItemStats
data modify storage usjm:items PlaceItem.tag.Usjm.Id set from storage usjm:index Search.out.Id
data modify storage usjm:items PlaceItem.tag.Usjm.Rarity set from storage usjm:index Search.out.Rarity
data modify storage usjm:items PlaceItem.tag.Usjm.ItemType set from storage usjm:index Search.out.ItemType

data modify storage usjm:items PlaceItem.hasLore set value false
execute unless data storage usjm:items {PlaceItem:{tag:{display:{Lore:[]}}}} run data modify storage usjm:items PlaceItem.hasLore set value true

execute if data storage usjm:items {PlaceItem:{hasLore:true}} run data modify storage usjm:items PlaceItem.tag.display.Lore append value '{"text":"------------------","color":"gray","italic":false}'
execute if data storage usjm:items {PlaceItem:{hasLore:true}} run data modify storage usjm:items PlaceItem.tag.display.Lore prepend value '{"text":"------------------","color":"gray","italic":false}'

data modify storage usjm:items PlaceItem.tag.HideFlags set value 255

# UUIDを生成, 必要ならコピー
summon marker ~ ~ ~ {Tags:["Usjm.Item.Temp"]}
execute if data storage usjm:index Search.out.UUID run data modify storage usjm:items PlaceItem.tag.Usjm.UUID set from entity @e[tag=Usjm.Item.Temp,limit=1] UUID

kill @e[tag=Usjm.Item.Temp]

# アイテムを配置, 作成したデータをコピー
item replace block 0 -64 0 container.0 with stone

data modify block 0 -64 0 Items[{Slot:0b}] set from storage usjm:items PlaceItem
data modify storage usjm:items PlaceItem set value {}

#> Lore設定
# StatsのLore設定
item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/note

execute unless data storage usjm:index {Search:{out:{ItemStats:{Damage:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/damage
execute unless data storage usjm:index {Search:{out:{ItemStats:{Health:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/health
execute unless data storage usjm:index {Search:{out:{ItemStats:{Defence:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/defence
execute unless data storage usjm:index {Search:{out:{ItemStats:{Mana:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/mana
execute unless data storage usjm:index {Search:{out:{ItemStats:{Luck:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/luck
execute unless data storage usjm:index {Search:{out:{ItemStats:{Speed:0}}}} run item modify block 0 -64 0 container.0 usjm-items:set_lore/stats/speed

# アイテムの種類
execute if data storage usjm:index {Search:{out:{ItemType:"Sword"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Sword"
execute if data storage usjm:index {Search:{out:{ItemType:"Spear"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Spear"
execute if data storage usjm:index {Search:{out:{ItemType:"Hammer"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Hammer"
execute if data storage usjm:index {Search:{out:{ItemType:"Accessory"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Accessory"
execute if data storage usjm:index {Search:{out:{ItemType:"Wand"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Wand"
execute if data storage usjm:index {Search:{out:{ItemType:"Armor"}}} run data modify storage usjm:items PlaceItem.Lore.ItemType set value "Armor"

# アイテムレア度
execute if data storage usjm:index {Search:{out:{Rarity:1b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"Normal","color":"white","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:2b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"Rare","color":"blue","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:3b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"Epic","color":"dark_purple","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:4b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"Legendary","color":"gold","italic":false}'
execute if data storage usjm:index {Search:{out:{Rarity:5b}}} run data modify storage usjm:items PlaceItem.Lore.Rarity set value '{"text":"Mythic","color":"light_purple","italic":false}'

# ItemModifer適応
item modify block 0 -64 0 container.0 usjm-items:set_lore/empty_line
item modify block 0 -64 0 container.0 usjm-items:set_lore/item_type

# 攻撃速度の設定
data modify storage usjm:items ItemType set from storage usjm:items PlaceItem.Other.ItemType
function usjm-items:recalc_atk_speed

# 特定のアイテムの場合は攻撃速度を設定しない
data modify storage usjm:items PlaceItem.hasAttackSpeed set value true
execute if data storage usjm:items {PlaceItem:{ItemType:"Armor"}} run data modify storage usjm:items PlaceItem.hasAttackSpeed set value false
execute if data storage usjm:items {PlaceItem:{ItemType:"Crossbow"}} run data modify storage usjm:items PlaceItem.hasAttackSpeed set value false

execute unless data storage usjm:items {PlaceItem:{hasAttackSpeed:false}} store result block 0 -64 0 Items[0].tag.Usjm.ItemStats.AtkSpeed float 0.001 run scoreboard players get $AtkSpeed Usjm.Temp
