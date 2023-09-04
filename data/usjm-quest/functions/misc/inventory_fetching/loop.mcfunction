## インベントリ内アイテム数カウント
# in のIdをコピー
data remove storage usjm:quest InventoryFetching.memory.in
data modify storage usjm:quest InventoryFetching.memory.in set from storage usjm:quest InventoryFetching.in

# 比較 
data modify storage usjm:quest InventoryFetching.memory.CompareResult set value false

execute store success storage usjm:quest InventoryFetching.memory.CompareResult byte 1 run data modify storage usjm:quest InventoryFetching.memory.in set from storage usjm:quest InventoryFetching.memory.Inventory[0].tag.Usjm.Id
execute unless data storage usjm:quest InventoryFetching.memory.Inventory[0].tag.Usjm.Id run data modify storage usjm:quest InventoryFetching.memory.CompareResult set value true

# 残り個数 >= 所持個数(= 処理後の残り個数が1以上) なら普通に減算
execute store result score $InventoryFetching-Count Usjm.Temp run data get storage usjm:quest InventoryFetching.memory.Inventory[0].Count
execute if data storage usjm:quest {InventoryFetching:{memory:{CompareResult:false}}} run scoreboard players operation $InventoryFetching-Remaining Usjm.Temp -= $InventoryFetching-Count Usjm.Temp

# [0]を削除して再帰
data remove storage usjm:quest InventoryFetching.memory.Inventory[0]
execute if data storage usjm:quest InventoryFetching.memory.Inventory[0] if score $InventoryFetching-Remaining Usjm.Temp matches 1.. run function usjm-quest:misc/inventory_fetching/loop
