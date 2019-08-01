$(document).ready(function(){
	$( ".J_MenuItem" ).each( function( index ){
		$( this ).mouseover( function(){
			
			var catTop,
				borderTop = $( this ).offset().top - 3,
				viewHeight = $( window ).height(),
				scrollTop = $( document ).scrollTop(),
				relaxHeight = viewHeight - ( borderTop - scrollTop );
			
			$( ".border" ).css( "top", borderTop ).show();
			$( ".cat-subcategory" ).show();
			$( ".shadow div" ).hide().eq( index ).show();
			
			var catHeight = $( ".cat-subcategory" ).height();
			if( catHeight <= relaxHeight ){
				catTop = borderTop;
			}else if( catHeight > relaxHeight && catHeight < viewHeight ){
				catTop = scrollTop + viewHeight - catHeight - 10;
			}else{
				catTop = scrollTop + 5;
			}
			$( ".cat-subcategory" ).css( "top", catTop );
			
			$( "span" ).show();
			$( this ).find( "span" ).hide();
		});

		$( ".mallCategory" ).mouseleave( function(){
			$( ".cat-subcategory" ).hide();
			$( ".border" ).hide();
			$( "span" ).show();
		});

	});
});




/*(function(){
		
		var $subblock = $(".subpage"), $head=$subblock.find('h2'), $ul = $("#proinfo"), $lis = $ul.find("li"), inter=false;
		
		$head.click(function(e){
			e.stopPropagation();
			if(!inter){
				$ul.show();
			}else{
				$ul.hide();
			}
			inter=!inter;
		});
		
		$ul.click(function(event){
			event.stopPropagation();
		});
		
		$(document).click(function(){
			$ul.hide();
			inter=!inter;
		});

		$lis.hover(function(){
			if(!$(this).hasClass('nochild')){
				$(this).addClass("prosahover");
				$(this).find(".prosmore").removeClass('hide');
			}
		},function(){
			if(!$(this).hasClass('nochild')){
				if($(this).hasClass("prosahover")){
					$(this).removeClass("prosahover");
				}
				$(this).find(".prosmore").addClass('hide');
			}
		});
	})();*/

