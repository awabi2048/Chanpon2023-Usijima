## クエストの定義 - 0001-zombie_slayer
# 空データを作成
data modify storage usjm:index quest append value {}

#> 中身を設定
# 識別子
data modify storage usjm:index quest[-1].Id set value 1
data modify storage usjm:index quest[-1].Name set value "0001-zombie_slayer"

# 表示するデータ
data modify storage usjm:index quest[-1].DisplayName set value '{"text":"ゾンビ討伐"}'
data modify storage usjm:index quest[-1].Description set value ['{"text":"洞窟に"}','{"text":"ゾンビです。","bold":true}','{"text":""}']

data modify storage usjm:index quest[-1].Type set value "Sub"

# 報酬
data modify storage usjm:index quest[-1].Rewards set value {Gold:120,Exp:60}

# 目標物
data modify storage usjm:index quest[-1].Format set value "Slayer"

data modify storage usjm:index quest[-1].Subject.Target set value "0001-cave_zombie"
data modify storage usjm:index quest[-1].Subject.Count set value 12

# Origin
data modify storage usjm:index quest[-1].Origin.Type set value "NPC"
data modify storage usjm:index quest[-1].Origin.Id set value "0002-test_quester"
