sub init()
  m.stock1 = m.top.FindNode("apple")
  m.stock2 = m.top.FindNode("facebook")
  m.stock3 = m.top.FindNode("google")
  m.stock4 = m.top.FindNode("microsoft")
  m.stock5 = m.top.FindNode("netflix")
  m.stock6 = m.top.FindNode("samsung")
  m.money = m.top.FindNode("balance")
  m.testpostergrid = m.top.FindNode("testPosterGrid")
  m.testpostergridcontent = createObject("roSGNode","ContentNode")

  m.ran = m.top.FindNode("StockUpdaterTimer")
  m.ran.control = "start"
  m.ran.observeField("fire", "handleStockTimerEvent")

  m.testpostergrid.visible=true
  m.testpostergrid.setFocus(false)
  m.label = m.top.FindNode("balance")
end sub

sub handleStockTimerEvent()
  m.apple = m.global.AppleInventory
  m.facebook = m.global.FacebookInventory
  m.google = m.global.GoogleInventory
  m.microsoft = m.global.MicrosoftInventory
  m.netflix = m.global.NetflixInventory
  m.samsung = m.global.SamsungInventory
  m.remainingMoney = m.global.remainingMoney



  m.stock1.SHORTDESCRIPTIONLINE1 = str(m.apple)
  m.stock2.SHORTDESCRIPTIONLINE1 = str(m.facebook)
  m.stock3.SHORTDESCRIPTIONLINE1 = str(m.google)
  m.stock4.SHORTDESCRIPTIONLINE1 = str(m.microsoft)
  m.stock5.SHORTDESCRIPTIONLINE1 = str(m.netflix)
  m.stock6.SHORTDESCRIPTIONLINE1 = str(m.samsung)
  m.label.text = m.global.TotalMoney
  ? m.global.TotalMoney
 

end sub