var net = require('net');
var PythonShell = require('python-shell');
var io = require('socket.io').listen(net);

//var HOST = '127.0.0.1';
var HOST = '192.168.65.19';
var PORT = 8080;
var test1=0;
var test2=0;


// Create a server instance, and chain the listen function to it
// The function passed to net.createServer() becomes the event handler for the 'connection' event
// The sock object the callback function receives UNIQUE for each connection
net.createServer(function(sock) {

    // We have a connection - a socket object is assigned to the connection automatically
    console.log('CONNECTED: ' + sock.remoteAddress +':'+ sock.remotePort);
	test1= sock.remoteAddress;
	test2= sock.remotePort;

    // Add a 'data' event handler to this instance of socket
    sock.on('data', function(data) {
        //In this section the query has to be made to send the response to the RaspberryPi
        data= 'Hi'

        //In data2, append FName-LName Queries
        data2= 'RaspberryPi'

        //console.log('DATA ' + sock.remoteAddress + ': ' + data);
        // Write the data back to the socket, the client will receive it as data from the server
        //sock.write('You said "' + data + data2 + '"');
        sock.write(data + "\n"+ data2);

    });

    // Add a 'close' event handler to this instance of socket
    sock.on('close', function(data) {
        //console.log('CLOSED: ' + sock.remoteAddress +' '+ sock.remotePort);
	console.log('CLOSED: ' + test1 +' '+ test2);
    });

}).listen(PORT, HOST);

console.log('Server listening on ' + HOST +':'+ PORT);
