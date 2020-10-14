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
//= require bxslider
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
$(document).on('turbolinks:load', function() {
  $(document).ready(function(){
    $('.bxslider').bxSlider({
      auto: true,           // 自動スライド
      speed: 1000,          // スライドするスピード
      moveSlides: 1,        // 移動するスライド数
      pause: 3000,          // 自動スライドの待ち時間
      maxSlides: 4,         // 一度に表示させる最大数
      minSlides: 4,         // 一度に表示させる最小数
      slideWidth: 250,      // 各スライドの幅
      touchEnabled: false,  // モバイルデバイスのタッチ、スワイプに反応
      responsive: true,     // レスポンシブ
      randomStart: true,    // 最初に表示するスライドをランダムに設定
      autoHover: true       // ホバー時に自動スライドを停止
    });
  });
});
//住所自動入力
$(document).on('turbolinks:load', function() {
  $("#user_postal_code").jpostal({
    postcode : ["#user_postal_code"],
    address : {
                "#user_address" : "%3%4%5%6%7"
              }
  });
});
