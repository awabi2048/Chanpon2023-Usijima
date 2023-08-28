## クエスト終了時 - 0001-zombie_slayer

# 終了処理
execute as @e[tag=Usjm.NPC.Marker] if data entity @s {data:{Usjm:{NPC:{Id:"0002-test_quester"}}}} run data modify entity @s data.Usjm.NPC.QuestStatus set value "Done"
