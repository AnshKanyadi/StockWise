function init()
    
    
    m.label = m.top.findNode("gameLabel")
   
    m.label.text = "niggas only"

    
    
   
    m.top.setFocus(true)

    m.ran = m.top.findNode("StockUpdaterTimer")
    m.ran.control = "start"
    m.ran.observeField("fire", "handleStockTimerEvent")
   
    
    


    
    
    
end function




sub handleStockTimerEvent()
    m.bob = m.global.AppleInventory
    m.label.text = str(m.bob)

end sub 