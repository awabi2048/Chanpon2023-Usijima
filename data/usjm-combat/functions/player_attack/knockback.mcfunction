## ノックバック再現
# 原点に召喚したMarkerの座標から単位ベクトルを取得
execute rotated as @p[tag=Usjm.AttackerPlayer] positioned 0.0 0.0 0.0 run summon marker ^ ^ ^0.4 {Tags:["Usjm.Temp"]}

data modify storage usjm:combat MobKnockback set from entity @e[tag=Usjm.Temp,limit=1] Pos

execute store result score $Motion.X Usjm.Temp run data get storage usjm:combat MobKnockback[0] 1000
execute store result score $Motion.Z Usjm.Temp run data get storage usjm:combat MobKnockback[2] 1000

scoreboard players set $Motion.Y Usjm.Temp 300

scoreboard players operation $Motion.X Usjm.Temp *= $KnockbackMultiple Usjm.Temp
scoreboard players operation $Motion.Y Usjm.Temp *= $KnockbackMultiple Usjm.Temp
scoreboard players operation $Motion.Z Usjm.Temp *= $KnockbackMultiple Usjm.Temp

execute store result storage usjm:combat MobKnockback[0] double 0.00001 run scoreboard players get $Motion.X Usjm.Temp
execute store result storage usjm:combat MobKnockback[2] double 0.00001 run scoreboard players get $Motion.Z Usjm.Temp

data modify storage usjm:combat MobKnockback[1] set value 0.3d
data modify entity @s Motion set from storage usjm:combat MobKnockback

kill @e[tag=Usjm.Temp]

# ダメージっぽく
effect give @s instant_damage 1 253 true
effect give @s instant_health 1 253 true
