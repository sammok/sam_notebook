var WINDOW_CHATROOM = (function (){
    var rooms = {};

    function join (roomName, fn) {
        if (!rooms[roomName]) rooms[roomName] = [];

        rooms[roomName].push(fn);

        return fn;
    }

    function leave(roomName, fn) {
        var room = rooms[roomName];

        if (room) {
            for (var i = 0; i < room.length; i++) {
                console.log(room[i] == fn);
                if (room[i] == fn) room.splice(i, 1);
            }
        }
    }

    function emmit (roomName, data, notSelf) {
        window.postMessage({ roomName: roomName, data: data }, '*');
        !notSelf && window.top.postMessage({ roomName: roomName, data: data }, '*');
    }

    function listRoom () {
        var keys = [];
        for (var i in rooms) {
            console.log(i+': '+rooms[i].length);
            keys.push(i);
        }
        return keys;
    }

    window.addEventListener('message', function (data) {
        try {
            var msg = data.data;
            var room = rooms[msg.roomName];

            if (room) {
                for (var i = 0; i < room.length; i++) {
                    room[i](msg.data);
                }
            }
        }
        catch (e) {
        }
    });

    return ({
        join: join,
        leave: leave,
        emmit: emmit,
        listRoom: listRoom
    });
})();


//  Example:
//  Subject
//  sending page height to parent window
var body = document.body;
var html = document.documentElement;
var height = Math.max( body.scrollHeight, body.offsetHeight, html.clientHeight, html.scrollHeight, html.offsetHeight );
WINDOW_CHATROOM.emmit('profilePageHeight', height);


// Subscriber
var profilePageHeightHandler = WINDOW_CHATROOM.join('profilePageHeight', function (data) {
    document.querySelector('iframe').height = data;
});

//  Unsubscriber
WINDOW_CHATROOM.leave('profilePageHeight', profilePageHeightHandler);

//  list all room
WINDOW_CHATROOM.listRoom(); //  console each room, return a list of rooms
