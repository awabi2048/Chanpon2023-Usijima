## 与ダメージ計算 (物理 近接)
# レベル倍率
execute store result score $DamageMultiple Usjm.Temp run scoreboard players get @a[tag=Usjm.AttackerPlayer,limit=1] Usjm.PlayerStats.PlayerLevel
scoreboard players operation $DamageMultiple Usjm.Temp *= #2 Usjm.Constant

scoreboard players add $DamageMultiple Usjm.Temp 100

# 職業倍率
scoreboard players set $DamageMultipleModifier Usjm.Temp 100

execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Swordsman] run scoreboard players set $DamageMultipleModifier Usjm.Temp 100
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Wizard] run scoreboard players set $DamageMultipleModifier Usjm.Temp 75
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Hunter] run scoreboard players set $DamageMultipleModifier Usjm.Temp 135
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Warrior] run scoreboard players set $DamageMultipleModifier Usjm.Temp 90

scoreboard players operation $DamageMultiple Usjm.Temp *= $DamageMultipleModifier Usjm.Temp
scoreboard players operation $DamageMultiple Usjm.Temp /= #100 Usjm.Constant

# 合算
scoreboard players operation $FinalDamage Usjm.Temp *= $DamageMultiple Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant
