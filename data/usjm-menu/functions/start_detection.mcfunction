# 閉じた判定用
execute anchored eyes run summon marker ^ ^ ^ {Tags:["Usjm.Menu-Marker"]}
execute anchored eyes positioned ^ ^ ^ run scoreboard players operation @e[tag=Usjm.Menu-Marker,sort=nearest,limit=1] Usjm.Link = @s Usjm.Link

execute anchored eyes positioned ^ ^ ^ run tp @e[tag=Usjm.Menu-Marker,sort=nearest,limit=1] ^ ^ ^32
