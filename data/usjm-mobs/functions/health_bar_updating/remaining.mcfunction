## モブの体力バーを更新 緑
# 
scoreboard players remove $HealthBarDigit.Remaining Usjm.Temp 1
data modify storage usjm:combat MobHealthBar.Remaining append value "|"

execute if score $HealthBarDigit.Remaining Usjm.Temp matches 1.. run function usjm-mobs:health_bar_updating/remaining

