## モブに衝突処理
particle smoke ~ ~ ~ 0 0 0 0.1 10
playsound block.fire.extinguish master @a ~ ~ ~ 1 1.5

execute positioned ~-1 ~-1 ~-1 as @e[tag=Usjm.Mobs-Main,dx=2,dy=2,dz=2] run tag @s add Usjm.Mobs-Hit.Magic
