function init()
    m.x = 0

    m.labelList = createObject("roArray", 8, false)
    m.labelList.Push("Today, we'll explore the wonderful world of stocks!")
    m.labelList.Push("Firstly, a stock is a piece of ownership in a company, and people buy stocks to share in a company's success.")
    m.labelList.Push("In a way, buying a stock is like investing yourself into a company.")
    m.labelList.Push("Companies sell stocks at a value, which can rise or fall depending on performance and market trends.")
    m.labelList.Push("If the company does good, the stock value rises, and you can sell it for a profit! But, the opposite is also true.")
    m.labelList.Push("One key thing to focus on are trends, as they help you understand how stocks may perform.")
    m.labelList.Push("Holding onto stocks can grow your wealth over time, and selling at the right time is key for profit.")
    m.labelList.Push("Now that you've learned the basics, let's get into the game!")

    m.label = m.top.findNode("gameLabel")
    m.images = m.top.findNode("images")
    m.stockSharkLabel = m.top.findNode("stockSharkLabel")
    m.stockSharkLabel.font.size = 45
    m.label.font.size = 30
    m.character = m.top.findNode("characterImage")
    m.textBox = m.top.findNode("textBox")
    m.label.text = "Welcome to Stockwise! I'm Stock Shark, your mentor in the world of finance!"
    m.labelButton = m.top.findNode("label_button") 
    m.screenButton = m.top.findNode("screen_button")
    m.top.observeField("visible", "onVisibleChange") 
    m.top.observeField("label_button_pressed", "onButtonPressed")
end function

sub onVisibleChange()
    if m.top.visible = true then
      m.labelButton.setFocus(true)
      m.stockSharkLabel = m.top.findNode("stockSharkLabel")
      m.label.text = "Welcome to Stockwise! I'm Stock Shark, your mentor in the world of finance!"
      m.screenButton.visible = false
      m.labelButton.visible = true
      m.character.translation = "[260, 300]"
      m.character.width = 500
      m.character.height = 500
      m.images.uri = "pkg:/images/bigCompanies.png"
      m.images.visible = false
      m.x = 0
    end if
end sub

sub onButtonPressed()
  m.label.text = m.labelList[m.x]
  if m.x = 1 then 
    m.images.visible = true
  end if
  if m.x = 2 then
    m.images.uri = "pkg:/images/cartoonInvestment.png"
  end if
  if m.x = 3 then
    m.character.translation = "[1060, 300]"
    m.images.translation = "[150, 200]"
    m.images.uri = "pkg:/images/riseAndFall.png"
  end if
  if m.x = 4 then
    m.images.uri = "pkg:/images/profitSmile.png"
  end if
  if m.x = 5 then
    m.images.uri = "pkg:/images/trend.png"
  end if
  if m.x = 6 then
    m.character.translation = "[260, 300]"
    m.images.translation = "[850, 200]"
    m.images.uri = "pkg:/images/sellBuy.png"
  end if
  if m.x = 7 then
    m.images.visible = "false"
    m.character.translation = "[540, 50]"
    m.character.width = 750
    m.character.height = 750
    ' m.character.uri = "pkg:/images/SamsungStock.png"
    m.labelButton.visible = false
    m.screenButton.visible = true
    m.screenButton.setFocus(true)
  end if
  ' m.labelButton.visible = false
  ' m.screenChange.visible = true
  ' m.screenChange.setFocus(true)
  m.x = m.x + 1
end sub

    