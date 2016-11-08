function associatedTags() {
  $('#list-of-urls').on('click', 'a', function(event){
    event.preventDefault();

    var $url = $(this).closest('.url')
    var $tag = $(this).parent().find('#tag').html()

    var tagParams = {
      url: {
        tag: $tag
      }
    }

    $.get({
      url: 'api/v1/associated_tags',
      data: tagParams
    }).then(collectUserUrls)
    .then(renderUserUrls)
  })
}
