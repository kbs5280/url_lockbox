function sortAlphabetically() {
  $('#sort-alphabetically').on('click', function(){

    $.get({
      url: 'api/v1/sort_alphabetically'
    }).then(collectUserUrls)
    .then(renderUserUrls)
  })
}
