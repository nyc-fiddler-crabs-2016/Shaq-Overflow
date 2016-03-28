// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
	$("#question_comment_link").on('click', function(event){
		event.preventDefault();
		$(".new_comment").toggle();
	})

	$("#question_answer_link").on('click', function(event){
		event.preventDefault();
		$(".new_answer").toggle();
	})

	$(".answer_comment_button").on('click', function(event){
		event.preventDefault();
		$(this).parent().find(".answer_comment_form").toggle();
	})

});
