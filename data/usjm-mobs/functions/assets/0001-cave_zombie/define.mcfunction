## 0001-cave_zombie: 召喚
#> データの設定
# 空のデータを設定
data modify storage usjm:index mobs append value {}

# 識別名
data modify storage usjm:index mobs[-1].Id set value "0001-cave_zombie"
data modify storage usjm:index mobs[-1].Name set value '{"text":"洞窟ゾンビ","color":"#ffffff","bold":false}'

# ステータス
data modify storage usjm:index mobs[-1].MaxHealth set value 80
data modify storage usjm:index mobs[-1].Health set value 80

data modify storage usjm:index mobs[-1].Strength set value 20
data modify storage usjm:index mobs[-1].Defence set value 25

data modify storage usjm:index mobs[-1].Speed set value 100

# ルート
data modify storage usjm:index mobs[-1].Loot.Exp set value 5
data modify storage usjm:index mobs[-1].Loot.Gold set value 5

data modify storage usjm:index mobs[-1].Loot.Item set value []
data modify storage usjm:index mobs[-1].Loot.Item append value {Id:"0001-rotten_flesh",Base:6}
data modify storage usjm:index mobs[-1].Loot.Item append value {Id:"0002-zombie_liver",Base:1}

# 属性
data modify storage usjm:index mobs[-1].Attribute set value "None"


