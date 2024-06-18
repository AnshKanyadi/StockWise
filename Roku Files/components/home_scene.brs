function init()
    ? "[home_scene] init"
    
    
    m.home_screen = m.top.findNode("homepage")
    m.home_screen.setFocus(true)

    
    m.tutorial = m.top.findNode("tutorial")
    m.tutorial.visible = false

    m.game_screen = m.top.findNode("game_screen")
    m.game_screen.visible = false
    
 
    
    m.home_screen.observeField("category_selected", "onCategorySelected")
    
	
    m.buttonIndex = -1
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: "; obj.getField()
    ? "onCategorySelected data: "; obj.getData()

    m.buttonIndex = obj.getData()

    if m.buttonIndex = 1
        m.home_screen.visible = false
        m.tutorial.visible = true

        m.home_screen.setFocus(false)
        m.tutorial.setFocus(true)

        
        
       
    end if

    if m.buttonIndex = 0
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
    if press
        if key = "back"
            if m.game_screen.visible or m.tutorial.visible
                m.game_screen.visible = false
                m.tutorial.visible = false
                m.center_square.visible = true

                'm.game_screen.setFocus(false)
                'm.tutorial.setFocus(false)
                m.center_square.setFocus(true)

                result = true
            end if
        end if
    end if
    return result

    'result = false
    'if press
    '    if key = "back"
    '        numberOfScreens = m.screenStack.Count()
    '       if numberOfScreens > 1
    '            CloseScreen(invalid)
    '            result = true
    '        end if
    '    end if
    'end if
    ' The OnKeyEvent() function must return true if the component handled the event,
    ' or false if it did not handle the event.
    'return result
end function