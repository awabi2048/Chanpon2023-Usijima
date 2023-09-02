## プレイヤーのStatsアップデート
# Stats再計算
# 値リセット
scoreboard players operation @s Usjm.PlayerStats.MaxHealth = @s Usjm.PlayerStats.MaxHealth-Base
scoreboard players operation @s Usjm.PlayerStats.Defence = @s Usjm.PlayerStats.Defence-Base
scoreboard players operation @s Usjm.PlayerStats.ManaPool = @s Usjm.PlayerStats.ManaPool-Base
scoreboard players operation @s Usjm.PlayerStats.Luck = @s Usjm.PlayerStats.Luck-Base

data modify storage usjm:player_stats PlayerItem set value {Mainhand:{},Armor:[{},{},{},{}]}

# 手持ちアイテムと防具のデータ取得
data modify storage usjm:player_stats _ set from entity @s

data modify storage usjm:player_stats PlayerItem.Mainhand set from storage usjm:player_stats _.SelectedItem.tag.Usjm.ItemStats
data modify storage usjm:player_stats PlayerItem.Mainhand.ItemType set from storage usjm:player_stats _.SelectedItem.tag.Usjm.ItemType

data modify storage usjm:player_stats PlayerItem.Armor[0] set from storage usjm:player_stats _.Inventory[{Slot:100b}].tag.Usjm.ItemStats
data modify storage usjm:player_stats PlayerItem.Armor[1] set from storage usjm:player_stats _.Inventory[{Slot:101b}].tag.Usjm.ItemStats
data modify storage usjm:player_stats PlayerItem.Armor[2] set from storage usjm:player_stats _.Inventory[{Slot:102b}].tag.Usjm.ItemStats
data modify storage usjm:player_stats PlayerItem.Armor[3] set from storage usjm:player_stats _.Inventory[{Slot:103b}].tag.Usjm.ItemStats

data remove storage usjm:player_stats _

#> MaxHealth
execute store result score $MaxHealthBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[0].Health
scoreboard players operation @s Usjm.PlayerStats.MaxHealth += $MaxHealthBonus Usjm.Temp

execute store result score $MaxHealthBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[1].Health
scoreboard players operation @s Usjm.PlayerStats.MaxHealth += $MaxHealthBonus Usjm.Temp

execute store result score $MaxHealthBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[2].Health
scoreboard players operation @s Usjm.PlayerStats.MaxHealth += $MaxHealthBonus Usjm.Temp

execute store result score $MaxHealthBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[3].Health
scoreboard players operation @s Usjm.PlayerStats.MaxHealth += $MaxHealthBonus Usjm.Temp

execute store result score $MaxHealthBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Mainhand.Health
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run scoreboard players set $MaxHealthBonus Usjm.Temp 0

scoreboard players operation @s Usjm.PlayerStats.MaxHealth += $MaxHealthBonus Usjm.Temp

#> Defence
execute store result score $DefenceBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[0].Defence
scoreboard players operation @s Usjm.PlayerStats.Defence += $DefenceBonus Usjm.Temp

execute store result score $DefenceBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[1].Defence
scoreboard players operation @s Usjm.PlayerStats.Defence += $DefenceBonus Usjm.Temp

execute store result score $DefenceBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[2].Defence
scoreboard players operation @s Usjm.PlayerStats.Defence += $DefenceBonus Usjm.Temp

execute store result score $DefenceBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[3].Defence
scoreboard players operation @s Usjm.PlayerStats.Defence += $DefenceBonus Usjm.Temp

execute store result score $DefenceBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Mainhand.Defence
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run scoreboard players set $DefenceBonus Usjm.Temp 0

scoreboard players operation @s Usjm.PlayerStats.Defence += $DefenceBonus Usjm.Temp

#> ManaPool
execute store result score $ManaPoolBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[0].Mana
scoreboard players operation @s Usjm.PlayerStats.ManaPool += $ManaPoolBonus Usjm.Temp

execute store result score $ManaPoolBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[1].Mana
scoreboard players operation @s Usjm.PlayerStats.ManaPool += $ManaPoolBonus Usjm.Temp

execute store result score $ManaPoolBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[2].Mana
scoreboard players operation @s Usjm.PlayerStats.ManaPool += $ManaPoolBonus Usjm.Temp

execute store result score $ManaPoolBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[3].Mana
scoreboard players operation @s Usjm.PlayerStats.ManaPool += $ManaPoolBonus Usjm.Temp

execute store result score $ManaPoolBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Mainhand.Mana
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run scoreboard players set $ManaPoolBonus Usjm.Temp 0

scoreboard players operation @s Usjm.PlayerStats.ManaPool += $ManaPoolBonus Usjm.Temp

#> Luck
execute store result score $LuckBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[0].Luck
scoreboard players operation @s Usjm.PlayerStats.Luck += $LuckBonus Usjm.Temp

execute store result score $LuckBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[1].Luck
scoreboard players operation @s Usjm.PlayerStats.Luck += $LuckBonus Usjm.Temp

execute store result score $LuckBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[2].Luck
scoreboard players operation @s Usjm.PlayerStats.Luck += $LuckBonus Usjm.Temp

execute store result score $LuckBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Armor[3].Luck
scoreboard players operation @s Usjm.PlayerStats.Luck += $LuckBonus Usjm.Temp

execute store result score $LuckBonus Usjm.Temp run data get storage usjm:player_stats PlayerItem.Mainhand.Luck
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run scoreboard players set $LuckBonus Usjm.Temp 0

scoreboard players operation @s Usjm.PlayerStats.Luck += $LuckBonus Usjm.Temp

#> 攻撃速度
scoreboard players set $SubstantiveAtkSpeed Usjm.Temp 2000000
execute store result score $PlayerAtkSpeed Usjm.Temp run data get storage usjm:player_stats PlayerItem.Mainhand.AtkSpeed 1000

scoreboard players operation $SubstantiveAtkSpeed Usjm.Temp /= $PlayerAtkSpeed Usjm.Temp
scoreboard players remove $SubstantiveAtkSpeed Usjm.Temp 90

execute if data storage usjm:player_stats PlayerItem.Mainhand.ItemType unless data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run attribute @s generic.attack_speed base set 0

execute unless data storage usjm:player_stats PlayerItem.Mainhand.ItemType run attribute @s generic.attack_speed base set 4.0
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run attribute @s generic.attack_speed base set 4.0

data modify storage usjm:player_stats PlayerItem.hasAttackSpeed set value true

execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:"Armor"}}} run data modify storage usjm:player_stats PlayerItem.hasAttackSpeed set value false
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:"Crossbow"}}} run data modify storage usjm:player_stats PlayerItem.hasAttackSpeed set value false

execute if data storage usjm:player_stats {Give:{hasUUID:false}} run data modify storage usjm:player_stats PlayerItem.hasAttackSpeed set value false

execute if data storage usjm:player_stats PlayerItem.Mainhand.ItemType unless data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run item modify entity @s weapon.mainhand usjm-items:remove_attribute
execute if data storage usjm:player_stats PlayerItem.Mainhand.ItemType unless data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:Armor}}} run item modify entity @s weapon.mainhand usjm-items:set_atk_speed

execute store result score @s Usjm.Combat.PlayerAttackCooldown run data get entity @s SelectedItem.tag.Usjm.ItemStats.AtkSpeed

#> クロスボウ: チャージ目標時間
# 基礎値計算 (D^(1/2)+5 [t])
data modify storage math: in set from storage usjm:player_stats PlayerItem.Mainhand.Damage
function #math:sqrt

execute store result score $Crossbow.ChargeTime Usjm.Temp run data get storage math: out 1000
scoreboard players add $Crossbow.ChargeTime Usjm.Temp 5000

# 職業ボーナス
scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 100

execute if entity @s[tag=Usjm.Usjm.Job-Swordsman] run scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 110
execute if entity @s[tag=Usjm.Usjm.Job-Wizard] run scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 130
execute if entity @s[tag=Usjm.Usjm.Job-Hunter] run scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 75
execute if entity @s[tag=Usjm.Usjm.Job-Warrior] run scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 125

scoreboard players operation $Crossbow.ChargeTime Usjm.Temp *= $Crossbow.ChargeTimeModifier Usjm.Temp
scoreboard players operation $Crossbow.ChargeTime Usjm.Temp /= #100 Usjm.Constant

# レベルボーナス
scoreboard players set $Crossbow.ChargeTimeModifier Usjm.Temp 0

scoreboard players operation $Crossbow.ChargeTimeModifier Usjm.Temp = @s Usjm.PlayerStats.PlayerLevel
scoreboard players operation $Crossbow.ChargeTimeModifier Usjm.Temp *= #3 Usjm.Constant

scoreboard players operation $Crossbow.ChargeTimeModifier Usjm.Temp *= #-1 Usjm.Constant

scoreboard players add $Crossbow.ChargeTimeModifier Usjm.Temp 1000

scoreboard players operation $Crossbow.ChargeTime Usjm.Temp *= $Crossbow.ChargeTimeModifier Usjm.Temp
scoreboard players operation $Crossbow.ChargeTime Usjm.Temp /= #1000 Usjm.Constant

execute store result storage usjm:player_stats ChargeTime int 0.001 run scoreboard players get $Crossbow.ChargeTime Usjm.Temp
execute if data storage usjm:player_stats {PlayerItem:{Mainhand:{ItemType:"Crossbow"}}} run item modify entity @s weapon.mainhand usjm-items:crossbow/set_charge_time

#> HPバーセット
function usjm-player_stats:hp_bar

#> 雑多な
# 弓チャージがバグらないように
scoreboard players set @s Usjm.Combat.BowCharging 0

# トリガーのリセット
advancement revoke @s only usjm-player_stats:inventory_changed
scoreboard players operation @s Usjm.SelectedItemSlotLast = @s Usjm.SelectedItemSlot
