$(document).on('turbolinks:load', function() {
	$('#card-modal').on('shown.bs.modal', function() {

	    const webcamElement = document.getElementById('webcam');
		const canvasElement = document.getElementById('canvas');
		//const snapSoundElement = document.getElementById('snapSound');
		const webcam = new Webcam(webcamElement, 'user', canvasElement);

		webcam.start()
		  .then(result =>{
		    console.log("webcam started");
		  })
		  .catch(err => {
		    console.log(err);
		});


		 $('#snap').on('click', function() {
			let picture = webcam.snap();
			
			document.querySelector('#snap-photo').value = picture;
			alert("Photo prise avec succès!");
	    
		});
	});


});


/*
$(document).on('turbolinks:load', function() {
	$('#card-modal').on('shown.bs.modal', function() {
		$('#snap').on('click', function() {
			let picture = webcam.snap();
			document.querySelector('#snap-photo').href = picture;
			alert("Snap");
	    
		});
	    
	});


});
*/