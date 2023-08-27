## 
## クエスト終了時
say aaa
# 進行中のクエストを検索
execute store result storage usjm:quest Search.in int 1 run scoreboard players get @s Usjm.Questing-Id
data modify storage usjm:quest Search.Index set from storage usjm:quest Index

data modify storage usjm:quest Search.out set value {}
function usjm-quest:search

# クエストのタイプを設定
execute if data storage usjm:quest {Search:{out:{Type:"Main"}}} run data modify storage usjm:quest Type set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:quest {Search:{out:{Type:"Sub"}}} run data modify storage usjm:quest Type set value '{"text":"サブクエスト","color":"aqua"}'

#> クエストの終了処理
# スコア等をリセット
scoreboard players set @s Usjm.Questing-Id -1
scoreboard players set @s Usjm.Questing-Progress 0

#> 演出
# tellraw
tellraw @s [{"text": "［","color": "white"},{"nbt":"Type","storage": "usjm:quest","interpret": true},{"text": "］","color": "white"},"\uF824",{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:quest","bold": true,"interpret": true,"color": "white"},{"text": "』","color": "white","bold": true},{"text": "を完了しました。","color": "gray"}]

# 効果音
playsound block.note_block.pling master @s ~ ~ ~ 1 2
playsound block.note_block.pling master @s ~ ~ ~ 1 1.78

# クエスト別処理
function usjm-quest:on_finish

