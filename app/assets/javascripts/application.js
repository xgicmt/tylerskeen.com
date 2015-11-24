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
//= require bootstrap-sprockets
//= require markdown-toolbar
//= require_tree .


  jQuery(function(){
  	$('#disclaimBtn').click(function(){
	  $('#disclaimer').slideToggle(500);
	});

  	$('.flash:visible').delay(5000).slideUp();
	  $('.userName').click(function(){
	    $('.underName').slideToggle(500);
	    $('.userName').css("border-radius", "5px 5px 0 0");
	  });
  });

  $(document).ready(function(){
    $('.carousel').carousel();
  });

  MarkdownToolbar.buttons = [
    {title: 'Bold',          type: 'wrapper',  left: '**', right: '**', id: 'bold'},
    {title: 'Italic',        type: 'wrapper',  left: '*',  right: '*',  id: 'italic'},
    {id: 'delimiter'},
    {title: 'H1',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_1'},
    {title: 'H2',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_2'},
    {title: 'H3',            type: 'wrapper',  left: '# ', right: ' #', id: 'heading_3'},
    {id: 'delimiter'},
    {title: 'Bulleted list', type: 'prefixer', left: '- ',              id: 'list_bullets'},
    {title: 'Numbered list', type: 'list_numbers', id: 'list_numbers'},  
    {title: 'Blockquote',    type: 'prefixer', left: '> ',              id: 'blockquote'},
    // Code:
    {title: 'Source Code',   type: 'block_wrapper',   left: "```\n", right: "\n```", id: 'code'},  
    {id: 'delimiter'},
    {title: 'Link',          type: 'link',         id: 'link'},
  ];
  $('#propimageUpload').change(function(){
    if(this.files.length>10)
        alert('to many files')
  });
// Prevent submission if limit is exceeded.
  $('.edit_property').submit(function(){
    if(this.files.length>10)
      return false;
  });

   $(document).ready(function(){
    $('#policyCheck').click(function(){
      $('#scriptDiv').toggle();
    });
   });


