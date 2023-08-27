## レベルアップ
# 古いデータを保存
scoreboard players operation $OldStats.PlayerLevel Usjm.Temp = @s Usjm.PlayerStats.PlayerLevel

scoreboard players operation $OldStats.Health Usjm.Temp = @s Usjm.PlayerStats.MaxHealth-Base
scoreboard players operation $OldStats.ManaPool Usjm.Temp = @s Usjm.PlayerStats.ManaPool-Base
scoreboard players operation $OldStats.Defence Usjm.Temp = @s Usjm.PlayerStats.Defence-Base
scoreboard players operation $OldStats.Luck Usjm.Temp = @s Usjm.PlayerStats.Luck-Base

# スコア計算
scoreboard players add @s Usjm.PlayerStats.PlayerLevel 1

scoreboard players add @s Usjm.PlayerStats.MaxHealth-Base 25
scoreboard players add @s Usjm.PlayerStats.ManaPool-Base 15
scoreboard players add @s Usjm.PlayerStats.Defence-Base 10
scoreboard players add @s Usjm.PlayerStats.Luck-Base 2

scoreboard players add @s Usjm.PlayerStats.ManaRegen.Power 3
scoreboard players add @s Usjm.PlayerStats.HealthRegen.Power 3

scoreboard players operation @s Usjm.PlayerStats.CurrentExp -= @s Usjm.PlayerStats.RequiredExp

scoreboard players operation @s Usjm.PlayerStats.RequiredExp *= #16 Usjm.Constant
scoreboard players operation @s Usjm.PlayerStats.RequiredExp /= #10 Usjm.Constant

# tellraw
tellraw @s [{"text":"\uF802"},{"text":"\uEF01"},{"text":"\uF801"},{"text":"\uEF01"}]

tellraw @s [{"text":"\uF824"},{"text": "\uE0F7\uF822"},{"text": "レベルアップしました！","bold": true,"underlined": true},{"text": "\uF828"},{"score":{"name": "$OldStats.PlayerLevel","objective": "Usjm.Temp"},"color": "gold","bold": true},{"text": "\uF826➡\uF826","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.PlayerLevel"},"color": "gold","bold": true}]

tellraw @s {"text": ""}

tellraw @s [{"text":"\uF82A"},{"text": "\uE0F0"},{"text": "\uF822最大体力\uF828\uF801"},{"score":{"name": "$OldStats.Health","objective": "Usjm.Temp"},"color": "red"},{"text": "\uF826➡\uF826","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.MaxHealth-Base"},"color": "red"}]
tellraw @s [{"text":"\uF82A"},{"text": "\uE0F3"},{"text": "\uF822\uF821最大マナ\uF828"},{"score":{"name": "$OldStats.ManaPool","objective": "Usjm.Temp"},"color": "aqua"},{"text": "\uF826➡\uF826","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.ManaPool-Base"},"color": "aqua"}]
tellraw @s [{"text":"\uF82A"},{"text": "\uE0F1"},{"text": "\uF822防御力\uF829"},{"score":{"name": "$OldStats.Defence","objective": "Usjm.Temp"},"color": "green"},{"text": "\uF826➡\uF826","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Defence-Base"},"color": "green"}]
tellraw @s [{"text":"\uF82A"},{"text": "\uE0F6"},{"text": "\uF822運\uF82A\uF822"},{"score":{"name": "$OldStats.Luck","objective": "Usjm.Temp"},"color": "yellow"},{"text": "\uF826➡\uF826","color": "white"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Luck-Base"},"color": "yellow"}]

tellraw @s [{"text":"\uF802"},{"text":"\uEF01"},{"text":"\uF801"},{"text":"\uEF01"}]

# 演出
particle totem_of_undying ~ ~1 ~ 0 0 0 0.5 20
playsound entity.player.levelup master @s ~ ~ ~ 1 0.875

# Expバーの更新
function usjm-player_stats:exp_bar/reflesh
