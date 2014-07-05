/* File: site.js */

$(document).ready(function() {

  // Tabs
  $('.nav-tabs a, .btn-group-tabs a').click(function (e) {
  	e.preventDefault()
  	$(this).tab('show')
  });

  // Enable tooltips, default view
  $('a, button').tooltip({
  	placement: 'top',
  	delay: { show: 100, hide: 50 }
  });

  // Custom popover for nav alerts
  $(document).ready(function(){
  	// Show alerts popup
  	$('.nav-alerts a').popover({ 
  		html : true,
  		placement: 'bottom',
  		content: function() {
  			return $('.alerts-popover').html();
  		}
  	});
  });

  // Universal Popupover Outside Click Close Method :)
  $('html').mouseup(function(e){ 
    var popocontainer = jQuery(".popover");
    if (popocontainer.has(e.target).length === 0){
        $('.popover').toggleClass('in').remove();
    }
  });  


$('.vertical-layout-form input, input.styled, .styled-inputs-wrapper input').iCheck({
    checkboxClass: 'icheckbox-minimal-blue',
    radioClass: 'iradio-minimal-blue',
    increaseArea: '20%' // optional
  }).on('ifChanged', function(event){
    $(this).change();
  });

  // Toggle show/hide fields based on selected Radio/Checkboxes
  $trigger_elements = $('input[data-show-element-id]');
  $trigger_elements.each(function()  {
    var associated_elem_id = $(this).data('showElementId');
    $('#'+associated_elem_id).hide();
  });
  $trigger_elements.change(function() {
    var $this = $(this);
    var associated_elem_id = $this.data('showElementId');
    var $associated_elem = $('#'+associated_elem_id);    
    if($this.attr('type') == 'radio')  {
      var radio_name = $this.attr('name');
      $('input[name="'+ radio_name +'"]').each(function() {
        var $this = $(this);
        var associated_elem_id = $this.data('showElementId');
        var $associated_elem = $('#'+associated_elem_id);
        if($this.is(':checked'))  {
          $associated_elem.show();
        } 
        else  {
          $associated_elem.hide();
        }  
      });
    }
    else  {
      if($this.is(':checked'))  {
        $associated_elem.show();
      } 
      else  {
        $associated_elem.hide();
      }      
    }
    
  });

function dump(obj) {
    var out = '';
    for (var i in obj) {
        out += i + ": " + obj[i] + "\n";
    }

    var pre = document.createElement('pre');
    pre.innerHTML = out;
    document.body.appendChild(pre)
}

/* ---------------------------------------------
Form Validation
--------------------------------------------- */
  jQuery.validator.addMethod("greaterThanZero", function(value, element) {
      return this.optional(element) || (parseFloat(value) > 0);
  }, "Amount must be greater than zero");

  jQuery.validator.addMethod("at_least_one_uppercase", function(value, element) {
      return this.optional(element) || /^(?=.*[A-Z]).+$/.test(value);
  }, "Password must contain at least one uppercase letter");

  jQuery.validator.addMethod("at_least_one_lowercase", function(value, element) {
      return this.optional(element) || /^(?=.*[a-z]).+$/.test(value);
  }, "Password must contain at least one lowercase letter");

  jQuery.validator.addMethod("at_least_one_special", function(value, element) {
      return this.optional(element) || /^(?=.*[_\W]).+$/.test(value);
  }, "Password must contain at least one special letter");

  jQuery.validator.setDefaults({
    errorElement: "span",
    errorPlacement: function (error, element) {
        error.insertAfter(element);
        error.wrap('<div class="form-error"></div>').parent().prepend('<span aria-hidden="true" class="icon icon-warning-sign"></span>');
    },
    highlight: function(element) {
        $(element).parent().addClass("has-error");
    },
    unhighlight: function(element) {
        $(element).parent().removeClass("has-error");
    },
    invalidHandler: function(event, validator) {
      // 'this' refers to the form      
      var errors = validator.numberOfInvalids();
      if (errors) {
        var message = errors == 1
          ? 'You missed 1 field. It has been highlighted'
          : 'You missed ' + errors + ' fields. They have been highlighted';
        $("div.all_errors span").html(message);
        $("div.all_errors").show();
      } 
      else {
        $("div.all_errors").hide();
      }
    }    
  });

  $("form.validate").each(function() {
    $(this).validate();
  });

  $("form.validate_onkeyup").each(function() {
    $(this).validate({
      onfocusout: function(element) { $(element).valid(); },
      onkeyup: function(element) { $(element).valid(); }
    });    
  });

  var $password_input = $( "input[type='passwoord']" );
  if($password_input.length > 0)  {
      
    $password_input.rules( "add", {
      required: true,
      minlength: 7,
      maxlength: 15,
      // greaterThanZero: true,
      at_least_one_uppercase: true,
      at_least_one_lowercase: true,
      at_least_one_special: true,
      messages: {
        required: "Password is required",
        minlength: jQuery.format("Password must be at least 7 characters"),
        maxlength: jQuery.format("Password must be at most 15 characters")
      }
    });
  }  

/* ---------------------------------------------
Table Punches Expanding/collapsing
--------------------------------------------- */  
$('.table-with-expandable-punches tr:not(.punch-expanded)').click(function() {
  var $this = $(this);
  if($this.hasClass('parent-row'))  {
    $this.removeClass('parent-row').next('.punch-expanded').hide();
  }
  else  {
    $this.addClass('parent-row').next('.punch-expanded').show();       
  }    
});

/* ---------------------------------------------
//Date range picker - week
//--------------------------------------------- */
//var myDate = new Date();
//var FromDate = pad((myDate.getMonth() + 1), 2) + '/' + pad((myDate.getDate()-1),2) + '/' + myDate.getFullYear();
//var ToDate = pad((myDate.getMonth() + 1), 2) + '/' + myDate.getDate() + '/' + myDate.getFullYear();

//$('.form-daterangepicker').daterangepicker({
//  opens: 'left',
//  startDate: FromDate,//'12/08/2013',
//  endDate: ToDate//'12/14/2013'
//});

// $('.form-daterangepicker span').html(moment().subtract('days', 29).format('D MMMM YYYY') + ' - ' + moment().format('D MMMM YYYY'));


/* ---------------------------------------------
Datepicker - single
--------------------------------------------- */  
//$('.datepicker').datepicker();


/* ---------------------------------------------
Timepicker
--------------------------------------------- */  
//$('.timepicker').timepicker();
 
/* ---------------------------------------------
Chosen select fields
--------------------------------------------- */  
 $("select.searchable").chosen({
    width: "100%"
  });

/* ---------------------------------------------
Chosen select fields
--------------------------------------------- */  

$('table.with-checkable-rows tbody input[type="checkbox"]').change(function() {
  var $this = $(this),
  $this_tr = $this.closest('tr');
  if($this.is(':checked'))  {
    $this_tr.addClass('selected');
  }
  else  {
   $this_tr.removeClass('selected'); 
  }
});
// $('table.with-checkable-rows thead input[type="checkbox"]').change(function() {
//   var $this = $(this),
//   $this_table = $this.closest('table');
//   alert('hey');
//   if($this.is(':checked'))  {
//     $('tbody input[type="checkbox"]', $this_table).prop('checked', true);
//   }
//   else  {
//    $('tbody input[type="checkbox"]', $this_table).prop('checked', false);
//   }
// });

}); // fin
