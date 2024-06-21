
function init()
  
    center = m.top.findNode("category_list")
    centerButtons = center.boundingRect()
    centerx = (1920 - centerButtons.width) / 2
    centery = (1080 - centerButtons.height) / 1.1
    center.translation = [ centerx, centery ]
    m.top.setFocus(true)

    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    setVideo()

end function

function setVideo() as void
  videoContent = createObject("RoSGNode", "ContentNode")
  'videoContent.url = "pkg:/images/StockWise.mp4"
  videoContent.streamformat = "mp4"
  

  m.video = m.top.findNode("musicvideos")
  m.video.content = videoContent
  m.video.control = "play"
  
end function

function buttonFocus()
  m.category_list.setFocus(true)
  m.category_list.selectedIndex = -1
  print "radio button has been reset"
end function


