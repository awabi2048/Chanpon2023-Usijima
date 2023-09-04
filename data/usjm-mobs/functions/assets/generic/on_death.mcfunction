## mob関連処理共通部分: 死亡時
# データの移動
execute on passengers on passengers run data modify storage usjm:mobs DiedMobData set from entity @s data.Usjm.Mobs

# もろもろをkill
execute on passengers on passengers run kill @s
execute on passengers run kill @s

kill @s

#> 討伐クエストの判定
# プレイヤーの受注中のクエストを取得
execute store result storage usjm:index Search.in int 1 run scoreboard players get @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Id

# データベースから検索
data modify storage usjm:index Search.Index set from storage usjm:index quest

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

# MobのIdが一致すれば進捗処理を実行
data remove storage usjm:mobs CompareSucceeded
execute store success storage usjm:mobs CompareSucceeded byte 1 run data modify storage usjm:index Search.out.Subject.Target set from storage usjm:mobs DiedMobData.Id

execute if data storage usjm:mobs {CompareSucceeded:0b} run data modify storage usjm:mobs QuestRelated set value true
execute if data storage usjm:mobs {CompareSucceeded:1b} run data modify storage usjm:mobs QuestRelated set value false

execute unless score @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Id matches 1.. run data modify storage usjm:mobs QuestRelated set value false

execute if data storage usjm:mobs {QuestRelated:true} as @p[tag=Usjm.AttackerPlayer] run function usjm-quest:assets/generic/on_progress/slayer

#> Loot
# Luckの値を+100
scoreboard players add @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck 100

#> スコアルート
# 経験値 Exp
execute store result score $LootExp Usjm.Temp run data get storage usjm:mobs DiedMobData.Loot.Exp
execute store result score $LootGold Usjm.Temp run data get storage usjm:mobs DiedMobData.Loot.Gold

scoreboard players operation $LootExp Usjm.Temp *= @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck
scoreboard players operation $LootExp Usjm.Temp /= #100 Usjm.Constant

scoreboard players operation @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.CurrentExp += $LootExp Usjm.Temp

# お金 Gold
scoreboard players operation $LootGold Usjm.Temp *= @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck
scoreboard players operation $LootGold Usjm.Temp /= #100 Usjm.Constant

scoreboard players operation @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Gold += $LootGold Usjm.Temp

# もとに戻す
scoreboard players remove @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck 100

# 獲得した経験値からバーを再設定
execute as @p[tag=Usjm.AttackerPlayer] run function usjm-player_stats:exp_bar/reflesh

#> アイテムルート
# モブのルートアイテムを取得
data modify storage usjm:index Search.Index set from storage usjm:index mobs
data modify storage usjm:index Search.in set from storage usjm:mobs DiedMobData.Id
function usjm-core:index_search

# アイテムの召喚
data modify storage usjm:mobs Looting.in set from storage usjm:index Search.out.Loot.Item

setblock 0 -64 0 shulker_box replace
function usjm-mobs:looting/_

# setblock 0 -64 0 bedrock

#> 効果音
playsound entity.experience_orb.pickup master @a[tag=Usjm.AttackerPlayer] ~ ~ ~ 2 1

#> 取得表示
# 表示時間設定
title @a[tag=Usjm.AttackerPlayer] times 5t 30t 5t

# 空title
title @a[tag=Usjm.AttackerPlayer] title ""

# subtitle
title @a[tag=Usjm.AttackerPlayer] subtitle [{"text": "\uE0F4\uF821"},{"text": ":\uF822","color": "gray"},{"text": "+","color": "gray"},{"score":{"name": "$LootGold","objective": "Usjm.Temp"},"color": "#ffffaa"},{"text": "\uF821G","color": "#ffffaa"},{"text": "\uF825"},{"text": "\uE0F7\uF821"},{"text": ":\uF822","color": "gray"},{"text": "+","color": "gray"},{"score":{"name": "$LootExp","objective": "Usjm.Temp"},"color": "#aaffaa"},{"text": "\uF821Exp","color": "#aaffaa"}]
