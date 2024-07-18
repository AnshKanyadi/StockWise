sub init()



    sec = CreateObject("roRegistry")
    m.reg = CreateObject("roRegistrySection", "KingBob")
    
    m.networkTaskApple = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskApple.observeField("response", "onNetworkResponseApple")

    m.networkTaskGoogle = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskGoogle.observeField("response", "onNetworkResponseGoogle")

    m.networkTaskMicrosoft = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskMicrosoft.observeField("response", "onNetworkResponseMicrosoft")

    m.networkTaskMeta = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskMeta.observeField("response", "onNetworkResponseMeta")

    m.networkTaskNetflix = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskNetflix.observeField("response", "onNetworkResponseNetflix")

    m.networkTaskAmazon = CreateObject("roSGNode", "NetworkTask")
    m.networkTaskAmazon.observeField("response", "onNetworkResponseAmazon")

    ' Fetch stock data
    fetchStockData()

    ' Other initializations...

    ' Fetch stock data
    fetchStockData()

    m.currentIndex = 0
    m.button1 = m.top.findNode("stock1a")
    m.button2 = m.top.findNode("stock2a")
    m.button3 = m.top.findNode("stock3a")
    m.button4 = m.top.findNode("stock4a")
    m.button5 = m.top.findNode("stock5a")
    m.button6 = m.top.findNode("stock6a")
    m.button1.observeField("buttonSelected", "handleButtonClick_stock1a")
    m.button2.observeField("buttonSelected", "handleButtonClick_stock2a")
    m.button3.observeField("buttonSelected", "handleButtonClick_stock3a")
    m.button4.observeField("buttonSelected", "handleButtonClick_stock4a")
    m.button5.observeField("buttonSelected", "handleButtonClick_stock5a")
    m.button6.observeField("buttonSelected", "handleButtonClick_stock6a")

    m.buttonS1 = m.top.findNode("stock1sell")
    m.buttonS2 = m.top.findNode("stock2sell")
    m.buttonS3 = m.top.findNode("stock3sell")
    m.buttonS4 = m.top.findNode("stock4sell")
    m.buttonS5 = m.top.findNode("stock5sell")
    m.buttonS6 = m.top.findNode("stock6sell")

    m.buttonS1.observeField("buttonSelected", "handleButtonClick_stock1sell")
    m.buttonS2.observeField("buttonSelected", "handleButtonClick_stock2sell")
    m.buttonS3.observeField("buttonSelected", "handleButtonClick_stock3sell")
    m.buttonS4.observeField("buttonSelected", "handleButtonClick_stock4sell")
    m.buttonS5.observeField("buttonSelected", "handleButtonClick_stock5sell")
    m.buttonS6.observeField("buttonSelected", "handleButtonClick_stock6sell")

    m.buttonG1 = m.top.findNode("graph1")
    m.buttonG2 = m.top.findNode("graph2")
    m.buttonG3 = m.top.findNode("graph3")
    m.buttonG4 = m.top.findNode("graph4")
    m.buttonG5 = m.top.findNode("graph5")
    m.buttonG6 = m.top.findNode("graph6")
    m.inventory = m.top.findNode("inventory")


    
    m.buttonG1.observeField("buttonSelected", "handleButtonClick_stock1sell")
    m.buttonG2.observeField("buttonSelected", "handleButtonClick_stock2sell")
    m.buttonG3.observeField("buttonSelected", "handleButtonClick_stock3sell")
    m.buttonS4.observeField("buttonSelected", "handleButtonClick_stock4sell")
    m.buttonS5.observeField("buttonSelected", "handleButtonClick_stock5sell")
    m.buttonS6.observeField("buttonSelected", "handleButtonClick_stock6sell")

    m.boughtsell1 = m.reg.Read("Apple").toInt()
    m.boughtsell2 = m.reg.Read("Facebook").toInt()
    m.boughtsell3 = m.reg.Read("Google").toInt()
    m.boughtsell4 = m.reg.Read("Microsoft").toInt()
    m.boughtsell5 = m.reg.Read("Netflix").toInt()
    m.boughtsell6 = m.reg.Read("Samsung").toInt()

    m.lastPriceApple = 0
    m.lastPriceFacebook = 0
    m.lastPriceGoogle = 0
    m.lastPriceMicrosoft = 0
    m.lastPriceNetflix = 0
    m.lastPriceSamsung = 0

    m.priceChangeApple = 0
    m.priceChangeFacebook = 0
    m.priceChangeGoogle = 0
    m.priceChangeMicrosft = 0
    m.priceChangeNetflix = 0
    m.priceChangeSamsung = 0

    m.appleChange = m.top.findNode("stock1Change")
    m.facebookChange = m.top.findNode("stock2Change")
    m.googleChange = m.top.findNode("stock3Change")
    m.microsoftChange = m.top.findNode("stock4Change")
    m.netflixChange = m.top.findNode("stock5Change")
    m.samsungChange = m.top.findNode("stock6Change")



    m.applePrices = []
    m.facebookPrices = []
    m.googlePrices = []
    m.microsoftPrices = []
    m.netflixPrices = []
    m.samsungPrices = []
   
    changeFocus(m.currentIndex)
    m.stocktimer = m.top.findNode("stockTimer")
    m.stocktimer.control = "start"
    m.stocktimer.observeField("fire", "handleStockTimerEvent")
    m.remainingMoney = 10000 ' Initialize remaining money to $10000
   
    updateList()
    '
    'font section

    m.gameLabel = m.top.findNode("gameLabel")
    centerX = 700
    m.gameLabel.translation = [1602, 18]

    m.playerLabel = m.top.findNode("playerLabel")
    m.playerLabel.translation = [1637, 61]

    m.moneyLabel = m.top.findNode("MoneyLabel")
    

    'm.moneyLabel.translation = [1800, 45]

    'creating fonts
    m.gameLabelFont = CreateObject("roSGNode", "Font")
    m.gameLabelFont.uri = "pkg:/fonts/Barabara.otf"
    m.gameLabelFont.size = 60
    'm.gameLabelFont.color = 
    m.balanceFont = CreateObject("roSGNode", "Font")
    m.balanceFont.uri = "pkg:/fonts/LoveloBlack.otf"
    m.balanceFont.size = 28

    m.sFont = CreateObject("roSGNode", "Font")
    m.sFont.uri = "pkg:/fonts/LoveloBlack.otf"
    m.sFont.size = 42
    
  

    'setting fonts
    m.gameLabel.font = m.sFont
    m.moneyLabel.font = m.balanceFont
    m.playerLabel.font = m.balanceFont
   
    'm.boughtStocksLabel.font= m.boughtStocksFont

    m.reg.Write("Balance", "100000")
    m.remainingMoney = m.reg.Read("Balance").toInt()
    m.moneyLabel.text = m.reg.Read("Balance")
    AddAndSetFields( m.global, { TotalMoney: m.remainingMoney } )
    
    

end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
      if m.currentIndex = 3 and key <> "ok" then
        if key = "right" then
            m.currentIndex = (m.currentIndex + 1) mod 4
            changeFocus(m.currentIndex)
            return true
        else if key = "left" then
            m.currentIndex = (m.currentIndex - 1 + 4) mod 4
            changeFocus(m.currentIndex)
            return true
        else if key = "up" then
            m.currentIndex = 3
            changeFocus(m.currentIndex)
            return true
        else if key = "down" then 
            m.currentIndex = 3
            changeFocus(m.currentIndex)
            return true
        end if
    end if
    if m.currentIndex > 3 then
        if key = "right" then
            m.currentIndex = (m.currentIndex + 1) mod 19
            changeFocus(m.currentIndex)
            return true
        else if key = "left" then
            m.currentIndex = (m.currentIndex - 1 + 19) mod 19
            changeFocus(m.currentIndex)
            return true
        else if key = "up" then
            m.currentIndex = (m.currentIndex - 3 + 19) mod 19
            changeFocus(m.currentIndex)
            return true
        else if key = "down" then
            m.currentIndex = (m.currentIndex + 3) mod 19
            changeFocus(m.currentIndex)
            return true
        end if
else
        if key = "right" then
            m.currentIndex = (m.currentIndex + 1) mod 4
            changeFocus(m.currentIndex)
            return true
        else if key = "left" then
            m.currentIndex = (m.currentIndex - 1 + 4) mod 4
            changeFocus(m.currentIndex)
            return true
        else if key = "up" then
            m.currentIndex = (m.currentIndex - 4 + 19) mod 19
            changeFocus(m.currentIndex)
            return true
        else if key = "down" then
            m.currentIndex = (m.currentIndex + 4) mod 19
            changeFocus(m.currentIndex)
            return true
        end if
    end if
    end if
return false
end sub
    

sub changeFocus(index as Integer)
    buttons = ["stock1a", "stock2a", "stock3a", "inventory", "stock1sell", "stock2sell", "stock3sell", "graph1", "graph2", "graph3", "stock4a", "stock5a","stock6a","stock4sell","stock5sell","stock6sell",
    "graph4", "graph5", "graph6"]
    
    for i = 0 to 18
        button = m.top.findNode(buttons[i])
        if i = index then
            button.setFocus(true)
        else
            button.setFocus(false)
        end if
    end for
end sub

sub handleButtonClick_stock1a(event as Object)
    buyStock("AppleCost")
end sub

sub handleButtonClick_stock2a(event as Object)
    buyStock("FacebookCost")
end sub

sub handleButtonClick_stock3a(event as Object)
    buyStock("GoogleCost")
end sub

sub handleButtonClick_stock4a(event as Object)
    buyStock("MicrosoftCost")
end sub

sub handleButtonClick_stock5a(event as Object)
    buyStock("NetflixCost")
end sub

sub handleButtonClick_stock6a(event as Object)
    buyStock("SamsungCost")
end sub



sub handleButtonClick_stock1sell(event as Object)
    sellStock("AppleCost")
end sub

sub handleButtonClick_stock2sell(event as Object)
    sellStock("FacebookCost")
end sub

sub handleButtonClick_stock3sell(event as Object)
    sellStock("GoogleCost")
end sub

sub handleButtonClick_stock4sell(event as Object)
    sellStock("MicrosoftCost")
end sub

sub handleButtonClick_stock5sell(event as Object)
    sellStock("NetflixCost")
end sub

sub handleButtonClick_stock6sell(event as Object)
    sellStock("SamsungCost")
end sub


sub showPopup(stockId as String)
   
    popupLabel = CreateObject("roSGNode", "Label")
    popupLabel.text = "One piece of " + stockId + "'s stock bought"
    
  
    labelWidth = 200 
    labelHeight = 50 
    screenWidth = 1920 
    screenHeight = 1080 
    posX = (screenWidth - labelWidth) / 2
    posY = ((screenHeight - labelHeight) / 2) + 180
    
    
    popupLabel.translation = [1300, 150]
    popupLabel.color = "0x00FF00"
    
    m.top.appendChild(popupLabel)
    
    
    m.goodPopTimer = m.top.findNode("goodPopTimer")
    m.goodPopTimer.control = "start"
    m.goodPopTimer.duration = 1
    m.goodPopTimer.observeField("fire", "handleTimerEvent")
    m.popupLabel = popupLabel
end sub

sub handleTimerEvent(event as Object)
   
    m.top.removeChild(m.popupLabel)
end sub

sub handleStockTimerEvent(event as Object)
  
    fetchStockData()
end sub

function RoundToTwoDecimals(value as Float) as Float
    roundedValue = Int(value * 100 + 0.5) / 100
    return roundedValue
end function





sub addPriceToList(pricesList as Object, newPrice as integer)

    if pricesList.count() > 5
        pricesList.Delete(0)
    end if
    pricesList.Push(newPrice)
    AddAndSetFields( m.global, { ApplePrices: m.applePrices } )
    AddAndSetFields( m.global, { FacebookPrices: m.applePrices } )
    AddAndSetFields( m.global, { GooglePrices: m.applePrices } )
    AddAndSetFields( m.global, { MicrosoftPrices: m.applePrices } )
    AddAndSetFields( m.global, { NetflixPrices: m.applePrices } )
    AddAndSetFields( m.global, { SamsungPrices: m.applePrices } )

end sub

sub updateList()
    
        AddAndSetFields( m.global, { AppleInventory: m.boughtsell1 } )
        AddAndSetFields( m.global, { FacebookInventory: m.boughtsell2 } )
        AddAndSetFields( m.global, { GoogleInventory: m.boughtsell3 } )
        AddAndSetFields( m.global, { MicrosoftInventory: m.boughtsell4 } )
        AddAndSetFields( m.global, { NetflixInventory: m.boughtsell5 } )
        AddAndSetFields( m.global, { SamsungInventory: m.boughtsell6 } )
    
end sub

sub showBadPopup(stockId as String)
   
    popupbadLabel = CreateObject("roSGNode", "Label")
    popupbadLabel.text = "You need more money to buy one " + stockId + "'s stock"
    
  
    labelWidth2 = 200 
    labelHeight2 = 50 
    screenWidth2 = 1920 
    screenHeight2 = 1080 
    posX2 = (screenWidth2 - labelWidth2) / 2
    posY2 = ((screenHeight2 - labelHeight2) / 2) + 150
    
    
    popupbadLabel.translation = [1200, 200]
    popupbadLabel.color = "0xFF0000"
    
    m.top.appendChild(popupbadLabel)
    
    m.badPopTimer = m.top.findNode("badPopTimer")
    m.badPopTimer.control = "start"
    m.badPopTimer.duration = 1
    m.badPopTimer.observeField("fire", "handleTimerEvent")
    m.popupLabel = popupbadLabel
end sub

sub sellNonePopup(stockId as String)
   
    popupSellLabel = CreateObject("roSGNode", "Label")
    popupSellLabel.text = "There are no " + stockId + " stocks to sell"
    
  
    labelWidth3 = 200 
    labelHeight3 = 50 
    screenWidth3 = 1920 
    screenHeight3 = 1080 
    posX3 = (screenWidth3 - labelWidth3) / 2
    posY3 = ((screenHeight3 - labelHeight3) / 2) + 120
    
    
    popupSellLabel.translation = [1300, 250]
    popupSellLabel.color = "0xFF0000"
    
    m.top.appendChild(popupSellLabel)
    
    m.noSellPopTimer = m.top.findNode("noSellPopTimer")
    m.noSellPopTimer.control = "start"
    m.noSellPopTimer.duration = 1
    m.noSellPopTimer.observeField("fire", "handleTimerEvent")
    m.popupLabel = popupSellLabel
end sub

sub soldPopup(stockId as String)
   
    popupSoldLabel = CreateObject("roSGNode", "Label")
    popupSoldLabel.text = "You have sold one stock of " + stockId + "!"
    
  
    labelWidth4 = 200 
    labelHeight4 = 50 
    screenWidth4 = 1920 
    screenHeight4 = 1080 
    posX4 = (screenWidth4 - labelWidth4) / 2
    posY4 = ((screenHeight4 - labelHeight4) / 2) + 90
    
    
    popupSoldLabel.translation = [1300, 300]
    popupSoldLabel.color = "0x00FF00"
    
    m.top.appendChild(popupSoldLabel)
    
    m.sellPopTimer = m.top.findNode("sellPopTimer")
    m.sellPopTimer.control = "start"
    m.sellPopTimer.duration = 1
    m.sellPopTimer.observeField("fire", "handleTimerEvent")
    m.popupLabel = popupSoldLabel
end sub

sub buyStock(stockId as String)

        
        stockLabel = m.top.findNode(stockId)
        priceText = stockLabel.text
        
        numericText = mid(priceText, 15)
        stockPrice = Val(numericText)

        moneyLabel = m.top.findNode("moneyLabel")

        if stockPrice < m.remainingMoney then
            m.remainingMoney = m.remainingMoney - stockPrice
            
            
            if stockId = "AppleCost" then
                m.boughtsell1 = m.boughtsell1 + 1
                showPopup("Apple")
            else if stockId = "FacebookCost" then
                m.boughtsell2 = m.boughtsell2 + 1
                showPopup("Facebook")
            else if stockId = "GoogleCost" then
                m.boughtsell3 = m.boughtsell3 + 1
                showPopup("Google")
            else if stockId = "MicrosoftCost" then
                m.boughtsell4 = m.boughtsell4 + 1
                showPopup("Microsoft")
            else if stockId = "NetflixCost" then
                m.boughtsell5 = m.boughtsell5 + 1
                showPopup("Notflix")
            else if stockId = "SamsungCost" then
                m.boughtsell6 = m.boughtsell6 + 1
                showPopup("Samsung")
            end if
            updateList()

            if moneyLabel <> invalid then
                moneyLabel.text =  str(m.remainingMoney)
            else
                print "MoneyLabel node not found."
            end if

            
        else
            if stockId = "AppleCost" then
                showBadPopup("Apple")
            else if stockId = "FacebookCost" then
                showBadPopup("Facebook")
            else if stockId = "GoogleCost" then
                showBadPopup("Google")
            else if stockId = "MicrosoftCost" then
                showBadPopup("Microsoft")
            else if stockId = "NetflixCost" then
                showBadPopup("Netflix")
            else if stockId = "SamsungCost" then
                showBadPopup("Samsung")
            end if
        end if
        m.reg.Write("Balance", str(m.remainingMoney))
        m.reg.Write("Apple", str(m.boughtsell1))
        m.reg.Write("Facebook", str(m.boughtsell2))
        m.reg.Write("Google", str(m.boughtsell3))
        m.reg.Write("Microsoft", str(m.boughtsell4))
        m.reg.Write("Netflix", str(m.boughtsell5))
        m.reg.Write("Samsung", str(m.boughtsell6))
        AddAndSetFields( m.global, { TotalMoney: m.remainingMoney } )
    
end sub

sub sellStock(stockId as String)

    stockLabel2 = m.top.findNode(stockId)
    priceText2 = stockLabel2.text
    numericText2 = mid(priceText2, 15)
    stockPrice2 = Val(numericText2)

    moneyLabel2 = m.top.findNode("MoneyLabel")
        
    if stockId = "AppleCost" then
        if m.boughtsell1 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell1 = m.boughtsell1 - 1
            soldPopup("Apple")
        else
            sellNonePopup("Apple")
        end if
    else if stockId = "FacebookCost" then
        if m.boughtsell2 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell2 = m.boughtsell2 - 1
            soldPopup("Facebook")
        else
            sellNonePopup("Facebook")
        end if
    else if stockId = "GoogleCost" then
        if m.boughtsell3 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell3 = m.boughtsell3 - 1
            soldPopup("Google")
        else
            sellNonePopup("Google")
        end if
    else if stockId = "MicrosoftCost" then
        if m.boughtsell4 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell4 = m.boughtsell4 - 1
            soldPopup("Microsoft")
        else
            sellNonePopup("Microsoft")
        end if
    else if stockId = "NetflixCost" then
        if m.boughtsell5 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell5 = m.boughtsell5 - 1
            soldPopup("Netflix")
        else
            sellNonePopup("Netflix")
        end if
    else if stockId = "SamsungCost" then
        if m.boughtsell6 > 0 then
            m.remainingMoney = m.remainingMoney + stockPrice2
            m.boughtsell6 = m.boughtsell6 - 1
            soldPopup("Samsung")
        else
            sellNonePopup("Samsung")
        end if
    end if
    updateList()

    if moneyLabel2 <> invalid then
        moneyLabel2.text = str(m.remainingMoney)
    else
        print "MoneyLabel node not found."
    end if

    m.reg.Write("Balance", str(m.remainingMoney))
    m.reg.Write("Apple", str(m.boughtsell1))
    m.reg.Write("Facebook", str(m.boughtsell2))
    m.reg.Write("Google", str(m.boughtsell3))
    m.reg.Write("Microsoft", str(m.boughtsell4))
    m.reg.Write("Netflix", str(m.boughtsell5))
    m.reg.Write("Samsung", str(m.boughtsell6))
    AddAndSetFields( m.global, { TotalMoney: m.remainingMoney } )
end sub

function AddAndSetFields( node as object, aa as object )
    addFields = {}
    setFields = {}
    for each field in aa
      if node.hasField( field )
        setFields[ field ] = aa[ field ]
      else
        addFields[ field ] = aa[ field ]
      end if
    end for

    node.setFields( setFields )
    node.addFields( addFields )
  end function



  sub fetchStockData()
    m.networkTaskApple.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/AAPL"
    m.networkTaskApple.control = "run"

    m.networkTaskGoogle.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/GOOGL"
    m.networkTaskGoogle.control = "run"

    m.networkTaskMicrosoft.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/MSFT"
    m.networkTaskMicrosoft.control = "run"

    m.networkTaskMeta.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/META"
    m.networkTaskMeta.control = "run"

    m.networkTaskNetflix.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/NFLX"
    m.networkTaskNetflix.control = "run"

    m.networkTaskAmazon.url = "https://stockservernodejs-91a225b4a63c.herokuapp.com/stock/AMZN"
    m.networkTaskAmazon.control = "run"
end sub

sub onNetworkResponseApple()
    response = m.networkTaskApple.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("AppleCost", stockPrice)
        else
            print "Failed to parse JSON response for Apple"
        end if
    else
        print "Failed to fetch Apple stock data"
    end if
end sub

sub onNetworkResponseGoogle()
    response = m.networkTaskGoogle.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("GoogleCost", stockPrice)
        else
            print "Failed to parse JSON response for Google"
        end if
    else
        print "Failed to fetch Google stock data"
    end if
end sub

sub onNetworkResponseMicrosoft()
    response = m.networkTaskMicrosoft.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("MicrosoftCost", stockPrice)
        else
            print "Failed to parse JSON response for Microsoft"
        end if
    else
        print "Failed to fetch Microsoft stock data"
    end if
end sub

sub onNetworkResponseMeta()
    response = m.networkTaskMeta.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("FacebookCost", stockPrice)
        else
            print "Failed to parse JSON response for Meta"
        end if
    else
        print "Failed to fetch Meta stock data"
    end if
end sub

sub onNetworkResponseNetflix()
    response = m.networkTaskNetflix.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("NetflixCost", stockPrice)
        else
            print "Failed to parse JSON response for Netflix"
        end if
    else
        print "Failed to fetch Netflix stock data"
    end if
end sub

sub onNetworkResponseAmazon()
    response = m.networkTaskAmazon.response
    if response <> invalid and response <> ""
        jsonResponse = ParseJson(response)
        if jsonResponse <> invalid
            stockPrice = jsonResponse.high
            updateStockPrice("SamsungCost", stockPrice)
        else
            print "Failed to parse JSON response for Amazon"
        end if
    else
        print "Failed to fetch Amazon stock data"
    end if
end sub

sub updateStockPrice(stockId as String, stockPrice as String)

    stockLabel = m.top.findNode(stockId)
    m.changes = 0
    m.percentc = 0
    if stockLabel <> invalid
        bob = Left(stockPrice, len(stockPrice)-2)

        last = Right(stockLabel.text, 6)

        if stockId = "SamsungCost" then

            m.samsungChange = m.top.findNode("stock6Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.samsungChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.samsungChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if


        end if
        if stockId = "AppleCost" then

            m.appleChange = m.top.findNode("stock1Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.appleChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.appleChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if

        end if
        if stockId = "FacebookCost" then
    
            m.facebookChange = m.top.findNode("stock2Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.facebookChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.facebookChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if

        end if
        if stockId = "GoogleCost" then
    
            m.googleChange = m.top.findNode("stock3Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.googleChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.googleChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if

        end if
        if stockId = "MicrosoftCost" then
    
            m.microsoftChange = m.top.findNode("stock4Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.microsoftChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.microsoftChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if

        end if
        if stockId = "NetflixCost" then
    
            m.netflixChange = m.top.findNode("stock5Change")

            m.changes = bob.toFloat() - last.toFloat()
            m.changes = RoundToTwoDecimals(m.changes)

            m.percent = (m.changes / bob.toFloat()) * 100
            m.percent = RoundToTwoDecimals(m.percent)
            if m.changes > 0 then
                m.netflixChange.text = "+" + str(m.changes) + "(+" + str(m.percent) + "%)"
            else
                m.netflixChange.text = " " + str(m.changes) + "(" + str(m.percent) + "%)"
            end if

        end if
       


        stockLabel.text = "Stock Price: $" + bob
    else
        print stockId + " node not found."
    end if
end sub

