(function($){


//Some global declarations
    isfullscreen = false;
    var responce;
    window.lastId = 0;
    window.arrIndex = 0;
    window.globalResponse = new Array();
    window.mapMarkerArray = new Array();
    // var intervalClearance = true;
    
    

    checkSession();
    if(window.validate){
        document.getElementById("dashboardToggle").hidden = false;
        //CALLING getNotifications() function
        getNotifications();
    }else{
        document.getElementById("authenticationMessage").hidden = false;
    }
})(jQuery);

//Funtion That will fetch notifications----------------------
function getNotifications(){
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
                
            if (this.readyState == 4 && this.status == 200) {
                 window.response = JSON.parse(this.responseText);
                if(response["Status"] == "Success"){
                    count = response.totalRows;

                    totalRequests = parseInt(document.getElementById("totalRequests").innerHTML) + count;
                    document.getElementById("totalRequests").innerHTML = totalRequests;

                    // alert(count);

                    if(window.lastId == 0){
                        emLogTbody.innerHTML = ""; //Table khali kr raha hai....mozila me krna pdta hai....

                        newNot = 0;

                        for(var i=0; i<count; i++){
                                if(response.row[i].response == "Sent"){
                                    action = "<b>View<b>";
                                    cls = "text-success";
                                    newNot ++;
                                    document.getElementById("newNot").innerHTML = newNot;
                                    btnCls = "btn-success";

                                }else{
                                    action = "Viewed";
                                    cls = "text-muted";
                                    btnCls = "btn-link";
                                }

                                // console.log("array index "+arrIndex);

                                rowObj = {
                                    emergencyType : response.row[i].Message.emergencyType,
                                    location : response.row[i].Message.location,
                                    timeDate : response.row[i].Message.timeDate,
                                    distance : response.row[i].Message.distance,
                                    travelTime : response.row[i].Message.travelTime,                                    
                                    ownerName : response.row[i].Message.ownerName,
                                    mobNo : response.row[i].Message.mobNo,
                                    ownerAddress : response.row[i].Message.ownerAddress,

                                    srcLat : response.row[i].Message.source.lat,
                                    srcLng : response.row[i].Message.source.lng,
                                    destLat : response.row[i].Message.destination.lat,
                                    destLng : response.row[i].Message.destination.lng,
                                    vehicalNo : response.row[i].Message.carNo,
                                    vehicalColor : response.row[i].Message.carColor,
                                    vehicalModel : response.row[i].Message.carModel,
                                    id : response.row[i].id,
                                    response : response.row[i].response


                                }

                                window.globalResponse[window.arrIndex] = rowObj;
                                
                                refCls = 'ref_'+window.arrIndex; //reference class is for referring the perticular <td> tag using global arrIndex


                                tableRow = '<tr>'+
                                                '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.emergencyType+'</td>'+
                                                // '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.location+'</td>'+
                                                '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.timeDate+'</td>'+
                                                // '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.distance+'</td>'+
                                                // '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.travelTime+'</td>'+
                                                '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.ownerName+'</td>'+
                                                '<td class="text-center '+cls+' '+refCls+'">'+response.row[i].Message.mobNo+'</td>'+
                                                '<td class="text-center '+cls+' '+refCls+'"><p id="'+window.arrIndex+'" class="btn '+btnCls+' btn-sm" onclick="showOnMap('+window.arrIndex+')">'+action+'</p></td>'+
                                            '</tr>';

                                    $("#emLogTbody").append(tableRow);
                                window.arrIndex ++;
                                // console.log("inc kiya hhua arrindexx"+arrIndex);
                        }
                    }
                    else{

                        for(var j= (count-1); j>=0; j--){
                            if(response.row[j].response == "Sent"){
                                action = "<b>View<b>";
                                cls = "text-success";
                                newNot = parseInt(document.getElementById("newNot").innerHTML) + 1;
                                document.getElementById("newNot").innerHTML = newNot;
                                btnCls = "btn-success";

                            }else{
                                action = "Viewed";
                                cls = "text-muted";
                                btnCls = "btn-link";
                            }

                            rowObj = {
                                emergencyType : response.row[j].Message.emergencyType,
                                location : response.row[j].Message.location,
                                timeDate : response.row[j].Message.timeDate,
                                distance : response.row[j].Message.distance,
                                travelTime : response.row[j].Message.travelTime,                                    
                                ownerName : response.row[j].Message.ownerName,
                                mobNo : response.row[j].Message.mobNo,
                                ownerAddress : response.row[j].Message.ownerAddress,

                                srcLat : response.row[j].Message.source.lat,
                                srcLng : response.row[j].Message.source.lng,
                                destLat : response.row[j].Message.destination.lat,
                                destLng : response.row[j].Message.destination.lng,
                                vehicalNo : response.row[j].Message.carNo,
                                vehicalColor : response.row[j].Message.carColor,
                                vehicalModel : response.row[j].Message.carModel,
                                id : response.row[j].id,
                                response : response.row[j].response


                            }

                            window.globalResponse[window.arrIndex] = rowObj;
                            
                            refCls = 'ref_'+window.arrIndex; //reference class is for referring the perticular <td> tag using global arrIndex

                            tableRow = '<tr>'+
                                            '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.emergencyType+'</td>'+
                                            // '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.location+'</td>'+
                                            '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.timeDate+'</td>'+
                                            // '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.distance+'</td>'+
                                            // '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.travelTime+'</td>'+
                                            '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.ownerName+'</td>'+
                                            '<td class="text-center '+cls+' '+refCls+'">'+response.row[j].Message.mobNo+'</td>'+
                                            '<td class="text-center '+cls+' '+refCls+'"><p id="'+window.arrIndex+'" class="btn '+btnCls+' btn-sm" onclick="showOnMap('+window.arrIndex+')">'+action+'</p></td>'+
                                        '</tr>';
                            $("#emLogTbody").prepend(tableRow);
                            window.arrIndex++;
                    }
                    }

                    seenRequests = totalRequests - newNot;
                    document.getElementById("seenRequests").innerHTML = seenRequests;


                    //PLAY NOTIFICATION SOUND
                    var notiSound = document.getElementById("notificationSound");
                    notiSound.play();


                    window.lastId = response.row[0].id; //last id dikhataa hai table ka. 
                    
                    
                    //dataTable ko refresh kiya
                    // $('#dataTable').DataTable();



                }else{
                    //alert(response["Status"]);
                }
                setTimeout(getNotifications, 3000);
            }
        };
        var url = "php/getPsCvoffNotifications.php?lastId="+window.lastId;
        xhttp.open("GET", url, true);
        xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xhttp.send();
}


//Function that will send response to server-----------------
function notificationAction(id){
    // window.intervalClearance = false;
    // console.log("Sending info");
    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var response = JSON.parse(this.responseText);
            // if(response["Status"] == "Accepted"){
            //     document.getElementById("responseModalTitle").innerHTML = response["Title"];
            //     document.getElementById("responseModalTitle").style.color = "green";
            //     document.getElementById("responseModalBody").innerHTML = response["Message"];
            //     $("#responseModal").modal();
            // }else if(response["Status"] == "Rejected"){
            //     document.getElementById("responseModalTitle").innerHTML = response["Title"];
            //     document.getElementById("responseModalTitle").style.color = "red";
            //     document.getElementById("responseModalBody").innerHTML = response["Message"];
            //     $("#responseModal").modal();

            // }


        }
    };
    var url = 'php/getPsCvoffNotifications.php?Id='+id;
    // console.log(url);
    xhttp.open("GET", url, true);
    xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xhttp.send();


}





//FUNCTION TO SHOW MAIN DETAILS------------------------------

function showOnMap(index){
    
    // alert("from show on map : "+index);
    // console.log("srclat : "+window.globalResponse[index].srcLat);
    // console.log("srclng : "+window.globalResponse[index].srcLng);
    // console.log("destlat : "+window.globalResponse[index].destLat);
    // console.log("destlat : "+window.globalResponse[index].destLng);
    
    //To display map
        mapDiv = document.getElementById("mainMap");
        origin = {lat: window.globalResponse[index].srcLat, lng: window.globalResponse[index].srcLng};
        destination = {lat: window.globalResponse[index].destLat, lng: window.globalResponse[index].destLng};
        
        distanceMatrix(origin, destination);
        
        initMap(mapDiv, origin, destination);
        document.getElementById("mainDistance").innerHTML = window.globalResponse[index].distance;
        document.getElementById("mainTravelTime").innerHTML = window.globalResponse[index].travelTime;


    // //To show main table
    document.getElementById("situation").innerHTML = window.globalResponse[index].emergencyType;
    document.getElementById("mainLocation").innerHTML = window.globalResponse[index].location;
    document.getElementById("mainTime").innerHTML = window.globalResponse[index].timeDate;
    document.getElementById("ownerName").innerHTML = window.globalResponse[index].ownerName;
    document.getElementById("mainMobile").innerHTML = window.globalResponse[index].mobNo;
    document.getElementById("carNo").innerHTML = window.globalResponse[index].vehicalNo;
    document.getElementById("carColor").innerHTML = window.globalResponse[index].vehicalColor;
    document.getElementById("carModel").innerHTML = window.globalResponse[index].vehicalModel;
    
    window.scrollTo(0, 0); 


    // console.log("response is "+window.globalResponse[index].response);

    if(window.globalResponse[index].response == "Sent"){
        // console.log("info  send");

        notificationAction(window.globalResponse[index].id);
        changeTdColor(index);

        
        newNot = parseInt(document.getElementById("newNot").innerHTML) - 1;
        document.getElementById("newNot").innerHTML = newNot;

        seenRequests = parseInt(document.getElementById("seenRequests").innerHTML) + 1;
        document.getElementById("seenRequests").innerHTML = seenRequests;


    }else{
        // console.log("info ddnt send");
    }



 }



 function initMap(mapDiv, origin, destination) {
    var directionsService = new google.maps.DirectionsService;
    var directionsDisplay = new google.maps.DirectionsRenderer;
    var map = new google.maps.Map(mapDiv, {
      zoom: 7,
      center: origin
    });
    directionsDisplay.setMap(map);

    directionsService.route({
      origin: origin,
      destination: destination,
      travelMode: 'DRIVING'
    }, function(response, status) {
      if (status === 'OK') {
        directionsDisplay.setDirections(response);
      } else {
        mapDiv.innerHTML = 'Directions request failed due to ' + status;
      }
    });
  }



//---------------------DISTANCE MATRIX-----------------------
      function distanceMatrix(origin, destination) {

    
        var service = new google.maps.DistanceMatrixService;
        service.getDistanceMatrix({
          origins: [origin],
          destinations: [destination],
          travelMode: 'DRIVING',
          unitSystem: google.maps.UnitSystem.METRIC,
          avoidHighways: false,
          avoidTolls: false
        }, function(response, status) {
          if (status !== 'OK') {
            alert('Error was: ' + status);
          } else {
   
                document.getElementById('mainDistance').innerHTML = response.rows[0].elements[0].distance.text;
                document.getElementById('mainTravelTime').innerHTML = response.rows[0].elements[0].duration.text;
                document.getElementById('mainLocation').innerHTML = response.destinationAddresses[0];

        
          }
        });
    }




function changeTdColor(index){
    // console.log("color change index is "+index);
    refCls = '.ref_'+index;

    $(refCls).removeClass("text-success");
    $(refCls).addClass("text-muted");

    $('#'+index).removeClass("btn-success");
    $('#'+index).addClass("btn-muted");
    document.getElementById(index).innerHTML = "Viewed"
    
    
}




//CHECK SESSION FUNCTION

function checkSession(){

    xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

            var response = JSON.parse(this.responseText);

            if(response["Status"] == "Accept"){
                // console.log("ajax se : ");

                if(response["RescueType"] == "policestation" || response["RescueType"] == "civiloffice"){
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
    // console.log(url);
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
		dashboardToggle.style.width = window.screen.width+"px";
        dashboardToggle.style.height = window.screen.height+"px";
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
		dashboardToggle.style.width = "100%";
        dashboardToggle.style.height = "auto";
        document.getElementById("fullScreen").innerHTML = '<i class="fa fa-expand"></i>';

	}
}


//TIME TO SHOW ON NAV BAR

function startTime() {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('liveClock').innerHTML =
    "Time : "+h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
}
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}