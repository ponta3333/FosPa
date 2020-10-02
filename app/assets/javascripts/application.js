// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .

// ハンバーガーメニュー
$(document).on('turbolinks:load', function() {
	$(function() {
	  $('.menu-trigger').on('click', function(event) {
	    $(this).toggleClass('active');
	    $('#sp-menu').fadeToggle();
	    event.preventDefault();
	  });
	});
});

// preview
$(document).on('turbolinks:load', function() {
  $(function() {
    // inputのidから情報の取得
    $('#image').on('change', function (e) {
	// ここから既存の画像のurlの取得
      var reader = new FileReader();
      reader.onload = function (e) {
        $(".image").attr('src', e.target.result);
      }
	// ここまで
    reader.readAsDataURL(e.target.files[0]); //取得したurlにアップロード画像のurlを挿入
    });
  });
});

// 動物登録・編集フォームの種類選択
$(document).on('turbolinks:load', function() {
  $(function() {
    $("#kettei").on("click",function() {
      if ($("input[name='genre_radio']:checked").val() == 1) {
        $(".dog_select").attr("style","display: inline;");
        $(".cat_select").attr("style","display: none;");
      } else {
        $(".cat_select").attr("style","display: inline;");
        $(".dog_select").attr("style","display: none;");
      }
    });
  });
});
//スライドショー
$(".theTarget").skippr({
  transition : 'fade',
  speed : 1000,
  easing : 'easeOutQuart',
  navType : 'block',
  childrenElementType : 'div',
  arrows : true,
  autoPlay : true,
  autoPlayDuration : 5000,
  keyboardOnAlways : true,
  hidePrevious : false
});