function filterSearch(){
  $('#searchUrls').on('keyup', function(){

    var searchInput = $(this).val().toLowerCase();

    $(".url").each(function(index, url){

      var title = $(this).find("#url-title").text().toLowerCase();
      var checkUrls = title.indexOf(searchInput) !== -1;

      if (checkUrls){
        $(url).show();
      } else {
        $(url).hide();
      }
    });
  });
}
