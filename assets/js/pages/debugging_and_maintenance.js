ClassicEditor
    .create(document.querySelector('#MaintenanceMessage'), {
        // toolbar: ['bold', 'italic', 'bulletedList', 'numberedList', 'blockQuote']
    })
    .catch(error => {
        console.log(error);
    });