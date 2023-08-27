## NPCに話しかけた場合の処理
#> 単純会話
# マーカーからデータ移動, プレイヤーと紐付け
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify storage usjm:npc NPCData set from entity @s data.Usjm.NPC
scoreboard players operation @e[tag=Usjm.NPC-Interacted,limit=1] Usjm.Link = @s Usjm.UUID

#> 会話に割り込まれないよう
# 話しかけている相手が会話中なら処理を中断, 通知
scoreboard players operation $PlayerUUID Usjm.Temp = @s Usjm.UUID
execute as @e[tag=Usjm.NPC-Interacted,limit=1] if entity @s[tag=Usjm.NPC-Talking] unless score @s Usjm.Link = $PlayerUUID Usjm.Temp run data modify storage usjm:npc NPCData.isTalking set value true

execute if data storage usjm:npc {NPCData:{isTalking:true}} run tellraw @s [{"text": "他の誰かと会話しているようだ。","color": "gray"}]
execute if data storage usjm:npc {NPCData:{isTalking:true}} run playsound ui.button.click master @s ~ ~ ~ 1 0.9

execute if data storage usjm:npc {NPCData:{isTalking:true}} run return -1

# 会話が新しく始まったならタグを付与
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} run tag @e[tag=Usjm.NPC-Interacted,limit=1] add Usjm.NPC-Talking

# 会話が終わったらタグ除去
execute if data storage usjm:npc NPCData.Dialogue.Current[0] unless data storage usjm:npc NPCData.Dialogue.Current[1] run tag @s remove Usjm.NPC-Talking

#> クエスト関連
# クエストを含む文か？
data modify storage usjm:npc NPCData.isQuest set value false
execute if data storage usjm:npc NPCData.Dialogue.Current[0].Quest run data modify storage usjm:npc NPCData.isQuest set value true

execute if data storage usjm:npc {NPCData:{isQuest:true}} run function usjm-npc:quest/dialogue

#> 会話処理
# 話しかけられたことがなければ内容をコピー
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} if data storage usjm:npc {NPCData:{QuestStatus:"Idle"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.Main
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} if data storage usjm:npc {NPCData:{QuestStatus:"inProgress"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.DuringQuest
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} if data storage usjm:npc {NPCData:{QuestStatus:"Done"}} run data modify storage usjm:npc NPCData.Dialogue.Current set from storage usjm:npc NPCData.Dialogue.Content.AfterQuest

# Content[0]をtellraw
execute if data storage usjm:npc NPCData.Dialogue.Current[0] if data storage usjm:npc {NPCData:{isQuest:false}} run tellraw @s [{"text": "《","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Name","storage": "usjm:npc","interpret": true,"color": "white","bold": true},{"text": "》\uF824","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Dialogue.Current[0].text","storage": "usjm:npc","interpret": true,"color": "#bbbbbb","bold": false}]

# 削除
execute if data storage usjm:npc NPCData.Dialogue.Current[0] unless data storage usjm:npc {NPCData:{isQuest:true}} run data remove storage usjm:npc NPCData.Dialogue.Current[0]

# Markerにデータを戻す
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC set from storage usjm:npc NPCData

#> NPC別の処理
execute if data storage usjm:npc {NPCData:{Id:"0002-test_quester"}} run function usjm-npc:assets/0002-test_quester/on_talked

# タグ除去
tag @e[tag=Usjm.NPC-Interacted] remove Usjm.NPC-Interacted
