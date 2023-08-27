## MobをデータベースからIdで検索
# Idが一致するか検証
data modify storage usjm:mobs Search.CompareSucceeded set value false
execute store success storage usjm:mobs Search.CompareSucceeded byte 1 run data modify storage usjm:mobs Search.Index[0].Id set from storage usjm:mobs Search.in

# false → 一致時: outに[0]のデータを移動
execute if data storage usjm:mobs {Search:{CompareSucceeded:false}} run data modify storage usjm:mobs Search.out set from storage usjm:mobs Search.Index[0]

# true → 不一致時: [0]を削除, データがあれば再帰
execute if data storage usjm:mobs {Search:{CompareSucceeded:true}} run data remove storage usjm:mobs Search.Index[0]
execute if data storage usjm:mobs {Search:{CompareSucceeded:true}} if data storage usjm:mobs Search.Index[0] run function usjm-mobs:search
