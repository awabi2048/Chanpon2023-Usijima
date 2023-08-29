## 魔法詠唱 3回完了時
# 有効な操作か確認
data modify storage usjm:index Search.in set from entity @s UUID
data modify storage usjm:index Search.Index set from storage usjm:index player.magic

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search


execute store result storage usjm:index Search.in int 1 run scoreboard players get @s Usjm.Combat.Magic.Casting-Operation
data modify storage usjm:index Search.Index set from storage usjm:index Search.out.Assignment

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

#> 後処理
# スコアをリセット
scoreboard players set @s Usjm.Combat.Magic.Casting-Count 0
scoreboard players set @s Usjm.Combat.Magic.Casting-Operation 0
scoreboard players set @s Usjm.Combat.Magic.Casting-Timer -1

#> 魔法の詠唱
# 操作が無効であるなら処理を中断
execute unless data storage usjm:index Search.out.MagicId run tellraw @s {"text": "＊操作が無効です。","color": "gray"}
execute unless data storage usjm:index Search.out.MagicId run playsound entity.enderman.teleport master @s ~ ~ ~ 0.5 0.5

execute unless data storage usjm:index Search.out.MagicId run return -1

# 詠唱中の魔法を検索
data modify storage usjm:index Search.in set from storage usjm:index Search.out.MagicId
data modify storage usjm:index Search.Index set from storage usjm:index magic

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

# 発動処理
function usjm-combat:magic/assets/generic/cast
