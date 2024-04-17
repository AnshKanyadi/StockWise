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


    changeFocus(m.currentIndex)
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
    showPopup("You clicked on stock 1.")
end sub

sub handleButtonClick_stock2a(event as Object)
    showPopup("You clicked on stock 2.")
end sub

sub handleButtonClick_stock3a(event as Object)
    showPopup("You clicked on stock 3.")
end sub

sub handleButtonClick_stock4a(event as Object)
    showPopup("You clicked on stock 4.")
end sub

sub handleButtonClick_stock5a(event as Object)
    showPopup("You clicked on stock 5.")
end sub

sub handleButtonClick_stock6a(event as Object)
    showPopup("You clicked on stock 6.")
end sub

sub showPopup(message as String)
    
    dialog = CreateObject("roSGNode", "Dialog")
    dialog.title = "Stock Clicked"
    dialog.message = message
    m.top.dialog = dialog
    m.top.dialog.visible = true
end sub
