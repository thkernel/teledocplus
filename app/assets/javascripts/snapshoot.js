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
	});


});