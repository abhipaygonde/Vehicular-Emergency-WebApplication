// $(document).ready(function(){
 
//     var userName = document.getElementById("userName");
//     var password = document.getElementById("password");
//     var passwordCnf = document.getElementById("passwordCnf");
    

// //UNIQUE KEY CHECK-----------------------------------------------
//     $("#uniqueKey").focus(function(){
//         $(this).css("color", "black");
//     });
//     $("#uniqueKey").blur(function(){
//        var field = document.getElementById("uniqueKey");
//        var obj = {
//         "request" : "key",
//         "value" : field.value
//        };
//        if(field.value.length == 6){
//         document.getElementById("keyCheckStatus").innerHTML = "Checking...";
//         var result = verifyKey(obj);
//        }else{
//            if(field.readOnly == false && field.value.length <6){
//             $("#keyCheckStatus").css("color", "red");
//             document.getElementById("keyCheckStatus").innerHTML = "Needs 6 charactors";
//             userName.readOnly = true;
//             password.readOnly = true;
//             passwordCnf.readOnly = true;
//            }
//     }
//     });


//     /////////////////CHECKING USERNAME------------------------------




//         $("#userName").focus(function(){
//             $(this).css("color", "black");
//         });
//         $("#userName").blur(function(){
//             document.getElementById("userNameStatus").innerHTML = "Checking...";
//         var rescueType = document.getElementById("rescueType").value;
//         var obj = {
//             "request" : "username",
//             "value" : userName.value,
//             "rescueType" : rescueType
//         };
//             if(!(userName.value.length) == 0 ){
//                 var result = verifyUsername(obj);
//             }else{
//                 $("#userNameStatus").css("color", "red");
//                 document.getElementById("userNameStatus").innerHTML = "can't be blank";
//             }
//         });

// });


var rescueType = document.getElementById("rescueType");
var uniqueKey = document.getElementById("uniqueKey");
var uniqueKeyErr = false;

var userName = document.getElementById("userName");
var userNameErr = false;
var password = document.getElementById("password");
var passwordCnf = document.getElementById("passwordCnf");
var passwordErr = false;



function validateForm1(){

    //CHECKING KEY-------------------------------------------------------------------
    if(uniqueKey.value == ""){
        uniqueKeyErr = false;
        document.getElementById("keyCheckStatus").style.color = "red";
        document.getElementById("keyCheckStatus").innerHTML = "Can't be empty";
    }else if(uniqueKey.value.length == 6){
        var obj = {
            "request" : "key",
            "value" : uniqueKey.value
           };
        var result = verifyKey(obj);
        //console.log("usererr fun "+window.uniqueKeyErr);

    }
    else{
        uniqueKeyErr = false;
        document.getElementById("keyCheckStatus").style.color = "red";
        document.getElementById("keyCheckStatus").innerHTML = "Needs 6-characters";
    }

    //CHECKING USERNAME---------------------------------------------------------------
    if(userName.value == ""){
        userNameErr = false;
        document.getElementById("userNameStatus").style.color = "red";
        document.getElementById("userNameStatus").innerHTML = "Can't be empty";
    }else if(userName.value.length >= 6){
        var obj = {
                        "request" : "username",
                        "value" : userName.value
                    };
                var result = verifyUsername(obj);
        //console.log("usererr fun "+window.userNameErr);
  
    }
    else{
        userNameErr = false;
        document.getElementById("userNameStatus").style.color = "red";
        document.getElementById("userNameStatus").innerHTML = "Needs atleast 6-characters";
    }


    //CHECKING PASSWORDS---------------------------------------------------------------
    if(password.value == "" || passwordCnf.value == ""){
        document.getElementById("passwordCnfStatus").style.color = "red";
        document.getElementById("passwordStatus").style.color = "red";
        $("#passwordIcon").removeClass();
        $("#passwordCnfIcon").removeClass();
        $("#passwordIcon").addClass("fa fa-times");
        $("#passwordCnfIcon").addClass("fa fa-times");
        document.getElementById("passwordErr").style.color = "red";
        document.getElementById("passwordErr").innerHTML = "Missing password field";
        passwordErr = false;

    }

    else if(password.value == passwordCnf.value){
        if(password.value.length <6 || passwordCnf.value.length <6 ){
            document.getElementById("passwordCnfStatus").style.color = "red";
            document.getElementById("passwordStatus").style.color = "red";
            $("#passwordIcon").removeClass();
            $("#passwordCnfIcon").removeClass();
            $("#passwordIcon").addClass("fa fa-times");
            $("#passwordCnfIcon").addClass("fa fa-times");
            document.getElementById("passwordErr").style.color = "red";
            document.getElementById("passwordErr").innerHTML = "Password length should be minimum 6 characters";
            passwordErr = false;
    
        }
        else{
            document.getElementById("passwordCnfStatus").style.color = "green";
            document.getElementById("passwordStatus").style.color = "green";
            $("#passwordIcon").removeClass();
            $("#passwordCnfIcon").removeClass();
            $("#passwordIcon").addClass("fa fa-check");
            $("#passwordCnfIcon").addClass("fa fa-check");
            document.getElementById("passwordErr").style.color = "green";
            document.getElementById("passwordErr").innerHTML = "";

            passwordErr = true;
        }
    }
    
    
    else{
        document.getElementById("passwordCnfStatus").style.color = "red";
        document.getElementById("passwordStatus").style.color = "red";
        $("#passwordIcon").removeClass();
        $("#passwordCnfIcon").removeClass();
        $("#passwordIcon").addClass("fa fa-times");
        $("#passwordCnfIcon").addClass("fa fa-times");
        document.getElementById("passwordErr").style.color = "red";
        document.getElementById("passwordErr").innerHTML = "Password don't match";

        passwordErr = false;    
    }

    // console.log("Unique key "+uniqueKeyErr+" unsername "+userNameErr+" pass "+passwordErr);
        if(uniqueKeyErr && userNameErr && passwordErr ){
            document.getElementById("proceedButton").disabled = true;
            document.getElementById("proceedButton").innerHTML = 'Processing <i class="fa fa-cog fa-spin"></i>';
            setTimeout(function() {
            document.getElementById("step1").hidden = true;
            document.getElementById("step2").hidden = false;
        }, 3000);

        }

}



function verifyKey(obj){
    dbParam = JSON.stringify(obj);
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);
            var messageTarget = document.getElementById("keyCheckStatus");
            if(myObj["Status"] == "Verified"){
                if(myObj["Active"] == 1){
                    messageTarget.style.color = "red";
                    messageTarget.innerHTML = "Already in use!";
                    window.uniqueKeyErr = false;
    
                }else{
                    messageTarget.style.color = "green";
                    messageTarget.innerHTML = myObj["Status"];
                   // console.log("im here");
                    window.uniqueKeyErr = true;
                }
            }else{
                messageTarget.style.color = "red";
                messageTarget.innerHTML = myObj["Status"];
                window.uniqueKeyErr = false;
            }
        }
    };
    var url = "php/verify.php";
    xmlhttp.open("POST", url, false);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("x=" + dbParam);

}



//////Username verification-------------------------------------------

function verifyUsername(obj){
    dbParam = JSON.stringify(obj);
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);
            var messageTarget = document.getElementById("userNameStatus");
            if(myObj["Status"] == "Used"){
                    messageTarget.style.color = "red";
                    messageTarget.innerHTML = "Already in use!";
                   // console.log("username wrong....");
                    window.userNameErr = false;

                }else if(myObj["Status"] == "Available"){
                messageTarget.style.color = "green";
                messageTarget.innerHTML = "Available";
               // console.log("username right ....");
                window.userNameErr = true;
            }
        }
    };
    var url = "php/verify.php";
    xmlhttp.open("POST", url, false);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("x=" + dbParam);

}

//MATCHING PASSWORD---------------------------------------------
// $("#uniqueKey").focus(function(){
//     $(this).css("color", "black");
// });
// $("#uniqueKey").blur(function(){
//    var field = document.getElementById("uniqueKey");
//    var obj = {
//     "request" : "key",
//     "value" : field.value
//    };
//    if(field.value.length == 6){
//     document.getElementById("keyCheckStatus").innerHTML = "Checking...";
//     var result = verifyKey(obj);
//    }else{
//        if(field.readOnly == false && field.value.length <6){
//         $("#keyCheckStatus").css("color", "red");
//         document.getElementById("keyCheckStatus").innerHTML = "Needs 6 charactors";
//         userName.readOnly = true;
//         password.readOnly = true;
//         passwordCnf.readOnly = true;
//        }
// }
// });

//FORM VALIDATION


  function validateForm(){
  
    //VALIDATION VARIABLES
    var rescueNameValid = contactNoValid = mobileNoValid = addressValid = cityValid = stateValid = locationValid = true;

    //CHECKING RESCUE CENTER NAME................
    var rescueName = document.getElementById("rescueName");
    if(rescueName.value == ""){
        document.getElementById("rescueNameErr").innerHTML = "Please fill the required field!";
        rescueNameValid = false;
    }else{
        document.getElementById("rescueNameErr").innerHTML = "";
        rescueNameValid = true;
    }

    //CHECKING CONTACT NUMBER....................
      var mobileNo = document.getElementById("mobileNo");
      var contactNo = document.getElementById("contactNo");
  
    if( contactNo.value == "" && mobileNo.value ==""){
        document.getElementById("contactErr").innerHTML = "Please provide atleast one contact number!";
        contactNoValid = false;
    }else if(contactNo.value == "" && !mobileNo.value ==""){
        if(isNaN(mobileNo.value) || ! /^\d{10}$/.test(mobileNo.value)){
        document.getElementById("contactErr").innerHTML = "Enter valid mobile number !";
        mobileNoValid = false;
    }else{
        document.getElementById("contactErr").innerHTML = "";
        mobileNoValid = true;
    }
    }else if(!contactNo.value == "" && mobileNo.value ==""){
        if(isNaN(contactNo.value)){
            document.getElementById("contactErr").innerHTML = "Enter valid contact number !";
            contactNoValid = false;
        }else{
        document.getElementById("contactErr").innerHTML = "";
         contactNoValid = true;
        }
    }else if(!(contactNo.value == "" && mobileNo.value =="")){
        mobileNoValid = true;
        contactNoValid = true;
    }

    // if(mobileNo.value == "" && contactNo == "" ){
    //     document.getElementById("contactErr").innerHTML = "This field can't be empty !";
    // }else if(isNaN(contactNo.value) || ! /^\d{10}$/.test(contactNo.value)){
    //     document.getElementById("contactErr").innerHTML = "Enter valid phone number !";
    //     contactNo.focus();
    // }else{
    //     document.getElementById("contactErr").innerHTML = "";
    // }

    //CHECKING ADDRESS............................
    var address = document.getElementById("address");
    if(address.value == ""){
        document.getElementById("addressErr").innerHTML = "Enter valid address so we could contact you !";
        addressValid = false;
    }else{
        document.getElementById("addressErr").innerHTML = "";
        addressValid = true;
    }

    //CHECKING CITY..............................
    var city = document.getElementById("city");
    if(city.value == ""){
        document.getElementById("cityErr").innerHTML = "Enter a valid city!";
        cityValid = false;
    }else{
        document.getElementById("cityErr").innerHTML = "";
        cityValid =  true;
    }

    //CHECKING PINCODE............................
    var pin = document.getElementById("pincode");
    if(pin.value == "" || isNaN(pin.value) || ! /^\d{6}$/.test(pin.value)){
        document.getElementById("pincodeErr").innerHTML = "Enter a valid pincode!";
        pinValid = false;
    }else{
        document.getElementById("pincodeErr").innerHTML = "";
        pinValid = true;
    }
    
    //CHECKING STATE..............................
    var state = document.getElementById("state");
    if(state.value == ""){
        document.getElementById("stateErr").innerHTML = "Enter a valid state!";
        stateValid = false;
    }else{
        document.getElementById("stateErr").innerHTML = "";
        stateValid = true;
    }

    //CHECKING COORDINATES.......................
    var latitude = document.getElementById("latitude");
    var longitude = document.getElementById("longitude");
    if(latitude.value == "" || longitude.value == ""){
        document.getElementById("locationErr").innerHTML="Please click the button to detect the loaction";
        locationValid = false;
    }else{
        locationValid = true;
    }

    //SEND TO SERVER.............................
    if(rescueNameValid && contactNoValid && mobileNoValid &&
        addressValid && cityValid && stateValid &&
        locationValid &&uniqueKeyErr && userNameErr && passwordErr){
       var obj = {
                "rescueType" : rescueType.value,
                "rescueName" : rescueName.value,
                "mobileNo"  :  mobileNo.value,
                "phoneNo" :  contactNo.value,
                "address"   :  address.value,
                "city"      :  city.value,
                "pincode"   :   pin.value,
                "state"     :   state.value,
                "latitude" :   latitude.value,
                "longitude" :   longitude.value,
                "userName" : userName.value,
                "password" : password.value,
                "uniqueKey" : uniqueKey.value
            };
       showLoader();
        registerOnServer(obj);
    }else{
            //alert("err hai");
    }
}


//AJAX REQUEST HANDLER--------------------------------------------
function registerOnServer(obj){
    dbParam = JSON.stringify(obj);
    xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var myObj = JSON.parse(this.responseText);
            
            document.getElementById("message").innerHTML = myObj["Message"];
        }
    };
    var url = "php/registerRescueCenter.php";
    xmlhttp.open("POST", url, true);
    xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send("x=" + dbParam);

}

 function showLoader(){
     var hide = document.getElementById("step2");
     hide.hidden = true;

    var show = document.getElementById("loader");
    show.hidden = false;

    var link = document.getElementById("homePageLink");
    link.hidden = false;
}