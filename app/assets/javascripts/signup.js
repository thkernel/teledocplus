$(document).on('turbolinks:load', function() {
   
   selected = $("#user_profile_attributes_profile_type").val();

	if (selected == "Agence"){
        $(".user_profile_attributes_company").css("display", "block");
        $(".user_profile_attributes_full_name").css("display", "none");
        
    }
    else if (selected == "Client"){
        $(".user_profile_attributes_full_name").css("display", "block");
        $(".user_profile_attributes_company").css("display", "none");
        
    }
    else{
    	$(".user_profile_attributes_company").css("display", "none");
    	$(".user_profile_attributes_full_name").css("display", "none");
        
    }

    filter_profile_type();

        

});

function filter_profile_type(){

	
   

    // On change
	$("#user_profile_attributes_profile_type").on('change', function(){
        
        selected = $("#user_profile_attributes_profile_type").val();

        
        if (selected == "Agence"){
            $(".user_profile_attributes_company").css("display", "block");
            $(".user_profile_attributes_full_name").css("display", "none");
            
        }
        else if (selected == "Client"){
            $(".user_profile_attributes_full_name").css("display", "block");
            $(".user_profile_attributes_company").css("display", "none");
            
        }
        else{
        	$(".user_profile_attributes_company").css("display", "none");
        	$(".user_profile_attributes_full_name").css("display", "none");
            
        }

    });
}