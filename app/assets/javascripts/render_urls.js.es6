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
  if(urlsData.read) {
    return $(`
      <div class="url" data-id="${urlsData.id}">
      <h5>TITLE: </h5><p contenteditable="true" id="url-title">${urlsData.title}</p></br>
      <h5>URL: </h5><a contenteditable="true" id="url" class="unread" href="${urlsData.url}">${urlsData.url}</a></br></br>
      <button type="button" class="mark-as-unread btn btn-info btn-sm">Mark as unread</button>
      </div></br>`)
  }
  return $(`
    <li class="url" data-id="${urlsData.id}">
    <h5>TITLE: </h5><p contenteditable='true' id="url-title">${urlsData.title}</p><br>
    <h5>URL: </h5><a contenteditable='true' id="url" href="${urlsData.url}">${urlsData.url}</a></br></br>
    <button type="button" class="mark-as-read btn btn-info btn-sm">Mark as read</button>
    </li></br>`)
}

function renderUserUrls( urlsData ) {
  $("#list-of-urls").html(urlsData);
}

function resetForm() {
  $('#url-title').val('')
  $('#url-url').val('')
}
