## 0001-cave_zombie: 召喚
# summon
summon zombie ~ ~ ~ {Tags:["Usjm.Mobs","Usjm.Mobs-cave_zombie","Usjm.Mobs-Main"]}

# 装備を変更
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.head with leather_helmet{Unbreakable:true}

# Idを設定
data modify storage usjm:mobs SpawnData.Id set value "0001-cave_zombie"

#> 全mob共通の処理
function usjm-mobs:assets/generic/summon


