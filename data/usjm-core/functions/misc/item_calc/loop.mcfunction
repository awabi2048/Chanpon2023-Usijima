## インベントリ内アイテム数カウント
# in のIdをコピー
data remove storage usjm:temp ItemCalc.memory.in
data modify storage usjm:temp ItemCalc.memory.in set from storage usjm:temp ItemCalc.in

# 比較 → Id一致すれば加算
data modify storage usjm:temp ItemCalc.memory.CompareResult set value false

execute store success storage usjm:temp ItemCalc.memory.CompareResult byte 1 run data modify storage usjm:temp ItemCalc.memory.in set from storage usjm:temp ItemCalc.memory.Inventory[0].tag.Usjm.Id
execute unless data storage usjm:temp ItemCalc.memory.Inventory[0].tag.Usjm.Id run data modify storage usjm:temp ItemCalc.memory.CompareResult set value true

execute store result score $ItemCalc-Count Usjm.Temp run data get storage usjm:temp ItemCalc.memory.Inventory[0].Count
execute if data storage usjm:temp {ItemCalc:{memory:{CompareResult:false}}} run scoreboard players operation $ItemCalc-out Usjm.Temp += $ItemCalc-Count Usjm.Temp

tellraw @a [{"score":{"name": "$ItemCalc-out","objective": "Usjm.Temp"}}," , ",{"nbt":"ItemCalc.memory.Inventory[0].tag.Usjm.Id","storage": "usjm:temp"}]

# [0]を削除して再帰
data remove storage usjm:temp ItemCalc.memory.Inventory[0]
execute if data storage usjm:temp ItemCalc.memory.Inventory[0] run function usjm-core:misc/item_calc/loop
