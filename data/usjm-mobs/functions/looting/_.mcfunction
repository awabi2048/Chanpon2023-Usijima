## アイテムのドロップ個数を計算・ドロップ
# N(試行回数)を計算
execute store result score $TrialNumber Usjm.Temp run data get storage usjm:mobs Looting.in[0].Base 1

scoreboard players add @s Usjm.PlayerStats.Luck 100

scoreboard players operation $TrialNumber Usjm.Temp *= @s Usjm.PlayerStats.Luck
scoreboard players operation $TrialNumber Usjm.Temp /= #100 Usjm.Constant

scoreboard players remove @s Usjm.PlayerStats.Luck 100

# loot_tableの機能から二項分布の値を求める
loot replace block 0 -64 0 container.0 loot usjm-mobs:looting
execute store result score $LootCount Usjm.Temp run data get block 0 -64 0 Items[0].Count

#> Loot Spawn用のアイテムデータを作成
# 処理前設定
data modify storage usjm:items Give.Id set from storage usjm:mobs Looting.in[0].Id
data modify storage usjm:items Give.hasUUID set value false

# アイテムデータ生成, 個数を設定
function usjm-items:assets/generic/place
execute store result block 0 -64 0 Items[0].Count int 1 run scoreboard players get $LootCount Usjm.Temp

#> アイテムを出力
loot spawn ~ ~ ~ mine 0 -64 0 debug_stick

#> 後処理
# 処理済みのデータを削除
data remove storage usjm:mobs Looting.in[0]

# 未処理のデータが残っていれば再帰
execute if data storage usjm:mobs Looting.in[0] run function usjm-mobs:looting/_
