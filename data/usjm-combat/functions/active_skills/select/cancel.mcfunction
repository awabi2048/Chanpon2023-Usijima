
execute as @a[tag=Usjm.Player-SkillSelect] if score @s Usjm.Link = @e[tag=Usjm.Marker-SkillSelect,sort=nearest,limit=1] Usjm.Link run tag @s remove Usjm.Player-SkillSelect
kill @e[tag=Usjm.Marker-SkillSelect]