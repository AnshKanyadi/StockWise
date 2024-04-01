
function init()
    
    
    label = m.top.findNode("gameLabel")
    character = m.top.findNode("characterImage")
    label.text = "Welcome to stockwise! My name is Moe Lester and im going to be your mentor!"
    m.button1 = m.top.findNode("button1")
    m.button2 = m.top.findNode("button2")

    
    
    m.button1.setFocus(true)
   
    m.top.setFocus(true)

   
    
    


    
    
    
end function



sub onKeyEvent(key as String, press as Boolean)

    if press and key = "down"
       
        m.button2.setFocus(true)
        m.button1.setFocus(false)
        
    end if
    if press and key = "up"
        
        m.button1.setFocus(true)
        m.button2.setFocus(false)
        
    end if
   

   
    
  



end sub









