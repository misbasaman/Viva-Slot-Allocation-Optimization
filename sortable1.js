$(document).ready(function() {// begin document ready


    $('#available').sortable({  // begin sortable
        connectWith: '#selected-preferences',
        receive: function(event,ui) {  // begin receive
            var id = $(ui.item).attr('id');

        } // end receive
    });  // end sortable


    $('#selected-preferences').sortable({  // begin sortable
        connectWith: '#available',
        receive: function(event,ui) {  // begin receive
            var $this = $(this);
            if ($("#selected-preferences li").length > 3) {
                alertify.alert('<span style="color:red"><strong><em>Only three preferences can be given!</em></strong></span>');

                //$( "#available li" ).draggable( "option", "connectToSortable", false );
                $(ui.sender).sortable('cancel');

            }
        } // end receive
    });  // end sortable

    $('li').on('mousedown', function() {
        $(this).css(
            {
                'background-color' : 'black',
                'color' : 'white'
            }
        )
    }).on('mouseup', function() {
        $(this).css(
            {
                'background-color': 'blue',
                'color' : 'grey'
            }
        )
    });


}); // end document ready

