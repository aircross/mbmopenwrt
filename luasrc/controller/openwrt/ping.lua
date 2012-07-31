module("luci.controller.openwrt.ping",package.seeall)
                                                                                                               
function index() 
    entry({"ping"}, call("actionSayPong"), "Click here", 10).dependent=false
    entry({"auth","index.php"},call("actionSendValidToken"),"Index",20).dependent=false
    entry({"portal","index.php"},call("actionRedirectToSuccessPage"),"Success page",50).dependent=false
    entry({"login"},template("openwrt/login"),"Login page",30).dependent=false
end                                                                                                            

function actionSayPong()
    luci.http.prepare_content("text/plain")
    luci.http.write("Pong")
end

function actionRedirectToSuccessPage()
    luci.http.redirect("http://mbm.vn")
end                                                                                                            

function actionSendValidToken()
    luci.http.prepare_content("text/plain")
    luci.http.write("Auth: 1")
end
