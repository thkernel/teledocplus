document.addEventListener('turbolinks:load', function(event) {
    if (typeof gtag === 'function') {
      gtag('config', 'UA-173976085-1', {
        'page_location': event.data.url
      });
    }
  });