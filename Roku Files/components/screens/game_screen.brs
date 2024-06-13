
function init()
    
    
    label = m.top.findNode("gameLabel")
    character = m.top.findNode("characterImage")
    label.text = "Welcome to stockwise! My name is StockAdvisor and im going to be your mentor!"
    m.button1 = m.top.findNode("button1")
    m.button2 = m.top.findNode("button2")

    
    
    m.button1.setFocus(true)
   
    m.top.setFocus(true)
    index = 1
    m.button1.observeField("buttonSelected", "buttontopselected")
    m.button2.observeField("buttonSelected", "buttonbottomselected")
 
   
    
    


    
    
    
end function



sub onKeyEvent(key as String, press as Boolean)
    index = 1

    if press and key = "down"
       
        m.button2.setFocus(true)
        m.button1.setFocus(false)
        index = 2
        
    end if
    if press and key = "up"
        
        m.button1.setFocus(true)
        m.button2.setFocus(false)
        index = 1
        
    end if

 

   
    
  



end sub

function buttontopselected()
    label = m.top.findNode("gameLabel") 
    m.button1.text = "I see, im glad you're well!"
    m.button2.text = "I'm well!"
    label.text = "How are you?"
end function

function buttonbottomselected()
    label = m.top.findNode("gameLabel") 
    m.button1.text = "I see, that helps a lot thank you"
    m.button2.text = "i still don't get it"
    label.text = "A stock is a share of a company! in this game, you will be simulating them!"
end function










