## Missing
data modify storage usjm-player_stats:temp HealthBarDisplay.Missing append value "|"
scoreboard players remove $HealthBarDisplay.Missing Usjm.Temp 1

execute if score $HealthBarDisplay.Missing Usjm.Temp matches 1.. run function usjm-player_stats:hp_bar/set_missing
