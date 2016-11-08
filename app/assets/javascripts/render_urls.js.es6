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
  if(urlsData.read && urlsData.tag === "") {
    return $(`
      <div class="url" data-id="${urlsData.id}">
      <h5>TITLE: </h5><p contenteditable="true" id="url-title">${urlsData.title}</p>
      <h5>URL: </h5><a contenteditable="true" id="url" class="unread" href="${urlsData.url}">${urlsData.url}</a></br></br>
      <h5>ADD TAG: </br></br>
      <p contenteditable="true" id="add-tag">Add tag here...</p>
      <button type="button" class="mark-as-unread btn btn-info btn-sm">Mark as unread</button>
      <button type="button" class="delete btn btn-danger btn-sm">Delete</button>
      </div></br>`)
  } else if (!urlsData.read && urlsData.tag === "") {
    return $(`
      <li class="url" data-id="${urlsData.id}">
      <h5>TITLE: </h5><p contenteditable='true' id="url-title">${urlsData.title}</p>
      <h5>URL: </h5><a contenteditable='true' id="url" href="${urlsData.url}">${urlsData.url}</a></br></br>
      <h5>ADD TAG: </br></br>
      <p contenteditable="true" id="add-tag">Add tag here...</p>
      <button type="button" class="mark-as-read btn btn-success btn-sm">Mark as read</button>
      <button type="button" class="delete btn btn-danger btn-sm">Delete</button>
      </li></br>`)
  } else if (urlsData.read && urlsData.tag != "") {
    return $(`
      <div class="url" data-id="${urlsData.id}">
      <h5>TITLE: </h5><p contenteditable="true" id="url-title">${urlsData.title}</p>
      <h5>URL: </h5><a contenteditable="true" id="url" class="unread" href="${urlsData.url}">${urlsData.url}</a></br></br>
      <h5>TAG: </h5><p contenteditable="true" id="tag" class="add-tag">${urlsData.tag}</p>
      <button type="button" id="remove-tag" class="btn btn-danger btn-sm">Remove Tag</button>
      <button type="button" class="mark-as-unread btn btn-info btn-sm">Mark as unread</button>
      <button type="button" class="delete btn btn-danger btn-sm">Delete</button>
      </div></br>`)
  } else if (!urlsData.read && urlsData.tag != "") {
    return $(`
      <li class="url" data-id="${urlsData.id}">
      <h5>TITLE: </h5><p contenteditable='true' id="url-title">${urlsData.title}</p>
      <h5>URL: </h5><a contenteditable='true' id="url" href="${urlsData.url}">${urlsData.url}</a></br></br>
      <h5>TAG: </h5><p contenteditable="true" id="tag" class="add-tag">${urlsData.tag}</p>
      <button type="button" id="remove-tag" class="btn btn-danger btn-sm">Remove Tag</button>
      <button type="button" class="mark-as-read btn btn-success btn-sm">Mark as read</button>
      <button type="button" class="delete btn btn-danger btn-sm">Delete</button>
      </li></br>`)
  }
}

function renderUserUrls( urlsData ) {
  $("#list-of-urls").html(urlsData);
}

function resetForm() {
  $('#url-title').val('')
  $('#url-url').val('')
}
