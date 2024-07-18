function init()
    ? "[home_scene] init"


    m.home_screen = m.top.findNode("homepage")
    m.home_screen.setFocus(true)


    m.tutorial = m.top.findNode("tutorial")
    m.tutorial.visible = false

    m.game_screen = m.top.findNode("game_screen")
    m.game_screen.visible = false

    m.GraphScreen = m.top.findNode("GraphScreen")
    m.GraphScreen.visible = false

    m.inventorys = m.top.findNode("inventory")
    m.inventorys.visible = false
    m.one_screen = m.top.findNode("one_screen")

 

    m.home_screen.observeField("category_selected", "onCategorySelected")
    m.game_screen.observeField("graphbutton1_selected", "GraphScreenShow1")
    m.game_screen.observeField("graphbutton2_selected", "GraphScreenShow2")
    m.game_screen.observeField("graphbutton3_selected", "GraphScreenShow3")
    m.game_screen.observeField("graphbutton4_selected", "GraphScreenShow4")
    m.game_screen.observeField("graphbutton5_selected", "GraphScreenShow5")
    m.game_screen.observeField("graphbutton6_selected", "GraphScreenShow6")
    m.game_screen.observeField("inventory_selected", "InventoryScreenShow")
    m.tutorial.observeField("screen_button_pressed", "onNextButtonSelected")
    m.one_screen.observeField("screen_button_pressed", "gameScreenShow")

    m.buttonIndex = -1
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: "; obj.getField()
    ? "onCategorySelected data: "; obj.getData()

    m.buttonIndex = obj.getData()

    if m.buttonIndex = 1 then
        m.home_screen.visible = false
        m.tutorial.visible = true

        m.home_screen.setFocus(false)
        m.tutorial.setFocus(true)




    end if

    if m.buttonIndex = 0 then
        m.home_screen.visible = false
        m.tutorial.visible = false
        m.game_screen.visible = true

        m.home_screen.setFocus(false)
        m.tutorial.setFocus(false)
        m.game_screen.setFocus(true)

    end if

end sub
function OnKeyEvent(key as String, press as Boolean) as Boolean

    result = false
    if press then
        if key = "back" then
            if m.game_screen.visible then
                m.game_screen.visible = false
                m.tutorial.visible = false
                m.home_screen.visible = true

                m.game_screen.setFocus(false)
                m.tutorial.setFocus(false)
                m.home_screen.setFocus(true)
                m.home_screen.callFunc("buttonFocus")

                result = true

            else if m.tutorial.visible then
                m.tutorial.visible = false
                m.game_screen.visible = false
                m.home_screen.visible = true

                m.game_screen.setFocus(false)
                m.tutorial.setFocus(false)
                m.home_screen.setFocus(true)
                m.home_screen.callFunc("buttonFocus")

                result = true

            else if m.GraphScreen.visible then
                m.GraphScreen.visible = false 
                m.game_screen.visible = true
                
                m.GraphScreen.setFocus(false)
                m.game_screen.setFocus(true)
                m.game_screen.callFunc("buttonFocus")

                result = true

            else if m.inventorys.visible then
                m.inventorys.visible = false 
                m.home_screen.visible = true
                
                m.inventorys.setFocus(false)
                m.home_screen.setFocus(true)
                m.home_screen.callFunc("buttonFocus")

                result = true
            end if
       
        end if
    end if
    return result

end function

function GraphScreenShow1()
  
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   

    


end function 

function GraphScreenShow2()
  
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   

    


end function 

function GraphScreenShow3()

    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   

    


end function 

function GraphScreenShow4()
    
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   

    


end function 

function GraphScreenShow5()
   
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   

    


end function 

function GraphScreenShow6()
    
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
   
end function

function InventoryScreenShow()
    
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.inventorys.visible = true
    m.inventorys.setFocus(true)
    ? "showing inventory screen"
   
end function

sub onNextButtonSelected()
    ? "TEST"
    m.tutorial.visible = false
    m.game_screen.visible = false
    m.one_screen.visible = true
    m.one_screen.setFocus(true)
end sub

sub gameScreenShow()
    m.one_screen.visible = false
    m.game_screen.visible = true
    m.game_screen.setFocus(true)
end sub