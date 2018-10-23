var baseUrl = "http://" + "127.0.0.1" + ":" + "8000";

$(document).ready(function () {
    $('.content').hide();
    $("#id_password1").attr("placeholder", "Password *");
    $("#id_password2").attr("placeholder", "Confirm Password  *");
    $("#date_of_Birth").datepicker({
        dateFormat: 'yy-mm-dd 13:00:00'
    });

    $("#message").keypress(function () {
        var command = $(this).val();
        var to_string = command.toString();
        if (to_string.length >= 8) {
            var abc = to_string.replace('/stock=', '');
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


function find_image(type) {
    $.post(baseUrl + "/get_image/", {
        token: type
    }).done(function (data) {
        console.log(data);
        return data;
    });


}
