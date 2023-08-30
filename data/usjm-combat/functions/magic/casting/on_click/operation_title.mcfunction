

scoreboard players operation $OperationDigit Usjm.Temp = $Operation Usjm.Temp
scoreboard players operation $OperationDigit Usjm.Temp %= #10 Usjm.Constant

execute if score $OperationDigit Usjm.Temp matches 1 run data modify storage usjm:combat Magic.Title append value '{"text":"※L"}'
execute if score $OperationDigit Usjm.Temp matches 2 run data modify storage usjm:combat Magic.Title append value '{"text":"＊R"}'

scoreboard players operation $Operation Usjm.Temp /= #10 Usjm.Constant
