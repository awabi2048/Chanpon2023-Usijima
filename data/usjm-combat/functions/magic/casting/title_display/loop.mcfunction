

scoreboard players operation $OperationDigit Usjm.Temp = $Operation Usjm.Temp
scoreboard players operation $OperationDigit Usjm.Temp %= #10 Usjm.Constant

execute if score $OperationDigit Usjm.Temp matches 1 run data modify storage usjm:combat Magic.Title prepend value '{"text":"L","color":"red","bold":true}'
execute if score $OperationDigit Usjm.Temp matches 2 run data modify storage usjm:combat Magic.Title prepend value '{"text":"R","color":"green","bold":true}'

scoreboard players operation $Operation Usjm.Temp /= #10 Usjm.Constant
execute if score $Operation Usjm.Temp matches 1.. run function usjm-combat:magic/casting/title_display/loop

