## NPCに話しかけた場合の処理
#> 単純会話
# マーカーからデータ移動, プレイヤーと紐付け
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify storage usjm:npc NPCData set from entity @s data.Usjm.NPC
scoreboard players operation @e[tag=Usjm.NPC-Interacted,limit=1] Usjm.Link = @s Usjm.UUID

#> NPC別の処理
execute if data storage usjm:npc {NPCData:{Id:"0002-test_quester"}} run function usjm-npc:assets/0002-test_quester/on_talked

#> 会話に割り込まれないよう
# 話しかけている相手が会話中なら処理を中断, 通知
scoreboard players operation $PlayerUUID Usjm.Temp = @s Usjm.UUID
execute as @e[tag=Usjm.NPC-Interacted,limit=1] if entity @s[tag=Usjm.NPC-Talking] unless score @s Usjm.Link = $PlayerUUID Usjm.Temp run data modify storage usjm:npc NPCData.isTalking set value true

execute if data storage usjm:npc {NPCData:{isTalking:true}} run tellraw @s [{"text": "他の誰かと会話しているようだ。","color": "gray"}]
execute if data storage usjm:npc {NPCData:{isTalking:true}} run playsound ui.button.click master @s ~ ~ ~ 1 0.9

execute if data storage usjm:npc {NPCData:{isTalking:true}} run return -1

#> 納品クエスト用の処理
# 該当クエストを受注中か判定
execute store result storage usjm:index Search.in int 1 run scoreboard players get @s Usjm.Questing-Id
data modify storage usjm:index Search.Index set from storage usjm:index quest

function usjm-core:index_search

# 受注中かつ、プレイヤーが目標アイテムを手に持っていれば処理
data modify storage usjm:npc QuestFetching.TargetItem set from storage usjm:index Search.out.Subject.Target
data modify storage usjm:npc QuestFetching.PlayerItem set from entity @s SelectedItem.tag.Usjm.Id
data modify storage usjm:npc QuestFetching.Unavailable set value false
 
execute store success storage usjm:npc QuestFetching.Unavailable byte 1 run data modify storage usjm:npc QuestFetching.TargetItem set from storage usjm:npc QuestFetching.PlayerItem

execute unless data storage usjm:index {Search:{out:{Format:"Fetch"}}} run data modify storage usjm:npc QuestFetching.Unavailable set value false

execute if data storage usjm:npc {QuestFetching:{Unavailable:false}} run function usjm-quest:assets/generic/on_progress/fetch
execute if data storage usjm:npc {QuestFetching:{Unavailable:false}} run return -1

#> 割り込み防止処理
# 会話が新しく始まったならタグを付与
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} run tag @e[tag=Usjm.NPC-Interacted,limit=1] add Usjm.NPC-Talking

# 会話が終わったらタグ除去
execute if data storage usjm:npc NPCData.Dialogue.Current[0] unless data storage usjm:npc NPCData.Dialogue.Current[1] run tag @s remove Usjm.NPC-Talking

data modify storage usjm:npc NPCData.isBlank set value false
execute if data storage usjm:npc {NPCData:{Dialogue:{Current:[]}}} run data modify storage usjm:npc NPCData.isBlank set value true

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
execute if data storage usjm:npc NPCData.Dialogue.Current[0] if data storage usjm:npc {NPCData:{isQuest:false}} unless data storage usjm:npc {NPCData:{isBlank:true}} run tellraw @s [{"text": "《","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Name","storage": "usjm:npc","interpret": true,"color": "white","bold": true},{"text": "》\uF824","color": "white","bold": true,"italic": false},{"nbt":"NPCData.Dialogue.Current[0].text","storage": "usjm:npc","interpret": true,"color": "#bbbbbb","bold": false}]

# 削除
execute if data storage usjm:npc NPCData.Dialogue.Current[0] unless data storage usjm:npc {NPCData:{isQuest:true}} unless data storage usjm:npc {NPCData:{isBlank:true}} run data remove storage usjm:npc NPCData.Dialogue.Current[0]

# Markerにデータを戻す
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC set from storage usjm:npc NPCData


# タグ除去
tag @e[tag=Usjm.NPC-Interacted] remove Usjm.NPC-Interacted
