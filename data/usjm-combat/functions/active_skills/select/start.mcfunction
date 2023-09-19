## Active Skill選択画面
# tag
tag @s add Usjm.Player-SkillSelect

execute store result score @s Usjm.Link run data get entity @s UUID[0]
data modify entity @e[tag=Usjm.Marker-SkillSelect,sort=nearest,limit=1] Rotation set from entity @s Rotation
