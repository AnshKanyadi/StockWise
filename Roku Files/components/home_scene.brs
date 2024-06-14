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

