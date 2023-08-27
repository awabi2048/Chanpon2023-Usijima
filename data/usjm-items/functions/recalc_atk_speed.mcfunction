# 武器攻撃力
execute store result score $AtkSpeed Usjm.Temp run data get storage usjm:items CustomGive.Stats.Damage 1000
execute if score $AtkSpeed Usjm.Temp matches 100000.. run scoreboard players remove $AtkSpeed Usjm.Temp 100000

scoreboard players operation $AtkSpeed Usjm.Temp /= #100 Usjm.Constant
scoreboard players add $AtkSpeed Usjm.Temp 8000

# 武器種類
execute if data storage usjm:items {ItemType:Sword} run scoreboard players set $AtkSpeedMultiple Usjm.Temp 100
execute if data storage usjm:items {ItemType:Hammer} run scoreboard players set $AtkSpeedMultiple Usjm.Temp 115
execute if data storage usjm:items {ItemType:Spear} run scoreboard players set $AtkSpeedMultiple Usjm.Temp 80
execute if data storage usjm:items {ItemType:Sickle} run scoreboard players set $AtkSpeedMultiple Usjm.Temp 90

scoreboard players operation $AtkSpeed Usjm.Temp *= $AtkSpeedMultiple Usjm.Temp
scoreboard players operation $AtkSpeed Usjm.Temp /= #100 Usjm.Constant

# 職業
scoreboard players set $AtkSpeedMultiple Usjm.Temp 100

execute if entity @s[tag=Usjm.Job-Swordsman] run scoreboard players set $AtkSpeedMultiple Usjm.Temp 100
execute if entity @s[tag=Usjm.Job-Wizard] run scoreboard players set $AtkSpeedMultiple Usjm.Temp 125
execute if entity @s[tag=Usjm.Job-Hunter] run scoreboard players set $AtkSpeedMultiple Usjm.Temp 90
execute if entity @s[tag=Usjm.Job-Warrior] run scoreboard players set $AtkSpeedMultiple Usjm.Temp 110

scoreboard players operation $AtkSpeed Usjm.Temp *= $AtkSpeedMultiple Usjm.Temp
scoreboard players operation $AtkSpeed Usjm.Temp /= #100 Usjm.Constant

# その他
scoreboard players set $AtkSpeedMultiple Usjm.Temp 100

scoreboard players operation $AtkSpeed Usjm.Temp *= $AtkSpeedMultiple Usjm.Temp
scoreboard players operation $AtkSpeed Usjm.Temp /= #100 Usjm.Constant

#Memo:(結果は1000倍値)
