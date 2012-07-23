module("luci.controller.myapp.ping", package.seeall)

function index()
    entry({"ping"}, call("action_tryme"), "Click here", 10).dependent=false
    entry({"auth","index.php"},call("actionSendValidToken"),"Index",20).dependent=false
    entry({"portal","index.php"},call("actionRedirectToSuccessPage"),"Success page",50).dependent=false
    entry({"auth1","index.php"},call("actionRedirectSuccessPage"),"Index",40).dependent=false
    entry({"login"},template("myapp/login"),"Login page",30).dependent=false
    
end
 
function action_tryme()
    luci.http.prepare_content("text/plain")
    luci.http.write("Pong")
end

function actionRedirectSuccessPage()
    luci.http.redirect("http://192.168.1.149/cgi-bin/luci/view/myapp/auth/index.htm")
end

function actionRedirectToSuccessPage()
    luci.http.redirect("http://mbm.vn")
end

function actionDisplayLoginPage()
    luci.http.redirect("http://192.168.1.149/cgi-bin/luci/login.htm")
end

function actionSendValidToken()
    luci.http.prepare_content("text/plain")
    luci.http.write("Auth: 1")
end
