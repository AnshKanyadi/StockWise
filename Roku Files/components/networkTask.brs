sub init()
    m.top.functionName = "request"
    m.top.response = ""
end sub  

sub request()
    ? "Request function started"
    url = m.top.url
    http = CreateObject("roUrlTransfer")
    http.RetainBodyOnError(true)
    port = CreateObject("roMessagePort")
    http.SetPort(port)
    http.SetCertificatesFile("common:/certs/ca-bundle.crt")
    http.InitClientCertificates()
    http.SetUrl(url)
    if http.AsyncGetToString()
        msg = wait(10000, port)
        if type(msg) = "roUrlEvent"
            responseCode = msg.GetResponseCode()
            responseString = msg.GetString()
            print "Response Code: "; responseCode
            print "Response String: "; responseString
            if responseCode > 0 and responseCode < 400
                m.top.response = responseString
            else
                m.top.response = ""
            end if
        else if msg = invalid
            ? "No response received"
            m.top.response = ""
        end if
        http.AsyncCancel()
    end if
end sub
