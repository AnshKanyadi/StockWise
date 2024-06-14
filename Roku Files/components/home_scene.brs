function init()
    ? "[home_scene] init"
    
    
    m.center_square = m.top.findNode("homepage")
    m.center_square.setFocus(true)

    
    m.tutorial = m.top.findNode("tutorial")
    m.tutorial.visible = false

    m.game_screen = m.top.findNode("game_screen")
    m.game_screen.visible = false
    
 
    
    m.center_square.observeField("category_selected", "onCategorySelected")
    
	
    m.buttonIndex = -1
end function

sub onCategorySelected(obj)
    ? "onCategorySelected field: "; obj.getField()
    ? "onCategorySelected data: "; obj.getData()

    m.buttonIndex = obj.getData()

    if m.buttonIndex = 1
        m.center_square.visible = false
        m.tutorial.visible = true

        m.center_square.setFocus(false)
        m.tutorial.setFocus(true)

        
        
       
    end if

    if m.buttonIndex = 0
        m.center_square.visible = false
        m.tutorial.visible = false
        m.game_screen.visible = true

        m.center_square.setFocus(false)
        m.tutorial.setFocus(false)
        m.game_screen.setFocus(true)
      
    end if
end sub

