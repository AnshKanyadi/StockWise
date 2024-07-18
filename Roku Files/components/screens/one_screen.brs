function init()
    m.x = 0

    m.labelList = createObject("roArray", 5, false)
    m.labelList.Push("First off, highlighted in red, you can see the 'Buy' button. Clicking it will buy you your desired stock!")
    m.labelList.Push("The next button is the sell button, this will obviously sell the stock.")
    m.labelList.Push("Lastly, the view button shows you a real-time graph of how the stock is performing!")
    m.labelList.Push("You can return to the home page and click the inventory button to view your bought stocks!")
    m.labelList.Push("Good luck, make money, and have fun!")

    m.label = m.top.findNode("gameLabel")
    m.images = m.top.findNode("images")
    m.images.visible = true
    m.stockSharkLabel = m.top.findNode("stockSharkLabel")
    m.stockSharkLabel.font.size = 45
    m.label.font.size = 30
    m.character = m.top.findNode("characterImage")
    m.textBox = m.top.findNode("textBox")
    m.label.text = "Welcome to Stockwise! I'm Stock Shark, your mentor in the world of finance!"
    m.labelButton = m.top.findNode("label_button") 
    m.screenButton = m.top.findNode("screen_button")
    m.stockSharkLabel = m.top.findNode("stockSharkLabel")
    m.top.observeField("visible", "onVisibleChange") 
    m.top.observeField("label_button_pressed", "onButtonPressed")
end function

sub onVisibleChange()
    if m.top.visible = true then
      m.images.visible = true
      m.label.text = "This here is the game screen. It's quite the work of art, isn't it?"
      m.labelButton.visible = true
      m.screenButton.visible = false
      m.labelButton.setFocus(true)
      m.character.translation = "[260, 530]"
      m.character.width = 350
      m.character.height = 350
      m.x = 0
    end if
end sub

sub onButtonPressed()
    m.label.text = m.labelList[m.x]
    if m.x = 0 then
      m.images.uri = "pkg:/images/buy.png"
    end if
    if m.x = 1 then
      m.images.uri = "pkg:/images/sell.png"
    end if
    if m.x = 2 then
      m.images.uri = "pkg:/images/moreInfo.png"
    end if
    if m.x = 3 then
      m.images.uri = "pkg:/images/inventory1.png"
    end if
    if m.x = 4 then
      m.images.visible = false
      m.character.translation = "[540, 130]"
      m.character.width = 750
      m.character.height = 750
      m.labelButton.visible = false
      m.screenButton.visible = true
      m.screenButton.setFocus(true)
    end if
    m.x = m.x + 1
  end sub