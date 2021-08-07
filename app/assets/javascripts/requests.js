$(document).on('turbolinks:load', function(){

    //$('#request-modal').on('shown.bs.modal', function() {
        
        $("#request_identification_number").on('focusout', function() {
            
            ajaxGetData("#request_identification_number", "/get_kairos_data", "GET");
        });

        $("#request_academic_year").on('focusout', function() {
            
            ajaxGetData("#request_academic_year", "/get_kairos_annee_scolaire", "GET");
        });

        hideOrDisplayFields();

        $("#request_request_type_id").on('change', function(){
            hideOrDisplayFields();
        });

       
    //});
});


function ajaxGetData(source, route, verb){
    console.log("Source: ", source);
    

    var target_id = event.target.id;
    var target_value = $("#"+target_id ).val();
    console.log("SOURCE: ", source);

    if (source == "#request_identification_number"){

        $.ajax({
            type: verb,
            headers: {
                'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                },
            dataType: 'json',
            url: route,
            cache:false,
            data: { id: target_value},  
          
            success: function(response) {
                console.log("USER: ", response.user);
                console.log("ETUDIANT: ", response.etudiant);

                user = response.user;
                etudiant = response.etudiant;
               

                born_date = new Date(etudiant.date_naissance);
                var date = born_date.getDate();
                var month = born_date.getMonth(); 
                var year = born_date.getFullYear();
                var yearMonthDate = year + "-" + (month <= 9 ? '0' + month : month) + "-" + (date <= 9 ? '0' + date : date) ;
                console.log("DATE: ", yearMonthDate);

                $("#request_first_name").val(user.prenom);
                $("#request_last_name").val(user.nom);
                $("#request_born_place").val(etudiant.lieu_naissance);
                $("#request_born_date").val(yearMonthDate);
                $("#request_gender").val(etudiant.sexe);

                    
                
                
            }
        });
    }
    else if (source == "#request_academic_year"){
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        var username = $("#request_identification_number").val();

        $.ajax({
            type: verb,
            headers: {
                'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                },
            dataType: 'json',
            url: route,
            cache:false,
            data: { annee_scolaire: target_value, username: username},  
          
            success: function(response) {
                console.log("DATA: ", response.classe);
                classe = response.classe;
                //etudiant = response.etudiant;
               

               

               $("#request_classroom").val(classe.sigle);
                

                    
                
                
            }
        });
    }
    
};


function hideOrDisplayFields(){

    request_request_type = $('#request_request_type_id').val();
    console.log("REQUEST TYPE: ", request_request_type); 

    if (request_request_type != null && request_request_type == "Oui"){
        $(".arrival_mail_linked_mail").css("display", "block");
        
    }
    else{
        $(".license_year").css("display", "none");
        $(".cycle").css("display", "none");
        $(".level").css("display", "none");
        $(".card_deliverance_date").css("display", "none");

    }
}
