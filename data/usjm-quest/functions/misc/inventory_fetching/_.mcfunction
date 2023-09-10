## インベントリ内を検索, アイテム納品
# inの値なければ処理中断
execute unless data storage usjm:quest InventoryFetching.in run say Error: no input
execute unless data storage usjm:quest InventoryFetching.in run return -1

# メモリリセット
data modify storage usjm:quest InventoryFetching.memory set value {}

# Inventory[]をコピー
data modify storage usjm:quest InventoryFetching.memory.Inventory set from entity @s Inventory

# 目標値を設定
execute if score @s Usjm.Questing-Progress matches 1.. run scoreboard players operation $InventoryFetching-Remaining Usjm.Temp = @s Usjm.Questing-Progress
execute if score @s Usjm.Questing-Progress matches 0 store result score $InventoryFetching-Remaining Usjm.Temp run data get storage usjm:index Search.out.Subject.Count

# 再帰処理
function usjm-quest:misc/inventory_fetching/loop

# in を削除
data remove storage usjm:quest InventoryFetching.in

#Memo: inにはId入れる
