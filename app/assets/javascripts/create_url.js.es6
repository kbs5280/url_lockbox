function createUrl() {
  $('#create-url').on('click', function(event){
    event.preventDefault();
    var title = $('#url-title').val();
    var url = $('#url-url').val();

    var urlParams = {
      url: {
        title: title,
        url: url
      }
    }

    $.post({
      url: 'api/v1/urls',
      data: urlParams,
      error: function(xhr, textStatus, errorThrown){
       alert('Please enter a valid URL and a unique title.');
      }
    }).then(getUserUrls)
    .then(resetForm)
  })
}
