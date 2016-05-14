

$(document).on('ready page:load', function(e) {

    $(document).on('click', '#game-ships .ship', function (e) {
        var ship = $(e.currentTarget);
        $('#game-ships .ship').removeClass('selected');
        ship.addClass("selected");
    });

    $(document).on('click', '.current-player-board .point', function (e) {
        var ship = $("#game-ships .ship.selected");
        var current_position = $(e.currentTarget);
        if(ship.length > 0){
            var ship_size = parseInt(ship.data('size'));
            
            var coor_x = current_position.data('row');
            var coor_y = current_position.data('col');

            var board = $('.current-player-board');

            var ship_to_save = {};

            var coords = "";
            for(var i = 0; i <= ship_size; i++){
                board.find("div[data-row='"+coor_x+"'] .point[data-col='"+(coor_y+(i))+"']").addClass('ship-ready');
                coords += "," + (coor_y+(i));
            }

            ship_to_save[coor_x] = coords.substring(1);

            var board_id = current_position.data('board');

            var set_ship_url = "/boards/"+board_id+"/set_ship";

            var ship_position = {
                position: ship_to_save
            }

            $.ajax({
                url: set_ship_url,
                method: "POST",
                data: ship_position,
                dataType: "json",
                success: function (e) {
                    ship.remove();
                }
            });

        }else{
            alert("Please select a ship to place.")
        }
    });

});