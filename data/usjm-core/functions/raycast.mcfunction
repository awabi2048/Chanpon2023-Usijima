## 視線追跡
# NPCがいる場合は返り値1
execute as @e[tag=Usjm.NPC-HasDialogue,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run tag @s add Usjm.NPC-Interacted
execute as @e[tag=Usjm.NPC-HasDialogue,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 as @s[dx=0] run return 1

# 再帰
execute positioned ^ ^ ^0.1 if entity @s[distance=..3.5] run function usjm-core:raycast
