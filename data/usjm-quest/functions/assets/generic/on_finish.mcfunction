## クエスト終了時
# 進行中のクエストを検索
execute store result storage usjm:index Search.in int 1 run scoreboard players get @s Usjm.Questing-Id
data modify storage usjm:index Search.Index set from storage usjm:index quest

data modify storage usjm:index Search.out set value {}
function usjm-core:index_search

#> 報酬付与, クエストごと終了処理
# 報酬量を取得
execute store result score $QuestReward.Gold Usjm.Temp run data get storage usjm:index Search.out.Rewards.Gold
execute store result score $QuestReward.Exp Usjm.Temp run data get storage usjm:index Search.out.Rewards.Exp

# 報酬付与
scoreboard players operation @s Usjm.PlayerStats.Gold += $QuestReward.Gold Usjm.Temp
scoreboard players operation @s Usjm.PlayerStats.CurrentExp += $QuestReward.Exp Usjm.Temp

# 終了処理
function usjm-quest:on_finish

#> クエストの終了処理
# スコア等をリセット
scoreboard players set @s Usjm.Questing-Id -1
scoreboard players set @s Usjm.Questing-Progress 0

#> 演出
# クエストのタイプを取得, 表示用に加工
execute if data storage usjm:index {Search:{out:{Type:"Main"}}} run data modify storage usjm:quest Type set value '{"text":"メインクエスト","color":"red"}'
execute if data storage usjm:index {Search:{out:{Type:"Sub"}}} run data modify storage usjm:quest Type set value '{"text":"サブクエスト","color":"aqua"}'

# tellraw (完了通知・報酬)
tellraw @s [{"text": "［","color": "white"},{"nbt":"Type","storage": "usjm:quest","interpret": true},{"text": "］","color": "white"},"\uF824",{"text": "『","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:index","bold": true,"interpret": true,"color": "white"},{"text": "』","color": "white","bold": true},{"text": "\uF824\uF822を完了しました。","color": "#dddddd"}]
tellraw @s [{"text": "\uF829"},{"text": "報酬","color": "yellow","bold": true},{"text": ":","color": "gray","bold": false},{"text": "\uF824\uE0F4\uF822"},{"text": "+","color": "gray"},{"nbt":"Search.out.Rewards.Gold","storage": "usjm:index","color": "#ffffaa"},{"text": "\uF822G","color": "#ffffaa"}]
tellraw @s [{"text": "\uF82A\uF828\uF821\uE0F7\uF822"},{"text": "+","color": "gray"},{"nbt":"Search.out.Rewards.Exp","storage": "usjm:index","color": "#aaffaa"},{"text": "\uF822Exp","color": "#aaffaa"}]

# 効果音
playsound block.note_block.pling master @s ~ ~ ~ 1 2
playsound block.note_block.pling master @s ~ ~ ~ 1 1.78


