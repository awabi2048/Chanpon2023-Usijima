## Mob召喚 (Test Zombie)
# 本体召喚
summon villager ~ ~ ~ {Tags:["Usjm.NPC","Usjm.NPC-Main","Usjm.NPC-HasDialogue"],Invulnerable:true,Silent:true}

# 装備の設定


#> データ設定
data modify storage usjm:npc SpawnData set value {}

data modify storage usjm:npc SpawnData.Id set value "0002-test_quester"
data modify storage usjm:npc SpawnData.Name set value '{"text":"テスト依頼人","color":"white","bold":false}'

data modify storage usjm:npc SpawnData.HasQuest set value true
data modify storage usjm:npc SpawnData.HasMenu set value false

data modify storage usjm:npc SpawnData.QuestStatus set value "Idle"

#> 会話内容
    # 空のデータ作成
    data modify storage usjm:npc SpawnData.Dialogue.Content set value {Main:[],DuringQuest:[],AfterQuest:[]}

    # .Main
    data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value {"text":'{"text":"こんにちは"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value {"text":'{"text":"これが会話です"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value {"text":'{"text":"あばばばば"}',Quest:{Id:"0000-template",Rewards:{Gold:100,Exp:0},Name:'{"text":"クエストのテンプレート"}',Description:{Info:['{"text":"あいうえお"}','{"text":"かきくけこ"}','{"text":"さしすせそ"}'],Subject:'{"text":"洞窟のゾンビの討伐 (0/5)"}'}}}
    data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value {"text":'{"text":"さようなら(3)"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.Main append value {"text":'{"text":"早く済ませなさい"}'}

    # .AfterQuest
    data modify storage usjm:npc SpawnData.Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとう"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとうだ"}'}
    
    # .DuringQuest
    data modify storage usjm:npc SpawnData.Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中1"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中2"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中3"}'}

    # .AfterQuest
    data modify storage usjm:npc SpawnData.Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとう"}'}
    data modify storage usjm:npc SpawnData.Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとうだ"}'}

# 会話総数
execute store result score $DialogueCount Usjm.Temp run data get storage usjm:npc SpawnData.Dialogue.Content
execute store result storage usjm:npc SpawnData.Dialogue.Count int 1 run scoreboard players get $DialogueCount Usjm.Temp

function usjm-npc:assets/generic/summon

