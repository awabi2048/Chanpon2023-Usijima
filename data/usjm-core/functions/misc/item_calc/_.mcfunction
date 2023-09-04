## インベントリ内アイテム個数を取得
# inの値なければ処理中断
execute unless data storage usjm:temp ItemCalc.in run say Error: no input
execute unless data storage usjm:temp ItemCalc.in run return -1

# メモリリセット
data modify storage usjm:temp ItemCalc.memory set value {}

# Inventory[]をコピー
data modify storage usjm:temp ItemCalc.memory.Inventory set from entity @s Inventory

# スコアリセット
scoreboard players set $ItemCalc-out Usjm.Temp 0

# 再帰処理
function usjm-core:misc/item_calc/loop

# in を削除
data remove storage usjm:temp ItemCalc.in

#Memo: inにはId入れる
