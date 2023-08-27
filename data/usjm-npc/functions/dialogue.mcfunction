## NPCに話しかけた場合の処理
#> 単純会話
# 会話の処理
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify storage usjm:npc NPCData set from entity @s data.Usjm.NPC

#> 会話処理
# 話しかけられたことがなければ内容をコピー
execute unless data storage usjm:npc NPCData.Dialogue.Current[0] if data storage usjm:npc {NPCData:{QuestStatus:"Idle"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.Main
execute unless data storage usjm:npc NPCData.Dialogue.Current[0] if data storage usjm:npc {NPCData:{QuestStatus:"inProgress"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.DuringQuest
execute unless data storage usjm:npc NPCData.Dialogue.Current[0] if data storage usjm:npc {NPCData:{QuestStatus:"Done"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.AfterQuest

# Content[0]をtellraw後, 削除
execute if data storage usjm:npc NPCData.Dialogue.Current[1] run tellraw @s [{"text": "《","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Name","storage": "usjm:npc","interpret": true,"color": "white","bold": true},{"text": "》\uF824","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Dialogue.Current[0].text","storage": "usjm:npc","interpret": true,"color": "#bbbbbb","bold": false}]

# クエスト開始判定
execute if data storage usjm:npc NPCData.Dialogue.Current[0].Quest run scoreboard players enable @s Usjm.ChatTrigger
execute if data storage usjm:npc NPCData.Dialogue.Current[0].Quest run function usjm-npc:quest/dialogue

execute if data storage usjm:npc NPCData.Dialogue.Current[0] run data remove storage usjm:npc NPCData.Dialogue.Current[0]

# Markerにデータを戻す
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC set from storage usjm:npc NPCData

#> NPC別に処理
execute if data storage usjm:npc {NPCData:{Id:"0002-test_quester"}} run function usjm-npc:assets/0002-test_quester/on_talked

# タグ除去
tag @e[tag=Usjm.NPC-Interacted] remove Usjm.NPC-Interacted
