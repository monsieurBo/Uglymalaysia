// console.log("hello from articles")
//
// $("#tag-search").on("keyup", function(){
//   autocomplete()
// });
//
// function autocomplete(){
//   var tags = $('.autocomplete-tag').data('autocomplete-source');
//   console.log(tags);
  // $.ajax({
  //   url: '/articles/search/:tag',
  //   type: 'GET',
  //   data: $("#tag-search").serialize(), //takes the form data and authenticity toke and converts it into a standard URL
  //   dataType: 'json', //specify what type of data you're expecting back from the servers
  //   error: function() {
  //       console.log("Something went wrong");
  //   },
  //   success: function(data) {
  //     console.log(data)
  //     $("#list").html("");
  //
  //     data.forEach(function(element) {
  //       var option = document.createElement("option");
  //       option.value = element;
  //
  //       //append option to list
  //       $("#list").append(option);
  //     });
  //   }
  // });
// }

// $(function() {
//     var tags  =  $('.autocomplete-tag').data('autocomplete-source');
//     $( ".autocomplete-tag" ).autocomplete({
//        source: tags
//     });
//  });

// $(document).ready(function(){ $(‘#tag-search’).select2();
// });
//
// $(function() {
//   $('#tag_search').select2({tags:[]})
// });
