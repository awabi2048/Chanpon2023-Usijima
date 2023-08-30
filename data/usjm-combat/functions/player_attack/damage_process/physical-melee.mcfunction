## 与ダメージ計算 (物理 近接)
# 基礎ダメージ値取得
execute store result score $FinalDamage Usjm.Temp run data get entity @p[tag=Usjm.AttackerPlayer] SelectedItem.tag.Usjm.ItemStats.Damage

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

# チャージ割合
execute store result score $AttackChargeMax Usjm.Temp run data get entity @p[tag=Usjm.AttackerPlayer] SelectedItem.tag.Usjm.ItemStats.AtkSpeed 1.75
scoreboard players operation $AttackChargePercent Usjm.Temp = @p[tag=Usjm.AttackerPlayer] Usjm.Combat.PlayerAttackCooldown

scoreboard players operation $AttackChargePercent Usjm.Temp *= #100 Usjm.Constant
scoreboard players operation $AttackChargePercent Usjm.Temp /= $AttackChargeMax Usjm.Temp

execute if score $AttackChargePercent Usjm.Temp matches 0 run scoreboard players set $DamageMultipleModifier Usjm.Temp 105
execute if score $AttackChargePercent Usjm.Temp matches 1.. run scoreboard players operation $DamageMultipleModifier Usjm.Temp = $AttackChargePercent Usjm.Temp

scoreboard players operation $DamageMultiple Usjm.Temp *= $DamageMultipleModifier Usjm.Temp
scoreboard players operation $DamageMultiple Usjm.Temp /= #100 Usjm.Constant

# クリティカルヒットか判定
data modify storage usjm:combat DamageProcessing.isCrit set value false
execute store result score $PlayerFallDistance Usjm.Temp run data get entity @p[tag=Usjm.AttackerPlayer] FallDistance 100

scoreboard players set $DamageMultipleModifier Usjm.Temp 100
execute if score $PlayerFallDistance Usjm.Temp matches 40.. run scoreboard players set $DamageMultipleModifier Usjm.Temp 120
execute if score $PlayerFallDistance Usjm.Temp matches 40.. run data modify storage usjm:combat DamageProcessing.isCrit set value true

execute if score $PlayerFallDistance Usjm.Temp matches 40.. run playsound entity.player.attack.crit master @p[tag=Usjm.AttackerPlayer] ~ ~ ~ 1 1
execute if score $PlayerFallDistance Usjm.Temp matches 40.. run particle crit ~ ~0.5 ~ 0 0 0 0.5 50

scoreboard players operation $DamageMultiple Usjm.Temp *= $DamageMultipleModifier Usjm.Temp
scoreboard players operation $DamageMultiple Usjm.Temp /= #100 Usjm.Constant

# 合算
scoreboard players operation $FinalDamage Usjm.Temp *= $DamageMultiple Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant

# ヒットしたモブの数に応じて増減
scoreboard players set $HitCount Usjm.Temp 0
execute store result score $HitCount Usjm.Temp if entity @e[tag=Usjm.Mobs-Hit]

scoreboard players operation $FinalDamage Usjm.Temp /= $HitCount Usjm.Temp
execute unless score $HitCount Usjm.Temp matches 2.. run return -1

scoreboard players operation $FinalDamage Usjm.Temp *= #180 Usjm.Temp
scoreboard players operation $FinalDamage Usjm.Temp /= #100 Usjm.Constant

