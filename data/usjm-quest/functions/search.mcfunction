## クエストをデータベースからIdで検索
# Idが一致するか検証
data modify storage usjm:quest Search.CompareSucceeded set value false
execute store success storage usjm:quest Search.CompareSucceeded byte 1 run data modify storage usjm:quest Search.Index[0].Id set from storage usjm:quest Search.in

# false → 一致時: outに[0]のデータを移動
execute if data storage usjm:quest {Search:{CompareSucceeded:false}} run data modify storage usjm:quest Search.out set from storage usjm:quest Search.Index[0]

# true → 不一致時: [0]を削除, データがあれば再帰
execute if data storage usjm:quest {Search:{CompareSucceeded:true}} run data remove storage usjm:quest Search.Index[0]
execute if data storage usjm:quest {Search:{CompareSucceeded:true}} if data storage usjm:quest Search.Index[0] run function usjm-quest:search
