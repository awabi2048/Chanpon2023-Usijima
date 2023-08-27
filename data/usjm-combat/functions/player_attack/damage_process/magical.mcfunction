## 与ダメージ計算 (物理 近接)
# レベル倍率
execute store result score $DamageMultiple Usjm.Temp run scoreboard players get @a[tag=Usjm.AttackerPlayer,limit=1] Usjm.PlayerStats.PlayerLevel
scoreboard players operation $DamageMultiple Usjm.Temp *= #2 Usjm.Constant

scoreboard players add $DamageMultiple Usjm.Temp 100

# 職業倍率
scoreboard players set $DamageMultipleModifier Usjm.Temp 100

execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Swordsman] run scoreboard players set $DamageMultipleModifier Usjm.Temp 100
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Wizard] run scoreboard players set $DamageMultipleModifier Usjm.Temp 80
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Hunter] run scoreboard players set $DamageMultipleModifier Usjm.Temp 110
execute as @p[tag=Usjm.AttackerPlayer] if entity @s[tag=Usjm.Job-Warrior] run scoreboard players set $DamageMultipleModifier Usjm.Temp 120

scoreboard players operation $DamageMultiple Usjm.Temp *= $DamageMultipleModifier Usjm.Temp
scoreboard players operation $DamageMultiple Usjm.Temp /= #100 Usjm.Constant

# ヒットしたモブの数に応じて増減
scoreboard players set $HitCount Usjm.Temp 0
execute store result score $HitCount Usjm.Temp if entity @e[tag=Usjm.Mobs-Hit]

scoreboard players remove $HitCount Usjm.Temp 10
scoreboard players operation $HitCount Usjm.Temp *= #-1 Usjm.Constant

scoreboard players operation $FinalDamage Usjm.Temp *= $HitCount Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #10 Usjm.Constant

# 合算
scoreboard players operation $FinalDamage Usjm.Temp *= $DamageMultiple Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant
