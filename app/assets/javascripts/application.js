// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery

//= require bootstrap
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .

// $(document).on('turbolinks:load', function()  {
// // $(document).on 'turbolinks:load', ->
// // $(document).on('page:change', function(){
//
//   $('#upload_homework').hide(); //Initially form wil be hidden.
//
//     $('#homework_popup_button').click(function() {
//     $('#upload_homework').toggle("slow");//Form shows on button click
//
//    });
//  });

 // $(document).on('turbolinks:load', function()  {
 //   $('.file-import').attr('disabled', true);
 //   $('input:file').change(
 //     function(){
 //       if ($(this).val()){
 //         $('.file-import').removeAttr('disabled');
 //       } else {
 //         $('.file-import').attr('disabled', true);
 //       }
 //     }
 //   );
 // });

 // $(document).on('turbolinks:load', function() {
 //   $('.vote-btn').attr('disabled', false);
 //   $('.vote-btn').on('ajax:success', function(){
 //     $(this).attr('disabled', true);
 //   })
 // });

// $(document).on('turbolinks:load', function() {
//   // $('.vote-btn').attr('disabled', true);
//   $('.vote-btn').on("ajax:success", function() {
//     // $(this).attr('disabled', 'true');
//     $(this).css('color', 'red');
//     $(this).css('background-color', 'red');
//   });
// });

$(document).on('turbolinks:load', function() {
  // $('.vote-btn').on('submit', function() {
  // // $('.button_to').on('submit', function() {
  //   // $(this).css('color', 'red');
  //   // $(this).css('background-color', 'red');
  //   $(this).attr('disabled', true);
  // })
  $('.vote-btn').on('click', function() {
  // $('.vote-btn').closest('form').on('ajax:complete', function() {
  // $('.vote-btn').parents('form').on('click', function() {
    $(this).css('color', 'white');
    $(this).attr('disabled', true);
    console.log('ajax:success!');
    // alert(event.body);
  });
});
