## クエスト受注依頼 Dialogue
tellraw @s [{"text": "===========","color":"gray"},{"text": "\uF823[Quest]\uF823","bold": true,"color":"yellow"},{"text": "===========","color":"gray"}]
tellraw @s ["\uF82A",{"text": "〈","color": "white","bold": true},{"nbt":"NPCData.Dialogue.Current[0].Quest.Name","storage": "usjm:npc","interpret": true,"color": "white","bold": true},{"text": "〉","color": "white","bold": true}]
tellraw @s " "
tellraw @s ["\uF824",{"text": "依頼内容","underlined": true},{"text": ":\uF824"},{"nbt":"NPCData.Dialogue.Current[0].Quest.Description.Info[0]","storage": "usjm:npc","interpret": true,"color": "white","bold": false}]
tellraw @s ["\uF824\uF828\uF822\uF82A",{"nbt":"NPCData.Dialogue.Current[0].Quest.Description.Info[1]","storage": "usjm:npc","interpret": true,"color": "white","bold": false}]
tellraw @s ["\uF824\uF828\uF822\uF82A",{"nbt":"NPCData.Dialogue.Current[0].Quest.Description.Info[2]","storage": "usjm:npc","interpret": true,"color": "white","bold": false}]
tellraw @s " "
tellraw @s ["\uF824\uF822\uF829",{"text": "目標","underlined": true},{"text": ":\uF824"},{"nbt":"NPCData.Dialogue.Current[0].Quest.Description.Subject","storage": "usjm:npc","interpret": true,"color": "white","bold": false}]
tellraw @s ["\uF824\uF822\uF829",{"text": "報酬","underlined": true},{"text": ":\uF824"},{"text": "\uE0F4","color": "white"},{"nbt":"NPCData.Dialogue.Current[0].Quest.Rewards.Gold","storage": "usjm:npc","interpret": true,"color": "#ffffaa","bold": false},{"text": "G","color": "#ffffaa"}]
tellraw @s " "
tellraw @s ["\uF829\uF825",{"text": "［ 受注する ］","color": "green","hoverEvent": {"action": "show_text","contents": {"text": "クリックしてクエストを受注"}},"clickEvent": {"action": "run_command","value": "/trigger Usjm.ChatTrigger set 1001"}},"\uF828",{"text": "［ キャンセル ］","color": "red","hoverEvent": {"action": "show_text","contents": {"text": "クリックしてキャンセル"}},"clickEvent": {"action": "run_command","value": "/trigger Usjm.ChatTrigger set 1002"}}]

tellraw @s [{"text": "==============================","color":"gray"}]
