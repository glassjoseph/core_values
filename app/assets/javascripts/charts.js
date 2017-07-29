$( document ).ready(function(){
  // $("body").on("click", "#add-value", postLink)
  dailyChart()
})


function dailyChart() {
  let dataSource = $("#chart").attr("data-source");
  if (dataSource != undefined) {
    let data = JSON.parse(dataSource);
    let chart = c3.generate({
      bindto: "#chart",
      data: {
        columns: data,
        type : 'spline'
      },
    });
  }
}


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
