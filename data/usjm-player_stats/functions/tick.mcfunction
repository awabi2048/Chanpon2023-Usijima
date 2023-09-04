## Tick
# 手に持ってるアイテムが変わった際
execute as @a[tag=Usjm.Player] store result score @s Usjm.SelectedItemSlot run data get entity @s SelectedItemSlot
execute as @a[tag=Usjm.Player] unless score @s Usjm.SelectedItemSlotLast = @s Usjm.SelectedItemSlot run function usjm-player_stats:update

# Stats表示
execute as @a[tag=Usjm.Player] run title @s actionbar [{"score":{"name": "@s","objective": "Usjm.PlayerStats.Mana"},"font": "-18"},{"text": "/","font": "-18"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.ManaPool"},"font": "-18","color": "gray"},{"text": "\uF82F"},{"text": "\uF82B"},{"text": "\uF828"},{"text": "\uF80B"},{"text": "\uF80A"},{"text": "\uE0F0","font": "-13"},{"text": "\uF822"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Health"},"font": "-13","color": "white"},{"text": "/","color": "gray","font": "-13"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.MaxHealth"},"font": "-13","color": "gray"},{"text": "\uF824"},{"text": "\uE0F1","font": "-13"},{"text": "\uF822"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Defence"},"font": "-13","color": "white"},{"text": "\uF82A"},{"text": "\uF828"},{"text": "\uE0F3","font": "-23"},{"text": "\uF822","font": "-18"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Mana"},"font": "-18","color": "#bbffff"},{"text": "/","color": "gray","font": "-18"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.ManaPool"},"font": "-18","color": "gray"},{"text": "\uF80A"},{"text": "\uF80C"},{"nbt":"HealthBarDisplay.Remaining","storage":"usjm-player_stats:temp","color": "red","interpret": true},{"nbt":"HealthBarDisplay.Missing","storage":"usjm-player_stats:temp","color": "dark_gray","interpret": true},{"text": "\uF82F"},{"text": "\uE0F0","font": "-13"},{"text": "\uF822"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Health"},"font": "-13","color": "white"},{"text": "/","color": "gray","font": "-13"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.MaxHealth"},"font": "-13","color": "gray"},{"text": "\uF824"},{"text": "\uE0F1","font": "-13"},{"text": "\uF822"},{"score":{"name": "@s","objective": "Usjm.PlayerStats.Defence"},"font": "-13","color": "white"},{"text": "\uF82A"},{"text": "\uE0F3","font": "-23"},{"text": "\uF822","font": "-18"}]

execute as @a[tag=Usjm.Player] unless score @s Usjm.PlayerStats.Health = @s Usjm.PlayerStats.HealthDisplaying run function usjm-player_stats:hp_bar/_

# マナ・体力回復
execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.Mana < @s Usjm.PlayerStats.ManaPool run scoreboard players operation @s Usjm.PlayerStats.ManaRegen.Timer += @s Usjm.PlayerStats.ManaRegen.Power
execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.Health < @s Usjm.PlayerStats.MaxHealth run scoreboard players operation @s Usjm.PlayerStats.HealthRegen.Timer += @s Usjm.PlayerStats.HealthRegen.Power

execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.Mana > @s Usjm.PlayerStats.ManaPool run scoreboard players operation @s Usjm.PlayerStats.Mana = @s Usjm.PlayerStats.ManaPool
execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.Health > @s Usjm.PlayerStats.MaxHealth run scoreboard players operation @s Usjm.PlayerStats.Health = @s Usjm.PlayerStats.MaxHealth

execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.ManaRegen.Timer matches 1000.. run function usjm-player_stats:regenerate/mana
execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.HealthRegen.Timer matches 1000.. run function usjm-player_stats:regenerate/health

# レベルアップ判定
execute as @a[tag=Usjm.Player] if score @s Usjm.PlayerStats.CurrentExp >= @s Usjm.PlayerStats.RequiredExp at @s run function usjm-player_stats:level_up

effect give @a[tag=Usjm.Player] saturation infinite 200 true
effect give @a[tag=Usjm.Player] resistance infinite 200 true

# 速度
function usjm-player_stats:speed/binary/branch/p
