## Active Skill選択画面
# tag
tag @s add Usjm.Player-SkillSelect

execute store result score @s Usjm.Link run data get entity @s UUID[0]

execute anchored eyes run summon marker ^ ^ ^ {Tags:["Usjm.Marker-SkillSelect"]}
scoreboard players set @e[tag=Usjm.Marker-SkillSelect,sort=nearest,limit=1] Usjm.InteractionTimer 20
scoreboard players operation @e[tag=Usjm.Marker-SkillSelect,sort=nearest,limit=1] Usjm.Link = @s Usjm.Link

execute anchored eyes run summon interaction ^ ^ ^ {Tags:["Usjm.Hitbox-SkillSelect"],width:2.0f,height:2.0f}
scoreboard players operation @e[tag=Usjm.Hitbox-SkillSelect,sort=nearest,limit=1] Usjm.Link = @s Usjm.Link

data modify entity @e[tag=Usjm.Marker-SkillSelect,sort=nearest,limit=1] Rotation set from entity @s Rotation
