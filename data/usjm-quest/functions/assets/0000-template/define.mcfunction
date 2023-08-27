## クエストの定義 - 0001-zombie_slayer
# 空データを作成
data modify storage usjm:quest Index append value {}

#> 中身を設定
# 識別子
data modify storage usjm:quest Index[-1].Id set value 1
data modify storage usjm:quest Index[-1].Name set value "0000-template"

# 表示するデータ
data modify storage usjm:quest Index[-1].DisplayName set value '{"text":"template"}'
data modify storage usjm:quest Index[-1].Description set value ['{"text":"あああ"}','{"text":"かきく"}','{"text":"ややや"}']

# 報酬
data modify storage usjm:quest Index[-1].Rewards set value {Gold:100,Exp:50}

# 目標物
data modify storage usjm:quest Index[-1].Format set value "Other"

data modify storage usjm:quest Index[-1].Subject set value '{"text":"subject"}'

data modify storage usjm:quest Index[-1].Progress set value 0
