## プレイヤーの視線を基準とした単位ベクトルの取得
# 原点付近にマーカー召喚
execute positioned 0.0 0.0 0.0 run summon marker ^ ^ ^1 {Tags:["Usjm.Misc.GetVector"]}

# マーカーのPosからそれぞれの成分を抽出
data modify storage usjm:misc UnitVector set from entity @e[tag=Usjm.Misc.GetVector,limit=1] Pos

# 後始末
kill @e[tag=Usjm.Misc.GetVector]
