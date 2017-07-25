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


  $( function() {
    $( "#values" ).sortable();
  } );



  $("body").on("click", "#add-value", appendValue)


  // $('#values  li:lt(2)')
})



// function postLink(e) {
//   e.preventDefault();
//
//   let url = $('#link_url').val()
//   let title = $('#link_title').val()
//
//   $.ajax({
//     type: "POST",
//     url: "links/",
//     data: {link: {title: title, url: url} }
//   }).then(prependLink)
//     .fail(function(data) {  $('.errors').text(data.responseText.replace('[', '').replace(']', '')   )})
// }

function appendValue() {
  let data = $('#values-input').val()
  if (data !== "") {
    $('#values').append(
      `<li class="value">${data}</li>`)
    clearInputs()
    $('input').focus()
  }
}

function clearInputs() {
  $('input').val('')
}
