sub init()





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

    m.buttonG1.observeField("buttonSelected", "handleButtonClick_stock1sell")
    m.buttonG2.observeField("buttonSelected", "handleButtonClick_stock2sell")
    m.buttonG3.observeField("buttonSelected", "handleButtonClick_stock3sell")
    m.buttonS4.observeField("buttonSelected", "handleButtonClick_stock4sell")
    m.buttonS5.observeField("buttonSelected", "handleButtonClick_stock5sell")
    m.buttonS6.observeField("buttonSelected", "handleButtonClick_stock6sell")

    m.boughtsell1 = 0
    m.boughtsell2 = 0
    m.boughtsell3 = 0
    m.boughtsell4 = 0
    m.boughtsell5 = 0
    m.boughtsell6 = 0

    m.applePrices = []
    m.facebookPrices = CreateObject("roArray", 5, true)
    m.googlePrices = CreateObject("roArray", 5, true)
    m.microsoftPrices = CreateObject("roArray", 5, true)
    m.netflixPrices = CreateObject("roArray", 5, true)
    m.samsungPrices = CreateObject("roArray", 5, true)
    m.applePrices = [100, 105, 110, 115, 120]   
    changeFocus(m.currentIndex)
    m.stocktimer = m.top.findNode("stockTimer")
    m.stocktimer.control = "start"
    m.stocktimer.observeField("fire", "handleStockTimerEvent")
    m.remainingMoney = 10000 ' Initialize remaining money to $10000
    m.boughtStocksLabel = m.top.findNode("boughtStocksLabel")
    m.boughtStocksLabel.text = "Bought Stocks:"

    m.boughtStocks1Label = m.top.findNode("AppleNum")
    m.boughtStocks2Label = m.top.findNode("FacebookNum")
    m.boughtStocks3Label = m.top.findNode("GoogleNum")
    m.boughtStocks4Label = m.top.findNode("MicrosoftNum")
    m.boughtStocks5Label = m.top.findNode("NetflixNum")
    m.boughtStocks6Label = m.top.findNode("SamsungNum")
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
    
    m.boughtStockFont = CreateObject("roSGNode", "Font")
    m.boughtStockFont.uri = "pkg:/fonts/MontserratR.ttf"
    m.boughtStockFont.size = 40

    'setting fonts
    m.gameLabel.font = m.sFont
    m.moneyLabel.font = m.balanceFont
    m.playerLabel.font = m.balanceFont
    m.boughtStocks1Label.font = m.boughtStockFont
    m.boughtStocks2Label.font = m.boughtStockFont
    m.boughtStocks3Label.font = m.boughtStockFont
    m.boughtStocks4Label.font = m.boughtStockFont
    m.boughtStocks5Label.font = m.boughtStockFont
    m.boughtStocks6Label.font = m.boughtStockFont
    'm.boughtStocksLabel.font= m.boughtStocksFont

end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
        if key = "right" then
            m.currentIndex = (m.currentIndex + 1) mod 18
            changeFocus(m.currentIndex)
            return true
        else if key = "left" then
            m.currentIndex = (m.currentIndex - 1 + 18) mod 18
            changeFocus(m.currentIndex)
            return true
        else if key = "up" then
            m.currentIndex = (m.currentIndex - 3 + 18) mod 18
            changeFocus(m.currentIndex)
            return true
        else if key = "down" then
            m.currentIndex = (m.currentIndex + 3) mod 18
            changeFocus(m.currentIndex)
            return true
        end if
    end if
    return false
end sub

sub changeFocus(index as Integer)
    buttons = ["stock1a", "stock2a", "stock3a", "stock1sell", "stock2sell", "stock3sell", "graph1", "graph2", "graph3", "stock4a", "stock5a","stock6a","stock4sell","stock5sell","stock6sell",
    "graph4", "graph5", "graph6"]
    
    for i = 0 to 17
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
  
    updateStockPrice("AppleCost", "stock1Change")
    updateStockPrice("FacebookCost", "stock2Change")
    updateStockPrice("GoogleCost", "stock3Change")
    updateStockPrice("MicrosoftCost", "stock4Change")
    updateStockPrice("NetflixCost", "stock5Change")
    updateStockPrice("SamsungCost", "stock6Change")
end sub

function RoundToTwoDecimals(value as Float) as Float
    roundedValue = Int(value * 100 + 0.5) / 100
    return roundedValue
end function



sub updateStockPrice(stockId as String, changesLabels as String)

    stockLabel = m.top.findNode(stockId)
    
    m.changesLabel = m.top.findNode(changesLabels)

    priceText = stockLabel.text

    changeText = m.changesLabel.text
    

    if priceText <> invalid and priceText <> "" and changeText <> invalid and changeText <> "" then
 
        numericText = mid(priceText, 15)
        
    
        currentPrice = Val(numericText)
        
    
        priceChange = Rnd(70) - 5 

      
        newPrice = currentPrice + priceChange
        
        if(currentPrice <> 0) then
            m.percentChange = (priceChange / currentPrice) * 100
            m.percentChange = RoundToTwoDecimals(m.percentChange)
        end if
        
        if newPrice < 0 then newPrice = 0 
 

        if priceChange > 0 then

            stockLabel.text = "Stock Price: $" + str(newPrice)
            m.changesLabel.text = "+" + str(priceChange) + "(+" + str(m.percentChange) + "%)"
            m.changesLabel.color = "0x00FF00"

        else if priceChange < 0 then

            stockLabel.text = "Stock Price: $" + str(newPrice)
            m.changesLabel.text = " " + str(priceChange) + "(" + str(m.percentChange) + "%)"
            m.changesLabel.color = "0xFF0000"

        else

            stockLabel.text = "Stock Price: $" + str(newPrice)
            m.changesLabel.text =  " " + str(priceChange) + "(" + str(m.percentChange) + "%)"
            m.changesLabel.color = "h0000ffd9"
        end if
    else
        print "Invalid or empty price text:", priceText
    end if

    if stockId = "AppleCost" then
        addPriceToList(m.applePrices, newPrice)
    else if stockId = "FacebookCost" then
        addPriceToList(m.facebookPrices, newPrice)
    else if stockId = "GoogleCost" then
        addPriceToList(m.googlePrices, newPrice)
    else if stockId = "MicrosoftCost" then
        addPriceToList(m.microsoftPrices, newPrice)
    else if stockId = "NetflixCost" then
        addPriceToList(m.netflixPrices, newPrice)
    else if stockId = "SamsungCost" then
        addPriceToList(m.samsungPrices, newPrice)
    end if
end sub

sub addPriceToList(pricesList as Object, newPrice as integer)

    if pricesList.count() > 5
        pricesList.Delete(0)
    end if
    pricesList.Push(newPrice)
    AddAndSetFields( m.global, { globalContent: m.applePrices } )

end sub

sub updateList()
    if m.boughtStocks1Label <> invalid
        m.boughtStocks1Label.text = "Apple  x" + str(m.boughtsell1)
    else
        print "boughtStocks1Label node not found."
    end if
    if m.boughtStocks2Label <> invalid
        m.boughtStocks2Label.text = "Facebook  x" + str(m.boughtsell2)
    else
        print "boughtStocks2Label node not found."
    end if
    if m.boughtStocks3Label <> invalid
        m.boughtStocks3Label.text = "Google  x" + str(m.boughtsell3)
    else
        print "boughtStocks3Label node not found."
    end if
    if m.boughtStocks4Label <> invalid
        m.boughtStocks4Label.text = "Microsoft  x" + str(m.boughtsell4)
    else
        print "boughtStocks4Label node not found."
    end if
    if m.boughtStocks5Label <> invalid
        m.boughtStocks5Label.text = "Netflix  x" + str(m.boughtsell5)
    else
        print "boughtStocks5Label node not found."
    end if
    if m.boughtStocks6Label <> invalid
        m.boughtStocks6Label.text = "Samsung  x" + str(m.boughtsell6)
    else
        print "boughtStocks6Label node not found."
    end if
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
            
            m.boughtStocksLabel.text = m.boughtStocksLabel.text + Chr(10) + stockId

            
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


