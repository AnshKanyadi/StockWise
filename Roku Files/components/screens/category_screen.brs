
function init()
    m.category_list = m.top.findNode("category_list")
    m.category_list.setFocus(true)
    setVideo()

end function

function setVideo() as void
  videoContent = createObject("RoSGNode", "ContentNode")
  videoContent.url = "pkg:/images/StockWise.mp4"
  videoContent.streamformat = "mp4"
  

  m.video = m.top.findNode("musicvideos")
  m.video.content = videoContent
  m.video.control = "play"
end function


