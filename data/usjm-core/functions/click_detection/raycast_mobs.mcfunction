## プレイヤー視線追跡 敵が見つかり次第 trueを返す
execute positioned ^ ^ ^0.1 if block ~ ~ ~ #usjm:throughable if entity @s[distance=..10] run function usjm-core:click_detection/raycast_mobs
execute as @e[tag=Usjm.Mobs-Main,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run return 1

