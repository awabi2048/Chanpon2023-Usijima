## 移動処理
#> バイナリ処理? みたいに
# 1000倍したスコアに変換

execute if score @s Usjm.Temp matches 0 run tp @s ~ ~ ~

data modify storage usjm:combat Magic.Movement set value {}

execute if score @s Usjm.Temp matches 4096.. run data modify storage usjm:combat Magic.Movement.4096 set value true
execute if score @s Usjm.Temp matches 2048.. run data modify storage usjm:combat Magic.Movement.2048 set value true
execute if score @s Usjm.Temp matches 1024.. run data modify storage usjm:combat Magic.Movement.1024 set value true
execute if score @s Usjm.Temp matches 512.. run data modify storage usjm:combat Magic.Movement.512 set value true
execute if score @s Usjm.Temp matches 256.. run data modify storage usjm:combat Magic.Movement.256 set value true
execute if score @s Usjm.Temp matches 128.. run data modify storage usjm:combat Magic.Movement.128 set value true
execute if score @s Usjm.Temp matches 64.. run data modify storage usjm:combat Magic.Movement.64 set value true
execute if score @s Usjm.Temp matches 32.. run data modify storage usjm:combat Magic.Movement.32 set value true
execute if score @s Usjm.Temp matches 16.. run data modify storage usjm:combat Magic.Movement.16 set value true
execute if score @s Usjm.Temp matches 8.. run data modify storage usjm:combat Magic.Movement.8 set value true
execute if score @s Usjm.Temp matches 4.. run data modify storage usjm:combat Magic.Movement.4 set value true
execute if score @s Usjm.Temp matches 2.. run data modify storage usjm:combat Magic.Movement.2 set value true
execute if score @s Usjm.Temp matches 1.. run data modify storage usjm:combat Magic.Movement.1 set value true

execute if data storage usjm:combat {Magic:{Movement:{4096:true}}} run scoreboard players remove @s Usjm.Temp 4096
execute if data storage usjm:combat {Magic:{Movement:{4096:true}}} positioned ^ ^ ^4.096 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{2048:true}}} run scoreboard players remove @s Usjm.Temp 2048
execute if data storage usjm:combat {Magic:{Movement:{2048:true}}} positioned ^ ^ ^2.048 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{1024:true}}} run scoreboard players remove @s Usjm.Temp 1024
execute if data storage usjm:combat {Magic:{Movement:{1024:true}}} positioned ^ ^ ^1.024 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{512:true}}} run scoreboard players remove @s Usjm.Temp 512
execute if data storage usjm:combat {Magic:{Movement:{512:true}}} positioned ^ ^ ^0.512 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{256:true}}} run scoreboard players remove @s Usjm.Temp 256
execute if data storage usjm:combat {Magic:{Movement:{256:true}}} positioned ^ ^ ^0.256 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{128:true}}} run scoreboard players remove @s Usjm.Temp 128
execute if data storage usjm:combat {Magic:{Movement:{128:true}}} positioned ^ ^ ^0.128 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{64:true}}} run scoreboard players remove @s Usjm.Temp 64
execute if data storage usjm:combat {Magic:{Movement:{64:true}}} positioned ^ ^ ^0.064 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{32:true}}} run scoreboard players remove @s Usjm.Temp 32
execute if data storage usjm:combat {Magic:{Movement:{32:true}}} positioned ^ ^ ^0.032 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{16:true}}} run scoreboard players remove @s Usjm.Temp 16
execute if data storage usjm:combat {Magic:{Movement:{16:true}}} positioned ^ ^ ^0.016 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{8:true}}} run scoreboard players remove @s Usjm.Temp 8
execute if data storage usjm:combat {Magic:{Movement:{8:true}}} positioned ^ ^ ^0.008 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{4:true}}} run scoreboard players remove @s Usjm.Temp 4
execute if data storage usjm:combat {Magic:{Movement:{4:true}}} positioned ^ ^ ^0.004 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{2:true}}} run scoreboard players remove @s Usjm.Temp 2
execute if data storage usjm:combat {Magic:{Movement:{2:true}}} positioned ^ ^ ^0.002 run function usjm-combat:magic/assets/generic/movement

execute if data storage usjm:combat {Magic:{Movement:{1:true}}} run scoreboard players remove @s Usjm.Temp 1
execute if data storage usjm:combat {Magic:{Movement:{1:true}}} positioned ^ ^ ^0.001 run function usjm-combat:magic/assets/generic/movement
