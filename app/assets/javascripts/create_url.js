function createUrl() {
  $('#create-url').on('click', function(event) {
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
       alert('Invalid URL. Please enter a valid URL.');
      }
    }).then(getUserUrls)
    .then(resetForm)
  })
}

function handleError(){
  $('#list-of-urls').prepend('Invalid URL');
  getUserUrls();
}

function getUserUrls() {
  $.get({
    url: "api/v1/urls"
  }).then(collectUserUrls)
  .then(renderUserUrls)
}

function collectUserUrls( urlsData ) {
  return urlsData.map(createUrlHTML);
}

function createUrlHTML( urlsData ) {
  return $(`<div class="url" data-id="urlData.id">
  <h5>Title: </h5> <p>${urlsData.title}</p>
  <h5>URL: </h5> <p>${urlsData.url}</p>
  <h5>Read: </h5> <p>${urlsData.read}</p>
  </div>`)
}

function renderUserUrls( urlsData ) {
  $("#list-of-urls").html(urlsData);
}

function resetForm() {
  $('#url-title').val('')
  $('#url-url').val('')
}
