## クエスト受注 - 受諾
#> 前処理
# 紐付けから会話中のNPCを特定
execute as @e[tag=Usjm.NPC-Talking] if score @s Usjm.Link = @p[tag=Usjm.Player] Usjm.UUID run tag @s add Usjm.NPC-Interacted

data modify storage usjm:quest Search.in set from storage usjm:npc NPCData.Current[0]
data remove storage usjm:npc NPCData.Dialogue.Current[0]

#> クエストまわり処理
# クエスト進行中のフラグを設定
data modify storage usjm:npc NPCData.QuestStatus set value "inProgress"

# データをMarkerに戻す
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC set from storage usjm:npc NPCData

# クエストを検索
data modify storage usjm:quest Search.Index set from storage usjm:quest Index

data modify storage usjm:quest Search.out set value {}
function usjm-quest:search

#> 会話
# 最後の文章に進む
function usjm-npc:dialogue

#> プレイヤーへ通知
# 効果音
playsound entity.player.levelup master @s ~ ~ ~ 1 2

# 受注をtellraw
execute if data storage usjm:quest {Search:{out:{Type:"Main"}}} run data modify storage usjm:quest AcceptedType set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:quest {Search:{out:{Type:"Sub"}}} run data modify storage usjm:quest AcceptedType set value '{"text":"サブクエスト","color":"aqua"}'

tellraw @s [{"text": "［","color": "white"},{"nbt":"AcceptedType","storage": "usjm:quest","interpret": true},{"text": "］","color": "white"},"\uF824",{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:quest","bold": true,"interpret": true,"color": "white"},{"text": "』","color": "white","bold": true},{"text": "を受注しました！","color": "#dddddd"}]

#> 後処理
# 紐付けを解除
scoreboard players reset @e[tag=Usjm.NPC-Interacted,limit=1] Usjm.Link

# スコア関連
scoreboard players set @s Usjm.Questing-Progress 0
execute store result score @s Usjm.Questing-Id run data get storage usjm:quest Search.out.Id
