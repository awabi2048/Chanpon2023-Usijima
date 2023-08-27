## クエスト受注依頼 Dialogue
#> 表示するクエストを検索 Idから
# 当該クエストをデータベースから検索
data modify storage usjm:quest Search.in set from storage usjm:npc NPCData.Current[0].Quest.Id
data modify storage usjm:quest Search.Index set from storage usjm:quest Index

data modify storage usjm:quest Search.out set value {}
function usjm-quest:search

#> 目標のデータを作成
data modify storage usjm:quest Display.Subject set value []

# Slayer → 検索, 
data modify storage usjm:mobs Search.in set from storage usjm:quest Search.out.Subject.Target
data modify storage usjm:mobs Search.Index set from storage usjm:mobs Index

data modify storage usjm:mobs Search.out set value {}
function usjm-mobs:search

data modify storage usjm:quest Display.Subject append value ""
execute if data storage usjm:quest {Search:{out:{Format:"Slayer"}}} run data modify storage usjm:quest Display.Subject[0] set from storage usjm:mobs Search.out.Name

# Visit, Other → そのまま表示
execute if data storage usjm:quest {Search:{out:{Format:"Visit"}}} run data modify storage usjm:quest Display.Subject[0] set from storage usjm:quest Search.out.Subject
execute if data storage usjm:quest {Search:{out:{Format:"Other"}}} run data modify storage usjm:quest Display.Subject[0] set from storage usjm:quest Search.out.Subject

#> 表示
# 選択肢を有効化
scoreboard players enable @s Usjm.ChatTrigger

# tellraw
tellraw @s [{"text": "===========","color":"gray"},{"text": "\uF823[Quest]\uF823","bold": true,"color":"yellow"},{"text": "===========","color":"gray"}]
tellraw @s ["\uF82A",{"text": "〈","color": "white","bold": true},{"nbt":"Search.out.DisplayName","storage": "usjm:quest","interpret": true,"color": "white","bold": true},{"text": "〉","color": "white","bold": true}]
tellraw @s " "
tellraw @s ["\uF824",{"text": "依頼内容","underlined": true},{"text": ":\uF824"},{"nbt":"Search.out.Description[0]","storage": "usjm:quest","interpret": true,"color": "white","bold": false}]
tellraw @s ["\uF824\uF828\uF822\uF82A",{"nbt":"Search.out.Description[1]","storage": "usjm:quest","interpret": true,"color": "white","bold": false}]
tellraw @s ["\uF824\uF828\uF822\uF82A",{"nbt":"Search.out.Description[2]","storage": "usjm:quest","interpret": true,"color": "white","bold": false}]
tellraw @s " "

execute if data storage usjm:quest {Search:{out:{Format:"Slayer"}}} run tellraw @s ["\uF824\uF822\uF829",{"text": "目標","underlined": true},{"text": ":\uF824","underlined": false},{"text": "〈","color": "white","bold": true},{"nbt":"Display.Subject[0]","storage": "usjm:quest","interpret": true,"color": "white","bold": true},{"text": "〉","color": "white","bold": true},{"text": "の討伐\uF824","color": "#dddddd"},{"text": "(","color": "#dddddd"},{"text": "0","color": "#ffaaaa"},{"text": "/","color": "gray"},{"nbt":"Search.out.Subject.Count","storage": "usjm:quest","color": "gray"},{"text": ")","color": "#dddddd"}]
execute if data storage usjm:quest {Search:{out:{Format:"Fetch"}}} run tellraw @s ["\uF824\uF822\uF829",{"text": "目標","underlined": true},{"text": ":\uF824","underlined": false},{"nbt":"Display.Subject[0]","storage": "usjm:quest","interpret": true,"color": "white","bold": true},{"text": "の納品\uF824«0/"},{"nbt":"Search.out.Subject.Count","storage": "usjm:quest"},{"text": "の納品\uF824","color": "#dddddd"},{"text": "(","color": "#dddddd"},{"text": "0","color": "#aaaaff"},{"text": "/","color": "gray"},{"nbt":"Search.out.Subject.Count","storage": "usjm:quest","color": "gray"},{"text": ")","color": "#dddddd"}]

execute if data storage usjm:quest {Search:{out:{Format:"Visit"}}} run tellraw @s ["\uF824\uF822\uF829",{"text": "目標","underlined": true},{"text": ":\uF824"},{"nbt":"Display.Subject[0]","storage": "usjm:quest","interpret": true,"color": "white","bold": false}]
execute if data storage usjm:quest {Search:{out:{Format:"Other"}}} run tellraw @s ["\uF824\uF822\uF829",{"text": "目標","underlined": true},{"text": ":\uF824"},{"nbt":"Display.Subject[0]","storage": "usjm:quest","interpret": true,"color": "white","bold": false}]

tellraw @s ["\uF824\uF822\uF829",{"text": "報酬","underlined": true},{"text": ":\uF824"},{"text": "\uE0F4","color": "white"},{"nbt":"Search.out.Rewards.Gold","storage": "usjm:quest","interpret": true,"color": "#ffffaa","bold": false},{"text": "G","color": "#ffffaa"}]
tellraw @s " "
tellraw @s ["\uF829\uF825",{"text": "［ 受注する ］","color": "green","hoverEvent": {"action": "show_text","contents": {"text": "クリックしてクエストを受注"}},"clickEvent": {"action": "run_command","value": "/trigger Usjm.ChatTrigger set 1001"}},"\uF828",{"text": "［ キャンセル ］","color": "red","hoverEvent": {"action": "show_text","contents": {"text": "クリックしてキャンセル"}},"clickEvent": {"action": "run_command","value": "/trigger Usjm.ChatTrigger set 1002"}}]

tellraw @s [{"text": "==============================","color":"gray"}]

#> 演出
# 効果音
playsound block.note_block.pling master @s ~ ~ ~ 1 0.75
