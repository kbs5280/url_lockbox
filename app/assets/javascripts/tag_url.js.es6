function tagUrl() {
  $('#list-of-urls').on('blur', '#add-tag', function(){

    var $url = $(this).closest('.url')
    var $tags = $(this).parent().find('#add-tag').html()

    var createTag = {
      url: {
        tags: $tags,
        urlId: $url.data('id')
      }
    }

    $.ajax({
      url: 'api/v1/tags/',
      data: createTag,
      method: 'POST',
      error: function(xhr, textStatus, errorThrown){
       alert('Tag not updated.');
       getUserUrls();
     }
   }).then(getUserUrls)
  })
}

function removeTag() {
  $('#list-of-urls').on('click', '#remove-tag', function(){

    var $url = $(this).closest('.url')

    var updateTag = {
      url: {
        tag: ""
      }
    }

    $.ajax({
      url: 'api/v1/urls/' + $url.data('id') + '.json',
      data: updateTag,
      method: 'PUT',
      error: function(xhr, textStatus, errorThrown){
       alert('Tag not updated.');
       getUserUrls();
     }
   }).then(getUserUrls)
  })
}
