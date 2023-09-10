## NPC定義
#> データ設定
data modify storage usjm:index npc append value {}

data modify storage usjm:index npc[-1].Id set value "0002-test_quester"
data modify storage usjm:index npc[-1].Name set value '{"text":"テスト依頼人","color":"white","bold":false}'

data modify storage usjm:index npc[-1].HasQuest set value true
data modify storage usjm:index npc[-1].HasMenu set value false

data modify storage usjm:index npc[-1].QuestStatus set value "Idle"

#> 会話内容
    # 空のデータ作成
    data modify storage usjm:index npc[-1].Dialogue.Content set value {Main:[],DuringQuest:[],AfterQuest:[]}

    # .Main
    data modify storage usjm:index npc[-1].Dialogue.Content.Main append value {"text":'{"text":"こんにちは"}'}
    data modify storage usjm:index npc[-1].Dialogue.Content.Main append value {"text":'{"text":"これが会話です"}'}
    data modify storage usjm:index npc[-1].Dialogue.Content.Main append value {"Quest":{Id:2,Name:"0002-fetch_test"}}
    
    # .DuringQuest
    data modify storage usjm:index npc[-1].Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中1"}'}
    data modify storage usjm:index npc[-1].Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中2"}'}
    data modify storage usjm:index npc[-1].Dialogue.Content.DuringQuest append value {"text":'{"text":"クエスト進行中3"}'}

    # .AfterQuest
    data modify storage usjm:index npc[-1].Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとう"}'}
    data modify storage usjm:index npc[-1].Dialogue.Content.AfterQuest append value {"text":'{"text":"ありがとうだ"}'}

