(function($){

    isfullscreen = false;
    window.response;
    window.lastId = 0;
    window.intervalClearance = true;
    window.engaged = false;

    checkSession();
    if(window.validate){
        document.getElementById("dashboardToggle").hidden = false;
        document.getElementById("authenticationMessage").hidden = true;
        //CALLING getNotifications() function
        getNotifications();
    }else{
        document.getElementById("authenticationMessage").hidden = false;
        document.getElementById("dashboardToggle").hidden = true;

    }
})(jQuery);



//Funtion That will fetch notifications----------------------
function getNotifications(){
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                 tempresponse = JSON.parse(this.responseText);
                if(tempresponse["Status"] == "Success"){
                    if(tempresponse['id'] == window.lastId || window.engaged == true){

                    }
                    else
                    {
                        window.response = tempresponse;
                        window.engaged = true;
                        document.getElementById("ringerContainer").hidden = false;
                        document.getElementById("tempEmDistance").innerHTML = "Distance : "+response.Message["travelTime"];
                        document.getElementById("tempTravelTime").innerHTML = "Travel Time : "+response.Message["distance"];
                        document.getElementById("tempEmTime").innerHTML = response.Message["timeDate"];
                        document.getElementById("tempEmLocation").innerHTML = response.Message["location"];
                        document.getElementById("tempEmOwner").innerHTML = response.Message["ownerName"];
                        document.getElementById("tempEmMobile").innerHTML = response.Message["mobNo"];
                        document.getElementById("acceptButton").disabled = false;
                        document.getElementById("rejectButton").disabled = false;
                        window.lastId = response["id"];
                        
                        
                        //To display map
                        mapDiv = document.getElementById("tempMap");
                        origin = {lat: response.Message.source["lat"], lng: response.Message.source["lng"]};
                        destination = {lat: response.Message.destination["lat"], lng: response.Message.destination["lng"]};

                        distanceMatrix(origin, destination, "Ringer");

                        initMap(mapDiv, origin, destination);
                        window.intervalClearance = true;
                        counter();

                        //PLAY NOTIFICATION SOUND
                        var notiSound = document.getElementById("notificationSound");
                        notiSound.play();


                    }
                }else{
                    // alert(response["Status"]);
                }
                setTimeout(getNotifications, 3000);
            }
        };
        var url = "php/getNotifications.php?lastId="+window.lastId;
        xhttp.open("GET", url, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send();
}


//Function that will send response to server-----------------
function notificationAction(action){

            window.engaged = false;

            //Stop NOTIFICATION SOUND
            var notiSound = document.getElementById("notificationSound");
            notiSound.pause();

    window.intervalClearance = false;
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var response = JSON.parse(this.responseText);
            if(response["Status"] == "Accepted"){
                document.getElementById("responseModalTitle").innerHTML = response["Title"];
                document.getElementById("responseModalTitle").style.color = "green";
                document.getElementById("responseModalBody").innerHTML = response["Message"];
                $("#responseModal").modal();
            }else if(response["Status"] == "Rejected"){
                document.getElementById("responseModalTitle").innerHTML = response["Title"];
                document.getElementById("responseModalTitle").style.color = "red";
                document.getElementById("responseModalBody").innerHTML = response["Message"];
                $("#responseModal").modal();

            }

            document.getElementById("acceptButton").disabled = true;
            document.getElementById("rejectButton").disabled = true;
            // alert("called me");

            setTimeout(function(){
            var hide = document.getElementById("ringerContainer").hidden = true;
            },1000);
            //clearTimeout(hide);
            showMainDetails();

        }
    };
    var url = 'php/getNotifications.php?Id='+window.response["id"]+'&Action='+action;
    xhttp.open("GET", url, true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();


}


//COUNTER FUNCTION TO SHOW COUNTER AND AUTO REJECTION--------
function counter(){
    var seconds = 30;
    // Update the count down every 1 second
    var x = setInterval(function() {

        // Output the result in an element with id="countDown"
        document.getElementById("countDownContainer").innerHTML = "Auto rejects in "+ seconds +" Sec" ;
        seconds -=1;
        // If the count down is over, write some text 
        if (seconds == 0 && window.intervalClearance == true) {
            notificationAction("Reject");
            document.getElementById("countDownContainer").innerHTML = "Response sent";
            clearInterval(x);
            return;
        }else if(window.intervalClearance == false){
            document.getElementById("countDownContainer").innerHTML = "Response sent";       
            clearInterval(x);
            return;
        }

    }, 1000);

}



//FUNCTION TO SHOW MAIN DETAILS------------------------------
 function showMainDetails(){
        // alert("me too");
        // alert(window.response["Status"]);
    //To display map
        mapDiv = document.getElementById("mainMap");
        origin = {lat: response.Message.source["lat"], lng: response.Message.source["lng"]};
        destination = {lat: response.Message.destination["lat"], lng: response.Message.destination["lng"]};
    
        distanceMatrix(origin, destination, "Main");

        initMap(mapDiv, origin, destination);
        // document.getElementById("mainDistance").innerHTML = window.response.Message["distance"];
        // document.getElementById("mainTravelTime").innerHTML = window.response.Message["travelTime"];


    //To show main table
    document.getElementById("situation").innerHTML = window.response.Message["emergencyType"];
    // document.getElementById("mainLocation").innerHTML = window.response.Message["location"];
    document.getElementById("mainTime").innerHTML = window.response.Message["timeDate"];
    document.getElementById("ownerName").innerHTML = window.response.Message["ownerName"];
    document.getElementById("mainMobile").innerHTML = window.response.Message["mobNo"];
    document.getElementById("carNo").innerHTML = window.response.Message["carNo"];
    document.getElementById("carColor").innerHTML = window.response.Message["carColor"];
    document.getElementById("carModel").innerHTML = window.response.Message["carModel"];
     
 }






 //CHECK SESSION FUNCTION

function checkSession(){

    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            var response = JSON.parse(this.responseText);

            if(response["Status"] == "Accept"){
                // console.log("ajax se : ");
                if(response["RescueType"] == "hospital" || response["RescueType"] == "carworkshop"){
                    window.validate = true;
                }else{
                    window.validate = false;
                }

                // console.log(window.validate);

            }else{
                window.validate = false;
            }
            // console.log("ajax se : ");

        }

    };
    var url = 'php/checkSession.php';
    // console.log(url);
    xhttp.open("GET", url, false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();


}


function logout(){
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            var response = JSON.parse(this.responseText);

            if(response["Status"] == "Logged out"){
                // console.log("ajax se : ");
                window.location.replace("index.html");
                // console.log(window.validate);

            }else{

            }
            // console.log("ajax se : ");

        }

    };
    var url = 'php/checkSession.php?x=logout';
    console.log(url);
    xhttp.open("GET", url, false);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();

}


// CODE TO SHOW FULL SCREEN
function fullScreen(){
    db = document.body;
	if(isfullscreen == false){
		if(db.requestFullScreen){
		    db.requestFullScreen();
		} else if(db.webkitRequestFullscreen){
		    db.webkitRequestFullscreen();
		} else if(db.mozRequestFullScreen){
		    db.mozRequestFullScreen();
		} else if(db.msRequestFullscreen){
		    db.msRequestFullscreen();
		}
		isfullscreen = true;
		db.style.width = window.screen.width+"px";
        db.style.height = window.screen.height+"px";
        
        document.getElementById("fullScreen").innerHTML = '<i class="fa fa-compress"></i>';

	} else {
		if(document.cancelFullScreen){
		    document.cancelFullScreen();
		} else if(document.exitFullScreen){
		    document.exitFullScreen();
		} else if(document.mozCancelFullScreen){
		    document.mozCancelFullScreen();
		} else if(document.webkitCancelFullScreen){
		    document.webkitCancelFullScreen();
		} else if(document.msExitFullscreen){
		    document.msExitFullscreen();
		}
		isfullscreen = false;
		db.style.width = "100%";
        db.style.height = "auto";
        document.getElementById("fullScreen").innerHTML = '<i class="fa fa-expand"></i>';

	}
}