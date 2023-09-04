## クエスト進捗処理: 共有処理
# クエスト目標討伐数を取得
execute store result score $QuestSubject Usjm.Temp run data get storage usjm:index Search.out.Subject.Count

# 進捗度合いを通知 (完了済み扱いでなければ)
execute if data storage usjm:quest {Search:{out:{Type:"Main"}}} run data modify storage usjm:quest Type set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:quest {Search:{out:{Type:"Sub"}}} run data modify storage usjm:quest Type set value '{"text":"サブクエスト","color":"aqua"}'

# tellraw @a {"score":{"name": "@s","objective": "Usjm.Questing-Progress"},"color": "yellow"}
execute if score @s Usjm.Questing-Progress < $QuestSubject Usjm.Temp run tellraw @s [{"text": "［","color": "white"},{"nbt":"Type","storage": "usjm:quest","interpret": true},{"text": "］","color": "white"},"\uF824",{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:index","bold": true,"interpret": true,"color": "white"},{"text": "』","color": "white","bold": true},{"text": "\uF824\uF822(","color": "white","bold": false},{"score":{"name": "@s","objective": "Usjm.Questing-Progress"},"color": "yellow"},{"text": "/","color": "gray"},{"nbt":"Search.out.Subject.Count","storage": "usjm:index","color": "gray"},{"text": ")","color": "white"}]

# 終了判定
execute if score @s Usjm.Questing-Progress >= $QuestSubject Usjm.Temp run function usjm-quest:assets/generic/on_finish
