## Tick
#> パーティクル
particle flame ~ ~ ~ 0.05 0.05 0.05 0 2 force

# 加速
execute store result score @s Usjm.Temp run data get entity @s data.Usjm.Magic.Speed 1000
scoreboard players add @s Usjm.Temp 50


execute store result entity @s data.Usjm.Magic.Speed double 0.001 run scoreboard players get @s Usjm.Temp

