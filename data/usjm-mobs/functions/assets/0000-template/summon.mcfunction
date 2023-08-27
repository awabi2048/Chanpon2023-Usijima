## 0000-template: 召喚
#> 実際のエンティティ関連
# summon
summon skeleton ~ ~ ~ {Tags:["Usjm.Mobs","Usjm.Mobs-template","Usjm.Mobs-Main"]}

# 装備を変更
item replace entity @e[tag=Usjm.Mobs-Main,sort=nearest,limit=1] armor.head with chainmail_helmet{Unbreakable:true}

#> データの設定
# リセット
data modify storage usjm:mobs SpawnData set value {}

# 識別名
data modify storage usjm:mobs SpawnData.Id set value "0000-template"
data modify storage usjm:mobs SpawnData.Name set value '{"text":"template","color":"#aa0000","bold":false}'

# ステータス
data modify storage usjm:mobs SpawnData.MaxHealth set value 500
data modify storage usjm:mobs SpawnData.Health set value 500

data modify storage usjm:mobs SpawnData.Strength set value 200
data modify storage usjm:mobs SpawnData.Defence set value 100

data modify storage usjm:mobs SpawnData.Speed set value 500

# ルート
data modify storage usjm:mobs SpawnData.ExpAmount set value 50
data modify storage usjm:mobs SpawnData.GoldAmount set value 256

# 属性
data modify storage usjm:mobs SpawnData.Attribute set value "None"

#> 全mob共通の処理
function usjm-mobs:assets/generic/summon


