## Load
function usjm-mobs:load
function usjm-player_stats:load
function usjm-combat:load
function usjm-items:load
function usjm-menu:load
function usjm-npc:load
function usjm-quest:load

# 当たり判定用
team add Usjm.NoCollision
team modify Usjm.NoCollision collisionRule never

# 紐付け用
scoreboard objectives add Usjm.UUID dummy


# スコアボード定義
scoreboard objectives add Usjm.Temp dummy
scoreboard objectives add Usjm.Constant dummy
scoreboard objectives add Usjm.Link dummy

scoreboard objectives add Usjm.Sneaking minecraft.custom:sneak_time

scoreboard players set #-1 Usjm.Constant -1
scoreboard players set #2 Usjm.Constant 2
scoreboard players set #6 Usjm.Constant 6
scoreboard players set #8 Usjm.Constant 8
scoreboard players set #10 Usjm.Constant 10
scoreboard players set #12 Usjm.Constant 12
scoreboard players set #15 Usjm.Constant 15
scoreboard players set #16 Usjm.Constant 16
scoreboard players set #20 Usjm.Constant 20
scoreboard players set #25 Usjm.Constant 25
scoreboard players set #30 Usjm.Constant 30
scoreboard players set #32 Usjm.Constant 32
scoreboard players set #50 Usjm.Constant 50
scoreboard players set #64 Usjm.Constant 64
scoreboard players set #66 Usjm.Constant 66
scoreboard players set #100 Usjm.Constant 100
scoreboard players set #180 Usjm.Constant 180
scoreboard players set #200 Usjm.Constant 200
scoreboard players set #200 Usjm.Constant 300
scoreboard players set #1000 Usjm.Constant 1000


scoreboard objectives add Usjm.InteractionTimer dummy


scoreboard objectives add Usjm.Sidebar dummy [{"text":"|||","color": "white","bold": true,"obfuscated": true},{"text":"\uF824USI RPG\uF824","color": "gold","bold": true,"obfuscated": false},{"text":"|||","color": "white","bold": true,"obfuscated": true}]
