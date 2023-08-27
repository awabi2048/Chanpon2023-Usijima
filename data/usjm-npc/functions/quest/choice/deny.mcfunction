## クエスト受注 - 辞退
#> 会話をリセット
# 紐付けから会話中のNPCを特定
execute as @e[tag=Usjm.NPC-Talking] if score @s Usjm.Link = @p[tag=Usjm.Player] Usjm.UUID run tag @s add Usjm.NPC-Interacted

# データの取り込み
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify storage usjm:npc NPCData set from entity @s data.Usjm.NPC

# 現在の会話データを初期状態に設定
data modify storage usjm:npc NPCData.Dialogue.Current set value []


#> 後処理
# データをMarkerに戻す
execute as @e[tag=Usjm.NPC-Interacted,limit=1] on passengers on passengers run data modify entity @s data.Usjm.NPC set from storage usjm:npc NPCData

# 紐付けを解除
scoreboard players reset @e[tag=Usjm.NPC-Interacted,limit=1] Usjm.Link

# タグ除去
tag @e[tag=Usjm.NPC-Interacted,limit=1] remove Usjm.NPC-Interacted
