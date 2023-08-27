## mob関連処理共通部分: 死亡時
# データの移動
execute on passengers on passengers run data modify storage usjm:mobs_temp DiedMobData set from entity @s data.Usjm.Mobs

# もろもろをkill
execute on passengers on passengers run kill @s
execute on passengers run kill @s

tp ~ ~-300 ~
kill @s

#> ルート
# Luckの値を+100
scoreboard players add @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck 100

# 経験値 Exp
execute store result score $ExpAmount Usjm.Temp run data get storage usjm:mobs_temp DiedMobData.ExpAmount

scoreboard players operation $ExpAmount Usjm.Temp *= @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck
scoreboard players operation $ExpAmount Usjm.Temp /= #100 Usjm.Constant

scoreboard players operation @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.CurrentExp += $ExpAmount Usjm.Temp

# お金 Gold
execute store result score $GoldAmount Usjm.Temp run data get storage usjm:mobs_temp DiedMobData.GoldAmount

scoreboard players operation $GoldAmount Usjm.Temp *= @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck
scoreboard players operation $GoldAmount Usjm.Temp /= #100 Usjm.Constant

scoreboard players operation @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Gold += $GoldAmount Usjm.Temp

# もとに戻す
scoreboard players remove @p[tag=Usjm.AttackerPlayer] Usjm.PlayerStats.Luck 100

# 獲得した経験値からバーを再設定
execute as @p[tag=Usjm.AttackerPlayer] run function usjm-player_stats:exp_bar/reflesh

#> 効果音
playsound entity.experience_orb.pickup master @a[tag=Usjm.AttackerPlayer] ~ ~ ~ 2 1

#> 取得表示
# 表示時間設定
title @a[tag=Usjm.AttackerPlayer] times 5t 30t 5t

# 空title
title @a[tag=Usjm.AttackerPlayer] title ""

# subtitle
title @a[tag=Usjm.AttackerPlayer] subtitle [{"text": "\uE0F4\uF821"},{"text": ":\uF822","color": "gray"},{"text": "+","color": "gray"},{"score":{"name": "$GoldAmount","objective": "Usjm.Temp"},"color": "#ffffaa"},{"text": "\uF821G","color": "#ffffaa"},{"text": "\uF825"},{"text": "\uE0F7\uF821"},{"text": ":\uF822","color": "gray"},{"text": "+","color": "gray"},{"score":{"name": "$ExpAmount","objective": "Usjm.Temp"},"color": "#aaffaa"},{"text": "\uF821Exp","color": "#aaffaa"}]
