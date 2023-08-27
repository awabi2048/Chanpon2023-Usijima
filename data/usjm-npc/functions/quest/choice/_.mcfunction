## クエスト受注/キャンセル時
#> 押下した選択肢によって処理分岐
execute if score @s Usjm.ChatTrigger matches 1001 run function usjm-npc:quest/choice/accept
execute if score @s Usjm.ChatTrigger matches 1002 run function usjm-npc:quest/choice/deny

#> 演出
# 効果音
playsound ui.button.click master @s ~ ~ ~ 1 2

# スコアをリセット
scoreboard players set @s Usjm.ChatTrigger -1

