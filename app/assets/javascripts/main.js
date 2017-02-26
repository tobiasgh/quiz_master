$(document).ready(function() {
  if($(".index-table").length!=0) {
    $('table').on('click', 'tbody tr td:not(:last-child)', function () {
      if($(this).parent().children("tr td:last").find("a:contains('Show')").length != 0){
        window.location=($(this).parent().children("tr td:last").find("a:contains('Show')").attr('href'));
      }
    });
  }
});
