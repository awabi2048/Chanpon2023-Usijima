## Indexから検索
# Idが一致するか検証
data modify storage usjm:index Search.CompareSucceeded set value false
execute store success storage usjm:index Search.CompareSucceeded byte 1 run data modify storage usjm:index Search.Index[0].Id set from storage usjm:index Search.in

# false → 一致時: outに[0]のデータを移動
execute if data storage usjm:index {Search:{CompareSucceeded:false}} run data modify storage usjm:index Search.out set from storage usjm:index Search.Index[0]

# true → 不一致時: [0]を削除, データがあれば再帰
execute if data storage usjm:index {Search:{CompareSucceeded:true}} run data remove storage usjm:index Search.Index[0]
execute if data storage usjm:index {Search:{CompareSucceeded:true}} if data storage usjm:index Search.Index[0] run function usjm-core:index_search
