## マナ再生
scoreboard players operation $ManaRegen.Regen Usjm.Temp = @s Usjm.PlayerStats.ManaPool
scoreboard players operation $ManaRegen.Regen Usjm.Temp /= #15 Usjm.Constant 

scoreboard players operation @s Usjm.PlayerStats.Mana += $ManaRegen.Regen Usjm.Temp

scoreboard players set @s Usjm.PlayerStats.ManaRegen.Timer 0
execute if score @s Usjm.PlayerStats.Mana > @s Usjm.PlayerStats.ManaPool run scoreboard players operation @s Usjm.PlayerStats.Mana = @s Usjm.PlayerStats.ManaPool
