$(function () {
    $('#datetimepicker1').datetimepicker({
      format: 'MM/dd/yyyy hh:mm:ss',
      language: 'en',
      pick12HourFormat: true
    });
    $('#datetimepicker2').datetimepicker({
      format: 'MM/dd/yyyy hh:mm:ss',
      language: 'en',
      pick12HourFormat: true
    });

    $("#cluster-dd").change(function(){
	    var selectedCluster = $("#cluster-dd option:selected").text();

		if(selectedCluster==''){
			triggerCollect();
		}
        else{
            getInitialState(selectedCluster);
        }
	});

    $("#type-dd").change(function(){
      
        triggerCollect();
        
    });

    $("#limit-dd").change(function(){
      
        triggerCollect();
        
    });

        $('#from-time').on('changeDate', function(){
      
        triggerCollect();
        
    });

    $('#to-time').on('changeDate', function(){
      
        triggerCollect();
        
    });


    $("#clearSelectionBtn").click(function(){
   
    populateServicesCombo();
  
    var sfilekey="All";
    var shostIP="All";
    var sfromTime="All";
    var stoTime = "All";     

      reloadIFrame({'filekey':sfilekey,'hostIP':shostIP,'fromTime':sfromTime,'toTime':stoTime});

    });

    $("#submitBtn").click(function(){
  
    var sfilekey= $("#type-dd option:selected").text();
    var shostIP=  $("#cluster-dd option:selected").text();
    var sLimit =  $("#limit-dd option:selected").text();
    var sfromTime= document.getElementById("from-time").value;  
    var stoTime = document.getElementById("to-time").value;       

      reloadIFrame({'filekey':sfilekey,'hostIP':shostIP,'fromTime':sfromTime,'toTime':stoTime,'limit':sLimit});

    });
   

});


function triggerCollect(){

        var selectedFilekey = $("#type-dd option:selected").text();        
        var selectedhostIP =  $("#cluster-dd option:selected").text();
        var selectedLimit =  $("#limit-dd option:selected").text();
        var fromTime = document.getElementById("from-time").value;    
        var toTime = document.getElementById("to-time").value;      

        reloadIFrame({'filekey':selectedFilekey,'hostIP':selectedhostIP,'fromTime':fromTime,'toTime':toTime,'limit':selectedLimit});
};


function reloadIFrame(param){
    var params = param || {};
    var filekey = param.filekey || "All";
    var hostIP = param.hostIP || "All";
    var fromTime = param.fromTime || "All";
    var toTime =param.toTime || "All";
    var limit = param.limit;
    

    $("iframe").each(function(){
      
        var currentUrl = $(this).attr("src");
        if(currentUrl.indexOf('?') != -1){
            var absUrl = currentUrl.split('?');
            currentUrl = absUrl[0];
        }
        var newUrl = currentUrl+"?filekey="+filekey+"&hostIP="+hostIP+"&fromTime="+fromTime+"&toTime="+toTime+"&limit="+limit;
        $(this).attr('src',newUrl);
    });
};

$(document).ready(function(){

    populateServicesCombo();

    populateLimit();

    //If no user action, reload page to prevent session timeout.
    var wintimeout;
    function setWinTimeout() {
        wintimeout = window.setTimeout("location.reload(true)",1740000); //setting timeout for 29 minutes. Actual timeout is 30 minutes.
    }
    $('body').click(function() {
        window.clearTimeout(wintimeout);
        setWinTimeout();
    });
    setWinTimeout();
   
});


function getInitialState(hostIP)
{    
   
    $.ajax({
            url:'populate_combos_ajaxprocessor.jag?method=filekey&hostIp='+hostIP,
        dataType:'json', 
        success:function(result){
         
            var options = "<option>"+"All"+"</option>";

            for(var i=0;i<result.length;i++){
                var data = result[i];
                for(var key in data){
                    options = options + "<option>"+data[key]+"</option>"
                }
            }
            $("#type-dd").find('option').remove();
            $("#type-dd").append(options);

              
        }
        
    });
}



function populateServicesCombo(){
  
     
     $.ajax({
       		url:'populate_combos_ajaxprocessor.jag?method=ip',
		dataType:'json',
		
		success:function(result){
        
            var options = "<option>"+"All"+"</option>";

			for(var i=0;i<result.length;i++){
				var data = result[i];
				for(var key in data){
					options = options + "<option>"+data[key]+"</option>"
				}
			}
            $("#cluster-dd").find('option').remove();
            $("#cluster-dd").append(options);
            
		    triggerCollect();
  	    }
	

	});
	
};

function populateLimit(){


            var options = "<option>"+"0"+"</option>";

            for(var j=1;j<10;j++){

                    options = options + "<option>"+j*5+"</option>"

            }

            for(var j=1;j<11;j++){

                    options = options + "<option>"+j*50+"</option>"

            }
            $("#limit-dd").find('option').remove();
            $("#limit-dd").append(options); 



};




