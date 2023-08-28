## 0000-template: 召喚
#> データの設定
# 空のデータを設定
data modify storage usjm:index mobs append value {}

# 識別名
data modify storage usjm:index mobs[-1].Id set value "0000-template"
data modify storage usjm:index mobs[-1].Name set value '{"text":"template","color":"#ff0000","bold":false}'

# ステータス
data modify storage usjm:index mobs[-1].MaxHealth set value 500
data modify storage usjm:index mobs[-1].Health set value 500

data modify storage usjm:index mobs[-1].Strength set value 300
data modify storage usjm:index mobs[-1].Defence set value 200

data modify storage usjm:index mobs[-1].Speed set value 100

# ルート
data modify storage usjm:index mobs[-1].ExpAmount set value 100
data modify storage usjm:index mobs[-1].GoldAmount set value 100

# 属性
data modify storage usjm:index mobs[-1].Attribute set value "None"


