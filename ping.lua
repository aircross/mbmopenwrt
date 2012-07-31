module("luci.controller.openwrt.ping", package.seeall)

function index()
    entry({"ping"}, call("action_sayPong"), "Click here", 10).dependent=false
    entry({"auth","index.php"},call("actionSendValidToken"),"Index",20).dependen
    entry({"portal","index.php"},call("actionRedirectToSuccessPage"),"Success pa
    entry({"login"},template("openwrt/login"),"Login page",30).dependent=false

end

function action_sayPong()
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
