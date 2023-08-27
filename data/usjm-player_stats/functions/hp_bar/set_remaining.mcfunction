## Remaining
data modify storage usjm-player_stats:temp HealthBarDisplay.Remaining append value "|"
scoreboard players remove $HealthBarDisplay.Remaining Usjm.Temp 1

execute if score $HealthBarDisplay.Remaining Usjm.Temp matches 1.. run function usjm-player_stats:hp_bar/set_remaining
