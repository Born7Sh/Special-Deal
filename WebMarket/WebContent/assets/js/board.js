// 답글 textarea 입력
function reComment(doc_srl,cmt_srl,edit_url,writer){
	var o = jQuery('#recomment-form').eq(0);
	o.find('input[name=error_return_url]').val('/'+doc_srl);
	o.find('input[name=mid]').val(current_mid);
	o.find('input[name=document_srl]').val(doc_srl);
	
	jQuery('#re_com_textarea').attr('placeholder',writer+'님께 답글쓰기');
	jQuery('#comment-form').hide();
	
	var msg = '입력된 내용을 취소 하시겠습니까?';
	
	if(o.find('textarea').val()) {
	   	var msg_confirm = confirm(msg);
		if(msg_confirm == true){	           
            o.appendTo(jQuery('#comment_'+cmt_srl)).fadeIn().find('input[name=parent_srl]').val(cmt_srl);
			o.find('textarea').val('').focus();
        } else {
	        o.find('textarea').focus();
            return false;
        }   
   	} else {
	   o.appendTo(jQuery('#comment_'+cmt_srl)).fadeIn().find('input[name=parent_srl]').val(cmt_srl);
	   o.find('textarea').focus();
   	}
   	o.find('textarea').css('height','');// 높이 초기화  
   	o.find('textarea').keyup(function() {
		var textLength = jQuery(this).val();	 	   
		jQuery(this).height(((textLength.split('\n').length + 1) * 16) + 'px');  
		if (textLength.length > 0) {
			o.find('button[type=submit]').addClass('submit');
		} else {
			o.find('button[type=submit]').removeClass('submit');
		}
   });
}
// 답글 textarea 줄바꿈처리
function convertbr2(){
   var str = document.getElementById("re_com_textarea").value;
   var str = str.replace(/\r\n|\n/g,'<br>');
   document.getElementById('re_com_content').value = str;
}

// 댓글 삭제 Modal
function delComment(cmt_srl){
	var d = jQuery('#modal-comment-del').eq(0);
  	d.find('input[name=comment_srl]').val(cmt_srl);
  	d.before('<div id="modal-form-back"></div>');
  	jQuery('#modal-form-back').fadeIn(300);
  	d.fadeIn(300);
}

// 게시물 삭제 Modal
function delDocument(doc_srl){
	var d = jQuery('#modal-document-del').eq(0);
  	d.find('input[name=document_srl]').val(doc_srl);
  	d.before('<div id="modal-form-back"></div>');
  	jQuery('#modal-form-back').fadeIn(300);
  	d.fadeIn(300);
}

(function($) {
	$(document).ready(function(){			
		// 대댓글 취소 버튼(단독처리)
		var o = $('#recomment-form').eq(0);
		var msg = '입력된 내용을 취소 하시겠습니까?';
		o.find('.recomment-close').click(function(){
			if(o.find('textarea').val()) {
				var msg_confirm = confirm(msg);
				if(msg_confirm == true){
		            o.hide();
		            o.find('textarea').val('');
		            o.find('input[type=checkbox]').prop('checked', false);
		            jQuery('#comment-form').show();
		        } else {
			        o.find('textarea').focus();
		            return false;
		        }
		    } else {
			    o.hide();
			    o.find('input[type=checkbox]').prop('checked', false);
			    jQuery('#comment-form').show();
		    }
		});
		
		// 삭제 Modal Close
		$('#modal-form-back, .modal-form-close').on('click',function(){
		  	$('#modal-form-back').fadeOut(300);
		  	$('.modal-form').fadeOut(300);
		});
		
	});
})(jQuery);


(function($) {
	"use strict";
	
	// SNS post
	$.fn.snspost = function(opts) {
		var loc = '';
		opts = $.extend({}, {type:'twitter', event:'click', content:''}, opts);
		opts.content = encodeURIComponent(opts.content);
		switch(opts.type) {
			case 'facebook':
				loc = '//www.facebook.com/share.php?t='+opts.content+'&u='+encodeURIComponent(opts.url||location.href);
				break;
			case 'delicious':
				loc = '//www.delicious.com/save?v=5&noui&jump=close&url='+encodeURIComponent(opts.url||location.href)+'&title='+opts.content;
				break;
			case 'twitter':
				loc = '//twitter.com/share?url='+opts.content;
				break;
			case 'google' :
				loc = '//plus.google.com/share?url='+encodeURIComponent(opts.url||location.href)+'?l=ko='+opts.content;
				break;
		}
		this.bind(opts.event, function() {
			window.open(loc);
			return false;
		});
	};
	$.snspost = function(selectors, action) {
		$.each(selectors, function(key,val) {
			$(val).snspost( $.extend({}, action, {type:key}) );
		});
	};
		
	$(document).ready(function(){			
		// category open
		var dropdown = $('.category-dropdown');
		dropdown.find('a[data-toggle=category-dropdown]').on('click', function(){
			$(this).toggleClass('open').next('ul').toggle().toggleClass('open');			
		});		
		var cate_text = $('.category-dropdown input[type=hidden]').val();		
		$('#category-text').text(cate_text);
		$(document).click(function(){
			dropdown.find('a[data-toggle=category-dropdown]').removeClass('open');
		  	dropdown.find('a[data-toggle=category-dropdown]').next('ul.open').hide().removeClass('open');
		});
		dropdown.click(function(e){
		  	e.stopPropagation();
		});
		
		// 본문 이미지 중앙정렬
		if(doc_img=='Y') {
			$('.xe_content img').parent().css('text-align', 'center');
		}
		
	});
	
	// 갤러리 masonry
	if(default_style=='gallery'){
		$(window).load(function(){				
		    var $container = $('#xet-galleryMasonry');	    
		    if( !$container.length || !jQuery().isotope ) return;	    
		    $container.isotope({
			    itemSelector : '.item',
		    	layoutMode: 'masonry',
		        animationOptions: {
		            duration: 1000,
		            easing: 'linear',
		            queue: false
		        },
		        masonry: {
					isFitWidth: false,
					percentPosition: true,
					horizontalOrder: true
				}
		    });	 	    
		});
	}
})(jQuery);



