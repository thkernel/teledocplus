$(document).on('turbolinks:load', function(){


     $('body').on('shown.bs.modal', '.modal', function() {

    
    	ajaxFilterByID("#invitation_organization_id", "/invitations/get_services", "GET");

    });
});
