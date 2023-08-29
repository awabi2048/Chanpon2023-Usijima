## 移動処理
#> バイナリ処理? みたいに
# 1000倍したスコアに変換
execute store result score $MarkerSpeed Usjm.Temp run data get entity @s data.Usjm.Magic.Speed 1000

# 
execute if score $MarkerSpeed Usjm.Temp matches 4096.. run tp @s ^ ^ ^40.96
execute if score $MarkerSpeed Usjm.Temp matches 4096.. run scoreboard players remove $MarkerSpeed Usjm.Temp 4096

execute if score $MarkerSpeed Usjm.Temp matches 2048.. run tp @s ^ ^ ^20.48
execute if score $MarkerSpeed Usjm.Temp matches 2048.. run scoreboard players remove $MarkerSpeed Usjm.Temp 2048

execute if score $MarkerSpeed Usjm.Temp matches 1024.. run tp @s ^ ^ ^10.24
execute if score $MarkerSpeed Usjm.Temp matches 1024.. run scoreboard players remove $MarkerSpeed Usjm.Temp 1024

execute if score $MarkerSpeed Usjm.Temp matches 512.. run tp @s ^ ^ ^5.12
execute if score $MarkerSpeed Usjm.Temp matches 512.. run scoreboard players remove $MarkerSpeed Usjm.Temp 512

execute if score $MarkerSpeed Usjm.Temp matches 256.. run tp @s ^ ^ ^2.56
execute if score $MarkerSpeed Usjm.Temp matches 256.. run scoreboard players remove $MarkerSpeed Usjm.Temp 256

execute if score $MarkerSpeed Usjm.Temp matches 128.. run tp @s ^ ^ ^1.28
execute if score $MarkerSpeed Usjm.Temp matches 128.. run scoreboard players remove $MarkerSpeed Usjm.Temp 128

execute if score $MarkerSpeed Usjm.Temp matches 64.. run tp @s ^ ^ ^0.64
execute if score $MarkerSpeed Usjm.Temp matches 64.. run scoreboard players remove $MarkerSpeed Usjm.Temp 64

execute if score $MarkerSpeed Usjm.Temp matches 32.. run tp @s ^ ^ ^0.32
execute if score $MarkerSpeed Usjm.Temp matches 32.. run scoreboard players remove $MarkerSpeed Usjm.Temp 32

execute if score $MarkerSpeed Usjm.Temp matches 16.. run tp @s ^ ^ ^0.16
execute if score $MarkerSpeed Usjm.Temp matches 16.. run scoreboard players remove $MarkerSpeed Usjm.Temp 16

execute if score $MarkerSpeed Usjm.Temp matches 8.. run tp @s ^ ^ ^0.08
execute if score $MarkerSpeed Usjm.Temp matches 8.. run scoreboard players remove $MarkerSpeed Usjm.Temp 8

execute if score $MarkerSpeed Usjm.Temp matches 4.. run tp @s ^ ^ ^0.04
execute if score $MarkerSpeed Usjm.Temp matches 4.. run scoreboard players remove $MarkerSpeed Usjm.Temp 4

execute if score $MarkerSpeed Usjm.Temp matches 2.. run tp @s ^ ^ ^0.02
execute if score $MarkerSpeed Usjm.Temp matches 2.. run scoreboard players remove $MarkerSpeed Usjm.Temp 2

execute if score $MarkerSpeed Usjm.Temp matches 1.. run tp @s ^ ^ ^0.01
execute if score $MarkerSpeed Usjm.Temp matches 1.. run scoreboard players remove $MarkerSpeed Usjm.Temp 1

