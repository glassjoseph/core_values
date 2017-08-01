$( document ).ready(function(){
  // $("body").on("click", "#add-value", postLink)

  $("body").on("click", "#choices #no-button", function(){
    $('#choices').hide('slow')
    $('#no').fadeIn('slow')
  })

  $("body").on("click", "#choices #ok-button", function(){
    $('#1').hide('slow')
    $('#choices').hide('slow')
    $('#2').fadeIn('slow')
  })

  $("body").on("click", "#finished", function(){
    $('#2').hide('slow')
    $('#choices').hide('slow')
    $('#3').fadeIn('slow')
  })

  $("body").on("click", "#priorities-finished", function(){
    $('#3').hide('slow')
    $('#choices').hide('slow')
    $('#4').fadeIn('slow')
  })


  $( "#values" ).sortable();


  $("body").on("click", "#add-value", appendValue)



  // $('#values  li:lt(2)')
})



// var dataSource = $("#chart2").attr("data-source");
//
// var data2 = JSON.parse(dataSource);
// var chart = c3.generate({
//   bindto: '#chart2',
//   data: { columns: data2 }
// });
//
//


// function postLink(e) {
//   e.preventDefault();
//
//   var url = $('#link_url').val()
//   var title = $('#link_title').val()
//
//   $.ajax({
//     type: "POST",
//     url: "links/",
//     data: {link: {title: title, url: url} }
//   }).then(prependLink)
//     .fail(function(data) {  $('.errors').text(data.responseText.replace('[', '').replace(']', '')   )})
// }

function appendValue() {
  var data = $('#values-input').val()
  if (data !== "") {
    $('#values').append(
      "<li class='value'>" + data + "</li>")
    clearInputs()
    $('input').focus()
  }
}

function clearInputs() {
  $('input').val('')
}
