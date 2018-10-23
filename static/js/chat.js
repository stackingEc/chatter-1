$("#profile-img").click(function () {
    $("#status-options").toggleClass("active");
});


$(".expand-button").click(function () {
    $("#profile").toggleClass("expanded");
    $("#contacts").toggleClass("expanded");
});


$("#status-options ul li").click(function () {
    $("#profile-img").removeClass();
    $("#status-online").removeClass("active");
    $("#status-away").removeClass("active");
    $("#status-busy").removeClass("active");
    $("#status-offline").removeClass("active");
    $(this).addClass("active");

    if ($("#status-online").hasClass("active")) {
        $("#profile-img").addClass("online");
    } else if ($("#status-away").hasClass("active")) {
        $("#profile-img").addClass("away");
    } else if ($("#status-busy").hasClass("active")) {
        $("#profile-img").addClass("busy");
    } else if ($("#status-offline").hasClass("active")) {
        $("#profile-img").addClass("offline");
    } else {
        $("#profile-img").removeClass();
    }
    ;

    $("#status-options").removeClass("active");
});


var url = 'localhost';
var port = '4000';
var socket = io(url + ':' + port);

$(function () {
    updateScroll();

});


$('form').submit(function () {
    var msg = $('#message');
    var name = $('#name');
    var type = $('#type');
    if (msg.val().trim() !== "" && name.val().trim() !== "" && type.val().trim() !== "") {
        messenger = {
            'name': name.val().trim(),
            'users': imagenes,
            'type': type.val().trim(),
            'message': msg.val().trim()
        };
        socket.emit('message', messenger);
    }
    msg.val('');
    return false;
});

socket.on('getMessage', function (messenger) {
    var date = new Date();
    var name = messenger.name;
    var img = messenger.users;
    var msg = messenger.message;
    var result = check == name ? 'class="replies"' : 'class="sent"';

    var icon = $('<li ' + result + '><img src="/static/images/' + img + '" alt="' + name + '"/><p>' + msg + '<br><small>' + date + '</small></br></p></li>');
    $('#messenger').append(icon);
    updateScroll();
    var audio_result = check != name ? document.getElementById('audio1').play() : '';

});

function updateScroll() {
    var element = document.getElementById("messages-list");
    element.scrollTop = element.scrollHeight;
}




