var http = require('http').createServer().listen(4000);
var io = require('socket.io')(http);
var XMLHttpRequest = require('xmlhttprequest').XMLHttpRequest;
var xhttp = new XMLHttpRequest();
var $ = require("jquery");
var host = 'localhost';
var port = '8000';
var url_base = "http://" + "127.0.0.1" + ":" + "8000";

io.on('connection', function(socket) {
    socket.on('message', function(messenger) {
        io.emit('getMessage', messenger);

        var url = 'http://' + host +':' + port + '/message/';
        xhttp.onreadystatechange = function() {
            if(this.readyState === 4 && this.status === 200) {
                if(xhttp.responseText === "error")
                    console.log("error saving message");
                else if(xhttp.responseText === "success")
                    console.log("the message was posted successfully");
            }
        };
        xhttp.open('POST', url, true);
        xhttp.send(JSON.stringify(messenger));
    });

});
