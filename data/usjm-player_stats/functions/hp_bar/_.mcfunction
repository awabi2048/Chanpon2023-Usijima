## 体力バーの設定
# 満たされているもの・満たされていないものの個数を計算
scoreboard players operation $HealthBarDisplay.Remaining Usjm.Temp = @s Usjm.PlayerStats.Health
scoreboard players operation $HealthBarDisplay.Remaining Usjm.Temp *= #50 Usjm.Constant
scoreboard players operation $HealthBarDisplay.Remaining Usjm.Temp /= @s Usjm.PlayerStats.MaxHealth

scoreboard players set $HealthBarDisplay.Missing Usjm.Temp 50
scoreboard players operation $HealthBarDisplay.Missing Usjm.Temp -= $HealthBarDisplay.Remaining Usjm.Temp

# 求めた個数から実際の表示データを作成
data modify storage usjm-player_stats:temp HealthBarDisplay.Missing set value []
data modify storage usjm-player_stats:temp HealthBarDisplay.Remaining set value []

execute if score $HealthBarDisplay.Missing Usjm.Temp matches 1.. run function usjm-player_stats:hp_bar/set_missing
execute if score $HealthBarDisplay.Remaining Usjm.Temp matches 1.. run function usjm-player_stats:hp_bar/set_remaining

# 変更を検知するため, スコアを別口で保存
scoreboard players operation @s Usjm.PlayerStats.HealthDisplaying = @s Usjm.PlayerStats.Health


