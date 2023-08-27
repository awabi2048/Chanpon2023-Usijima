## 指定した統計を持つアイテムの/give
#Ex. data modify storage usjm:items CustomGive set value {Stats:{"Damage":250,"Mana":300,"Defence":50},"Other":{"ItemType":"Sword","Rarity":4b}}
#    data modify storage usjm:items CustomGive set value {Stats:{"Health":50,"Defence":30},"Other":{"ItemType":"Armor","Rarity":3b}}

#> 下準備
# 設定されていない値を0として書き換え
execute unless data storage usjm:items CustomGive.Stats.Defence run data modify storage usjm:items CustomGive.Stats.Defence set value 0
execute unless data storage usjm:items CustomGive.Stats.Damage run data modify storage usjm:items CustomGive.Stats.Damage set value 0
execute unless data storage usjm:items CustomGive.Stats.Health run data modify storage usjm:items CustomGive.Stats.Health set value 0
execute unless data storage usjm:items CustomGive.Stats.Mana run data modify storage usjm:items CustomGive.Stats.Mana set value 0
execute unless data storage usjm:items CustomGive.Stats.Luck run data modify storage usjm:items CustomGive.Stats.Luck set value 0

execute unless data storage usjm:items CustomGive.Other.ItemType run data modify storage usjm:items CustomGive.Other.ItemType set value "Sword"

data modify storage usjm:items CustomGive.Item.tag.display.Lore append value '{"text":"==================","color":"gray","italic":false}'
data modify storage usjm:items CustomGive.Item.tag.display.Lore prepend value '{"text":"==================","color":"gray","italic":false}'

#> 実処理
# 予め設定された統計をもとにアイテム生成
summon item_display ~ ~ ~ {Tags:["Usjm.Temp-CustomGive"],item:{id:"minecraft:stone",Count:1b}}
loot replace entity @e[tag=Usjm.Temp-CustomGive] container.0 loot usjm-items:custom_give

item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_item_type

# 既に設定されているデータはそのままコピー
data modify storage usjm:items CustomGive.Other.OriginalData set from storage usjm:items CustomGive.Item.tag
data modify storage usjm:items CustomGive.Other.OriginalData.id set from storage usjm:items CustomGive.Item.id

data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.id set from storage usjm:items CustomGive.Other.OriginalData.id

data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.CustomModelData set from storage usjm:items CustomGive.Other.OriginalData.CustomModelData
data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.Trim set from storage usjm:items CustomGive.Other.OriginalData.Trim

data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.Usjm.Tags set from storage usjm:items CustomGive.Other.OriginalData.Usjm.Tags
data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.HideFlags set value 255

data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.display set from storage usjm:items CustomGive.Other.OriginalData.display
data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.Unbreaking set from storage usjm:items CustomGive.Other.OriginalData.Unbreaking

# 攻撃速度
data modify storage usjm:items ItemType set from storage usjm:items CustomGive.Other.ItemType
function usjm-items:recalc_atk_speed

# 特定のアイテムの場合は攻撃速度を設定しない
data modify storage usjm:items CustomGive.IsMelee set value true
execute if data storage usjm:items {CustomGive:{Other:{ItemType:Armor}}} run data modify storage usjm:items CustomGive.IsMelee set value false
execute if data storage usjm:items {CustomGive:{Other:{ItemType:Crossbow}}} run data modify storage usjm:items CustomGive.IsMelee set value false

execute unless data storage usjm:items {CustomGive:{IsMelee:false}} store result entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.Usjm.ItemStats.AtkSpeed float 0.001 run scoreboard players get $AtkSpeed Usjm.Temp

#> Lore設定
# StatsのLore設定
item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/note

execute unless data storage usjm:items {CustomGive:{Stats:{Damage:0}}} run item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/damage
execute unless data storage usjm:items {CustomGive:{Stats:{Health:0}}} run item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/health
execute unless data storage usjm:items {CustomGive:{Stats:{Defence:0}}} run item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/defence
execute unless data storage usjm:items {CustomGive:{Stats:{Mana:0}}} run item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/mana
execute unless data storage usjm:items {CustomGive:{Stats:{Luck:0}}} run item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/stats/luck

# アイテムの種類
execute if data storage usjm:items {CustomGive:{Other:{ItemType:"Sword"}}} run data modify storage usjm:items CustomGive.Lore.ItemType set value "剣"
execute if data storage usjm:items {CustomGive:{Other:{ItemType:"Spear"}}} run data modify storage usjm:items CustomGive.Lore.ItemType set value "槍"
execute if data storage usjm:items {CustomGive:{Other:{ItemType:"Hammer"}}} run data modify storage usjm:items CustomGive.Lore.ItemType set value "槌"
execute if data storage usjm:items {CustomGive:{Other:{ItemType:"Wand"}}} run data modify storage usjm:items CustomGive.Lore.ItemType set value "杖"
execute if data storage usjm:items {CustomGive:{Other:{ItemType:"Crossbow"}}} run data modify storage usjm:items CustomGive.Lore.ItemType set value "石弓"

# Bar
item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/empty_line

# アイテムレア度
execute if data storage usjm:items {CustomGive:{Other:{Rarity:1b}}} run data modify storage usjm:items CustomGive.Lore.ItemRarity set value '{"text":"Normal","color":"white","italic":false}'
execute if data storage usjm:items {CustomGive:{Other:{Rarity:2b}}} run data modify storage usjm:items CustomGive.Lore.ItemRarity set value '{"text":"Rare","color":"blue","italic":false}'
execute if data storage usjm:items {CustomGive:{Other:{Rarity:3b}}} run data modify storage usjm:items CustomGive.Lore.ItemRarity set value '{"text":"Epic","color":"dark_purple","italic":false}'
execute if data storage usjm:items {CustomGive:{Other:{Rarity:4b}}} run data modify storage usjm:items CustomGive.Lore.ItemRarity set value '{"text":"Legendary","color":"gold","italic":false}'
execute if data storage usjm:items {CustomGive:{Other:{Rarity:5b}}} run data modify storage usjm:items CustomGive.Lore.ItemRarity set value '{"text":"Mythic","color":"light_purple","italic":false}'

item modify entity @e[tag=Usjm.Temp-CustomGive] container.0 usjm-items:set_lore/item_type

# UUID設定
data modify entity @e[tag=Usjm.Temp-CustomGive,limit=1] item.tag.Usjm.UUID set from entity @e[tag=Usjm.Temp-CustomGive,limit=1] UUID

#> 与えられた形式によりアイテムを配置
# シュルカーボックスを配置
setblock 0 -64 0 shulker_box{Items:[]}
item replace block 0 -64 0 container.0 from entity @e[tag=Usjm.Temp-CustomGive,limit=1] container.0

# give形式ならloot give
execute if data storage usjm:items {GiveForm:"give"} run loot give @s mine 0 -64 0 debug_stick

# replace形式ならそのまま

# リセット
kill @e[tag=Usjm.Temp-CustomGive]
