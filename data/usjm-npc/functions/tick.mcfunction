## Tick
# 選択肢を選んだ判定
execute as @a[tag=Usjm.Player] at @s if score @s Usjm.ChatTrigger matches 1001.. run function usjm-npc:quest/choice/_

# NPCから一定以上離れたら会話を中断
execute as @a[tag=Usjm.Player] at @s if score @e[tag=Usjm.NPC-Main,sort=nearest,limit=1] Usjm.Link = @s Usjm.UUID unless entity @e[tag=Usjm.NPC-Main,sort=nearest,limit=1,distance=..4] run function usjm-npc:leave
