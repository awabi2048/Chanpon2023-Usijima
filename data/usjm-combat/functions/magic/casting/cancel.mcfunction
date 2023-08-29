## 詠唱キャンセル
#> もろもろリセット
# スコア
scoreboard players set @s Usjm.Combat.Magic.Casting-Count 0
scoreboard players set @s Usjm.Combat.Magic.Casting-Operation 0
scoreboard players set @s Usjm.Combat.Magic.Casting-Timer -1

#> 演出
# 効果音
playsound ui.button.click master @s ~ ~ ~ 0.5 0.75

# tellraw
tellraw @s [{"text": "＊詠唱をキャンセルしました。","color": "gray"}]
