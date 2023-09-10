## インベントリ内アイテム数カウント
# in のIdをコピー
data remove storage usjm:quest InventoryFetching.memory.in
data modify storage usjm:quest InventoryFetching.memory.in set from storage usjm:quest InventoryFetching.in

# 比較 
data modify storage usjm:quest InventoryFetching.memory.CompareResult set value false

execute store success storage usjm:quest InventoryFetching.memory.CompareResult byte 1 run data modify storage usjm:quest InventoryFetching.memory.in set from storage usjm:quest InventoryFetching.memory.Inventory[0].tag.Usjm.Id
execute unless data storage usjm:quest InventoryFetching.memory.Inventory[0].tag.Usjm.Id run data modify storage usjm:quest InventoryFetching.memory.CompareResult set value true

# 処理中スロットのアイテム数を取得
scoreboard players set $InventoryFetching-SlotItem Usjm.Temp 0
execute if data storage usjm:quest {InventoryFetching:{memory:{CompareResult:false}}} store result score $InventoryFetching-SlotItem Usjm.Temp run data get storage usjm:quest InventoryFetching.memory.Inventory[0].Count

# 数量関係を判定
execute if score $InventoryFetching-Remaining Usjm.Temp >= $InventoryFetching-SlotItem Usjm.Temp run data modify storage usjm:quest InventoryFetching.ClearSlot set value false
execute if score $InventoryFetching-Remaining Usjm.Temp < $InventoryFetching-SlotItem Usjm.Temp run data modify storage usjm:quest InventoryFetching.ClearSlot set value true

execute if data storage usjm:quest {InventoryFetching:{memory:{CompareResult:true}}} run data remove storage usjm:quest InventoryFetching.ClearSlot

# 残り個数 >= 処理中スロットの個数 ならスロットを消去
execute if data storage usjm:quest {InventoryFetching:{ClearSlot:false}} run scoreboard players operation $InventoryFetching-Remaining Usjm.Temp -= $InventoryFetching-SlotItem Usjm.Temp
execute if data storage usjm:quest {InventoryFetching:{ClearSlot:false}} run data modify storage usjm:quest InventoryFetching.memory.Slot set value {Slot:0b}

# 残り個数 < 所持個数 なら減算した結果をスロットに配置
execute if data storage usjm:quest {InventoryFetching:{ClearSlot:true}} run scoreboard players operation $InventoryFetching-SlotItem Usjm.Temp -= $InventoryFetching-Remaining Usjm.Temp
execute if data storage usjm:quest {InventoryFetching:{ClearSlot:true}} run scoreboard players set $InventoryFetching-Remaining Usjm.Temp 0

execute if data storage usjm:quest {InventoryFetching:{ClearSlot:true}} run data modify storage usjm:quest InventoryFetching.memory.Slot set from storage usjm:quest InventoryFetching.memory.Inventory[0]
execute if data storage usjm:quest {InventoryFetching:{ClearSlot:true}} run data modify storage usjm:quest InventoryFetching.memory.Slot.Slot set value 0b

execute if data storage usjm:quest {InventoryFetching:{ClearSlot:true}} store result storage usjm:quest InventoryFetching.memory.Slot.Count byte 1 run scoreboard players get $InventoryFetching-SlotItem Usjm.Temp

#> スロットを置換 (プレイヤーのデータを直接操作するは出来ないため, 別コンテナを経由)
# 置換元のコンテナを設置, セットアップ
setblock 0 -64 0 shulker_box replace
item replace block 0 -64 0 container.0 with stone

# 置換先スロットの番号とデータを設定
data modify storage usjm:quest InventoryFetching.ReplacingSlot set from storage usjm:quest InventoryFetching.memory.Inventory[0].Slot
data modify block 0 -64 0 Items[0] set from storage usjm:quest InventoryFetching.memory.Slot

# スロットの置換
execute if data storage usjm:quest {InventoryFetching:{memory:{CompareResult:false}}} run function usjm-quest:misc/inventory_fetching/replace_slot

#> 再帰
# 完了したか判定
data modify storage usjm:quest InventoryFetching.Done set value false
execute if score $InventoryFetching-Remaining Usjm.Temp matches 0 run data modify storage usjm:quest InventoryFetching.Done set value true

# [0]を削除して再帰
data remove storage usjm:quest InventoryFetching.memory.Inventory[0]
execute if data storage usjm:quest InventoryFetching.memory.Inventory[0] if data storage usjm:quest {InventoryFetching:{Done:true}} run function usjm-quest:misc/inventory_fetching/loop
