function updateTitle() {
  $('#list-of-urls').on('blur', '#url-title', function(){

    var $url = $(this).closest('.url')
    var $title = $(this).parent().find('#url-title').html()

    var updateTitle = {
      url: {
        title: $title
      }
    }

    $.ajax({
      url: 'api/v1/urls/' + $url.data('id') + '.json',
      data: updateTitle,
      method: 'PUT',
      error: function(xhr, textStatus, errorThrown){
       alert('Title not updated.');
       getUserUrls();
     }
   }).then(getUserUrls)
  })
}

function updateUrl() {
  $('#list-of-urls').on('blur', '#url', function(){

    var $url = $(this).closest('.url')
    var $title = $(this).parent().find('#url-title').html()
    var $urlName = $(this).parent().find('#url').html()

    var updateUrl = {
      url: {
        url: $urlName
      }
    }

    $.ajax({
      url: 'api/v1/urls/' + $url.data('id') + '.json',
      data: updateUrl,
      method: 'PUT',
      error: function(xhr, textStatus, errorThrown){
       alert('URL not updated.');
       getUserUrls();
     }
   }).then(getUserUrls)
  })
}
