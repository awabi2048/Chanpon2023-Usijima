## 0000-template: 召喚
# summon
summon skeleton ~ ~ ~ {Tags:["Usjm.Mobs","Usjm.Mobs-template","Usjm.Mobs-Main"]}

# 装備を変更
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.head with chainmail_helmet{Unbreakable:true}

# Idを設定
data modify storage usjm:mobs SpawnData.Id set value "0000-template"

#> 全mob共通の処理
function usjm-mobs:assets/generic/summon


