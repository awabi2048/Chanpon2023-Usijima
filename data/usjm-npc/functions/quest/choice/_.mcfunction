## クエスト受注/キャンセル時
execute if score @s Usjm.ChatTrigger matches 1001 run function usjm-npc:quest/choice/accept
execute if score @s Usjm.ChatTrigger matches 1002 run function usjm-npc:quest/choice/deny

# スコアをリセット
scoreboard players set @s Usjm.ChatTrigger -1
