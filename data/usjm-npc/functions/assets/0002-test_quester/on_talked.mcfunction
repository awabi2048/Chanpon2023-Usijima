## 0002-test_villager
# 効果音
playsound entity.villager.ambient master @a ~ ~ ~ 1 0.5

# プレイヤーのほう向かせる
execute at @e[tag=Usjm.NPC-Interacted,limit=1] facing entity @s eyes as @e[tag=Usjm.NPC-Interacted,limit=1] run tp @s ~ ~ ~ ~ ~
