function deleteUrl() {
  $('#list-of-urls').on('click', '.delete', function() {

    var $url = $(this).closest('.url')

    $.ajax({
      url: '/api/v1/urls/' + $url.data('id') + '.json',
      method: 'DELETE',
      error: function(xhr, textStatus, errorThrown){
       alert('URL not deleted.');
     }
    }).then( function() {
      $url.remove()
    })
  })
}
