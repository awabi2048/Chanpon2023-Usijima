## 0001-cave_zombie: 召喚
#> データの設定
# 空のデータを設定
data modify storage usjm:mobs Index append value {}

# 識別名
data modify storage usjm:mobs Index[-1].Id set value "0001-cave_zombie"
data modify storage usjm:mobs Index[-1].Name set value '{"text":"洞窟ゾンビ","color":"#ffffff","bold":false}'

# ステータス
data modify storage usjm:mobs Index[-1].MaxHealth set value 80
data modify storage usjm:mobs Index[-1].Health set value 80

data modify storage usjm:mobs Index[-1].Strength set value 20
data modify storage usjm:mobs Index[-1].Defence set value 25

data modify storage usjm:mobs Index[-1].Speed set value 100

# ルート
data modify storage usjm:mobs Index[-1].ExpAmount set value 5
data modify storage usjm:mobs Index[-1].GoldAmount set value 5

# 属性
data modify storage usjm:mobs Index[-1].Attribute set value "None"


