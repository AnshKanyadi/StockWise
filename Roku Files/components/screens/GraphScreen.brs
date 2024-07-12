function init()
    
    m.array = m.global.globalContent
    ? "we in here fr"
    label = m.top.findNode("label1")
    label.text = "Stock History"
   
    m.booby = 0
    m.top.visible = false
 
   
    m.top.observeField("visible", "testTimer")
    


    
    
    
end function



function testTimer()
    ? "inside testTimer"

    m.array = m.global.ApplePrices
   

    
   
    while m.array = invalid
        
        sleep(100)
        
        m.array = m.global.globalContent
    end while
    ? "top"
    ? m.array[0]
    ? "to check if its invalid"
    drawGraph(m.array)
    m.poster = m.top.findNode("poster")
    if m.poster <> invalid
        ? "Setting Poster URI"
        m.poster.uri = m.link
        m.poster.visible = true
        m.poster.setFocus(true)
        ? "Poster URI set to tmp:/graph.png"
    else
        ? "Poster node not found"
    end if
        ? m.array
    


end function 






sub drawGraph(heights)
    m.booby = m.booby + 1
    
    ? "Drawing graph"
    
    posterWidth = 640
    posterHeight = 360

    ' Create a bitmap
    bitmap = CreateObject("roBitmap", {width: posterWidth, height: posterHeight, AlphaEnable: true})

    ' Clear the bitmap to ensure no residuals
    bitmap.Clear(&hFFFFFFFF) ' White background

    ' Calculate step sizes
    xStep = posterWidth / (heights.count() - 1)
    yMax = 1000  ' Assuming max value is 100 for scaling purposes
    yStep = posterHeight / yMax

    ' Draw the graph lines with fixed coordinates
    for i = 0 to heights.count() - 2
        x1 = i * xStep
        y1 = posterHeight - (heights[i] * yStep)
        x2 = (i + 1) * xStep
        y2 = posterHeight - (heights[i + 1] * yStep)

        ' Determine the pen color
        if y2 > y1
            penColor = &hff0000d9' Red color
        elseif y1 > y2
            penColor = &h00ff00d9 ' Green color
        else
            penColor = &h0000ffd9 ' Blue color for equal heights
        end if

    
        bitmap.DrawLine(x1, y1, x2, y2, penColor)
        ? "Drew line from (" + x1.toStr() + ", " + y1.toStr() + ") to (" + x2.toStr() + ", " + y2.toStr() + ") with color " + penColor.toStr()
    end for

    
    ba = bitmap.GetPng(0, 0, posterWidth, posterHeight)
    m.link = "tmp:/graph" + str(m.booby) + ".png"
    result = ba.WriteFile(m.link)
    
    if result then
        ? "Bitmap saved as tmp:/graph.png"
    else
        ? "Failed to save bitmap"
    end if
    bitmap.Finish()
end sub