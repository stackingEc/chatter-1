var baseUrl = "http://" + "127.0.0.1" + ":" + "8000";
$(document).ready(function () {
    $('.content').hide();

    $("#message").keypress(function () {
        var command = $(this).val();
        var to_string = command.toString();
        if (to_string.length >= 8) {
            var abc = to_string.replace('/stock=', '') ;
            $.get(baseUrl + "/rabbit/", {
                csrfmiddlewaretoken: abc
            }).done(function (data) {
                if (data) {
                    $('#messenger').remove();
                    $('.content').html(data);
                    console.log(data);

                } else {
                    $('.content').hide();
                    console.log('nothing');
                }

            });
        } else {

        }


    });
});

function find_name(type) {
    $.get(baseUrl + "/chat_history/", {
        csrfmiddlewaretoken: type
    }).done(function (data) {

        if (data) {
            $('.content').show();
            console.log(data);

        } else {
            $('.content').hide();
            console.log('nothing');
        }

    });


}

