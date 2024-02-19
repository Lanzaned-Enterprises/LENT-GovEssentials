window.addEventListener("message", function (play) {
    if (play.data.action == "ShowBodyCam") {

        $('.top-right-container').fadeIn();
        $(".top-right-container").css({"display":"flex"})
        document.getElementById("player").innerHTML = play.data.Player
        document.getElementById("callsign").innerHTML = play.data.Callsign
        document.getElementById("month").innerHTML = play.data.Time
        document.getElementById("agency").innerHTML = play.data.Department
        document.getElementById("logo").src = play.data.DeptLogo
    }
    else if(play.data.action == "HideBodyCam") {
        $('.top-right-container').fadeOut(); 
    } 
    else if(play.data.action == "ShowBodyCamTime") {
        document.getElementById("month").innerHTML = play.data.ShowTime
    }
});