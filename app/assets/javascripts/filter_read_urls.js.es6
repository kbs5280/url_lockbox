function filterReadUrls() {
  $('#filter-read-urls').on('click', function(){

    $.get({
      url: "api/v1/read_urls"
    }).then(collectUserUrls)
    .then(renderUserUrls)
  })
}

function filterUnreadUrls() {
  $('#filter-unread-urls').on('click', function(){

    $.get({
      url: "api/v1/unread_urls"
    }).then(collectUserUrls)
    .then(renderUserUrls)
  })
}
