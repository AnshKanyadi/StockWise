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
    m.boughtStocks = []

    changeFocus(m.currentIndex)
    m.stocktimer = m.top.findNode("stockTimer")
    m.stocktimer.control = "start"
    m.stocktimer.observeField("fire", "handleStockTimerEvent")
    m.remainingMoney = 10000 ' Initialize remaining money to $10000
    m.boughtStocksLabel = m.top.findNode("boughtStocksLabel")
    m.boughtStocksLabel.text = "Bought Stocks:"
    
end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    if press then
        if key = "right" then
            m.currentIndex = (m.currentIndex + 1) mod 6
            changeFocus(m.currentIndex)
            return true
        else if key = "left" then
            m.currentIndex = (m.currentIndex - 1 + 6) mod 6
            changeFocus(m.currentIndex)
            return true
        else if key = "up" then
            m.currentIndex = (m.currentIndex + 3) mod 6
            changeFocus(m.currentIndex)
            return true
        else if key = "down" then
            m.currentIndex = (m.currentIndex + 3) mod 6
            changeFocus(m.currentIndex)
            return true
        end if
    end if
    return false
end sub

sub changeFocus(index as Integer)
    buttons = ["stock1a", "stock2a", "stock3a", "stock4a", "stock5a", "stock6a"]
    
    for i = 0 to 5
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


sub showPopup()
   
    popupLabel = CreateObject("roSGNode", "Label")
    popupLabel.text = "Stock Bought"
    
  
    labelWidth = 200 
    labelHeight = 50 
    screenWidth = 1920 
    screenHeight = 1080 
    posX = (screenWidth - labelWidth) / 2
    posY = (screenHeight - labelHeight) / 2
    
    
    popupLabel.translation = [550, posY]
    popupLabel.color = "0x00FF00"
    
    m.top.appendChild(popupLabel)
    
    
    m.testtimer = m.top.findNode("testTimer")
    m.testtimer.control = "start"
    m.testtimer.duration = 1
    m.testtimer.observeField("fire", "handleTimerEvent")
    m.popupLabel = popupLabel
end sub

sub handleTimerEvent(event as Object)
   
    m.top.removeChild(m.popupLabel)
end sub

sub handleStockTimerEvent(event as Object)
  
    updateStockPrice("AppleCost")
    updateStockPrice("FacebookCost")
    updateStockPrice("GoogleCost")
    updateStockPrice("MicrosoftCost")
    updateStockPrice("NetflixCost")
    updateStockPrice("SamsungCost")
end sub

sub updateStockPrice(stockId as String)

    stockLabel = m.top.findNode(stockId)
    

    priceText = stockLabel.text
    

    if priceText <> invalid and priceText <> "" and left(priceText, 1) = "$" then
 
        numericText = mid(priceText, 2)
        
    
        currentPrice = Val(numericText)
        
    
        priceChange = Rnd(10) - 5 
        
      
        newPrice = currentPrice + priceChange
        if newPrice < 0 then newPrice = 0 
 
        stockLabel.text = "$" + str(newPrice)
        

        if priceChange > 0 then
  
            stockLabel.color = "0x00FF00"
        else if priceChange < 0 then

            stockLabel.color = "0xFF0000"
        else

            stockLabel.color = "0xFFFFFF" 
        end if
    else
        print "Invalid or empty price text:", priceText
    end if
end sub

sub buyStock(stockId as String)

    stockLabel = m.top.findNode(stockId)
    priceText = stockLabel.text
    numericText = mid(priceText, 2)
    stockPrice = Val(numericText)

    if stockPrice < m.remainingMoney then
        m.remainingMoney = m.remainingMoney - stockPrice
        m.top.findNode("MoneyLabel").text = "$" + str(m.remainingMoney)
        m.boughtStocks.Push(stockId)
        m.boughtStocksLabel.text = m.boughtStocksLabel.text + Chr(10) + stockId
        showPopup()

    else
        popupLabel = CreateObject("roSGNode", "Label")
        popupLabel.text = "You need more money"

        labelWidth = 200 
        labelHeight = 50 
        screenWidth = 1920 
        screenHeight = 1080 
        posX = (screenWidth - labelWidth) / 2
        posY = (screenHeight - labelHeight) / 2
        
        
        popupLabel.translation = [550, posY]
        popupLabel.color = "#0EB39F"
    end if

end sub 

