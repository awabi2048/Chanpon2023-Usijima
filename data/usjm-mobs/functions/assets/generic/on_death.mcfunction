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

# クエストの目標値を取得
execute store result score $QuestTarget Usjm.Temp run data get storage usjm:index Search.out.Subject.Count

# MobのIdが一致すれば討伐数に加算
data remove storage usjm:mobs CompareSucceeded
execute store success storage usjm:mobs CompareSucceeded byte 1 run data modify storage usjm:index Search.out.Subject.Target set from storage usjm:mobs DiedMobData.Id

execute if data storage usjm:mobs {CompareSucceeded:0b} run data modify storage usjm:mobs QuestRelated set value true
execute if data storage usjm:mobs {CompareSucceeded:1b} run data modify storage usjm:mobs QuestRelated set value false

execute unless score @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Id matches 1.. run data modify storage usjm:mobs QuestRelated set value false

execute if data storage usjm:mobs {QuestRelated:true} run scoreboard players add @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Progress 1

# 進捗度合いを通知 (完了済み扱いでなければ)
execute if data storage usjm:quest {Search:{out:{Type:"Main"}}} run data modify storage usjm:quest Type set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:quest {Search:{out:{Type:"Sub"}}} run data modify storage usjm:quest Type set value '{"text":"サブクエスト","color":"aqua"}'

tellraw @a {"score":{"name": "@p[tag=Usjm.AttackerPlayer]","objective": "Usjm.Questing-Progress"},"color": "yellow"}
execute if data storage usjm:mobs {QuestRelated:true} if score @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Progress < $QuestSubject Usjm.Temp run tellraw @p[tag=Usjm.AttackerPlayer] [{"text": "［","color": "white"},{"nbt":"Type","storage": "usjm:quest","interpret": true},{"text": "］","color": "white"},"\uF824",{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:index","bold": true,"interpret": true,"color": "white"},{"text": "』","color": "white","bold": true},{"text": "\uF824\uF822(","color": "white","bold": false},{"score":{"name": "@p[tag=Usjm.AttackerPlayer]","objective": "Usjm.Questing-Progress"},"color": "yellow"},{"text": "/","color": "gray"},{"nbt":"Search.out.Subject.Count","storage": "usjm:index","color": "gray"},{"text": ")","color": "white"}]

# 終了判定
execute store result score $QuestSubject Usjm.Temp run data get storage usjm:index Search.out.Subject.Count
execute if data storage usjm:mobs {QuestRelated:true} if score @p[tag=Usjm.AttackerPlayer] Usjm.Questing-Progress >= $QuestSubject Usjm.Temp as @p[tag=Usjm.AttackerPlayer] run function usjm-quest:assets/generic/on_finish

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
