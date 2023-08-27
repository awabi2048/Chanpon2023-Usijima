## 体力再生
scoreboard players operation $HealthRegen.Regen Usjm.Temp = @s Usjm.PlayerStats.MaxHealth
scoreboard players operation $HealthRegen.Regen Usjm.Temp /= #12 Usjm.Constant 

scoreboard players operation @s Usjm.PlayerStats.Health += $HealthRegen.Regen Usjm.Temp

scoreboard players set @s Usjm.PlayerStats.HealthRegen.Timer 0
execute if score @s Usjm.PlayerStats.Health > @s Usjm.PlayerStats.MaxHealth run scoreboard players operation @s Usjm.PlayerStats.Health = @s Usjm.PlayerStats.MaxHealth

function usjm-player_stats:hp_bar
