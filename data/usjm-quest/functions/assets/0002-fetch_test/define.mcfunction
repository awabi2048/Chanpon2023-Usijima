## クエストの定義 - 0002-fetch_test
# 空データを作成
data modify storage usjm:index quest append value {}

#> 中身を設定
# 識別子
data modify storage usjm:index quest[-1].Id set value 2
data modify storage usjm:index quest[-1].Name set value "0002-fetch_test"

# 表示するデータ
data modify storage usjm:index quest[-1].DisplayName set value '{"text":"おつかいテスト"}'
data modify storage usjm:index quest[-1].Description set value ['{"text":"ゾンビの肝を持ってこよう"}','{"text":"","bold":true}','{"text":""}']

data modify storage usjm:index quest[-1].Type set value "Sub"

# 報酬
data modify storage usjm:index quest[-1].Rewards set value {Gold:200,Exp:100}

# 目標物
data modify storage usjm:index quest[-1].Format set value "Fetch"

data modify storage usjm:index quest[-1].Subject.Target set value "0002-zombie_liver"
data modify storage usjm:index quest[-1].Subject.Count set value 20

# Origin
data modify storage usjm:index quest[-1].Origin.Type set value "NPC"
data modify storage usjm:index quest[-1].Origin.Id set value "0002-test_quester"
