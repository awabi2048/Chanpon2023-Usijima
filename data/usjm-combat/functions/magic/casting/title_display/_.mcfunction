data modify storage usjm:combat Magic.Title set value []
scoreboard players operation $Operation Usjm.Temp = @s Usjm.Combat.Magic.Casting-Operation
function usjm-combat:magic/casting/title_display/loop

title @s times 0t 30t 0t
title @s title ""
title @s subtitle [{"text": "［","color": "white"},{"nbt":"Magic.Title[0]","storage": "usjm:combat","interpret": true},{"text": " - ","color": "gray"},{"nbt":"Magic.Title[1]","storage": "usjm:combat","interpret": true},{"text": " - ","color": "gray"},{"nbt":"Magic.Title[2]","storage": "usjm:combat","interpret": true},{"text": "］","color": "white"}]
