function markAsRead() {
  $('#list-of-urls').on('click', '.mark-as-read', function(event) {
    event.preventDefault();

    var $url = $(this).closest('.url')
    var $title = $(this).parent().find("#url-title").html()

    var updateStatus = {
      url: {
        read: true
      }
    }

    $.ajax({
      url: 'api/v1/urls/' + $url.data("id") + ".json",
      data: updateStatus,
      method: 'PUT',
      error: function(xhr, textStatus, errorThrown){
       alert('Status not updated.');
     }
   }).then(getUserUrls)
  })
}

function markAsUnread() {
  $('#list-of-urls').on('click', '.mark-as-unread', function(event) {
    event.preventDefault();

    var $url = $(this).closest('.url')
    var $title = $(this).parent().find("#url-title").html()

    var updateStatus = {
      url: {
        read: false
      }
    }

    $.ajax({
      url: 'api/v1/urls/' + $url.data("id") + ".json",
      data: updateStatus,
      method: 'PUT',
      error: function(xhr, textStatus, errorThrown){
       alert('Status not updated.');
     }
   }).then(getUserUrls)
  })
}
