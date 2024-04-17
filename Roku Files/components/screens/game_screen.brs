
function init()
    
    
    label = m.top.findNode("gameLabel")
    character = m.top.findNode("characterImage")
    label.text = "Welcome to stockwise! My name is Moe Lester and im going to be your mentor!"
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
    m.button1.text = "Wow thats so cool"
    m.button2.text = "hello i am only 7 years old.."
    label.text = "By the way! I have a snake in my pants (wink)"
end function

function buttonbottomselected()
    label = m.top.findNode("gameLabel") 
    m.button1.text = "wow ur so cool"
    m.button2.text = "i just dabbed"
    label.text = "Yes I got cash lil bro I played stockwise"
end function










