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
    

 

    m.home_screen.observeField("category_selected", "onCategorySelected")
    m.game_screen.observeField("graphbutton1_selected", "GraphScreenShow")
    m.game_screen.observeField("graphbutton2_selected", "GraphScreenShow")
    m.game_screen.observeField("graphbutton3_selected", "GraphScreenShow")
    m.game_screen.observeField("graphbutton4_selected", "GraphScreenShow")
    m.game_screen.observeField("graphbutton5_selected", "GraphScreenShow")
    m.game_screen.observeField("graphbutton6_selected", "GraphScreenShow")
    


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
                m.home_screen.visible = false
                m.tutorial.visible = false
                m.home_screen.setFocus(false)
                m.game_screen.setFocus(true)
                m.GraphScreen.setFocus(false)

                result = true
            end if
                
        end if
    end if
    
    return result
    

end function

sub GraphScreenShow()
    m.game_screen.visible = false
    m.game_screen.setFocus(false)
    m.GraphScreen.visible = true
    m.GraphScreen.setFocus(true)
    ? "showing graph screen"
    


end sub


