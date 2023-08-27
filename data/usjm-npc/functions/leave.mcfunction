## 会話を離れたとき
#> 会話を中断
# 会話データをリセット
execute as @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC.Dialogue.Current set value []
 
# 紐付けの解除
execute as @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] run scoreboard players reset @s Usjm.Link

#> 通知
# Tips

# 効果音
playsound ui.button.click master @s ~ ~ ~ 0.5 1.75

