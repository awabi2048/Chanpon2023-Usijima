## モブの体力バーを更新 灰色
# 
scoreboard players remove $HealthBarDigit.Missing Usjm.Temp 1
data modify storage usjm:combat MobHealthBar.Missing append value "|"

execute if score $HealthBarDigit.Missing Usjm.Temp matches 1.. run function usjm-mobs:health_bar_updating/missing

