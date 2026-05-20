import http from 'http';
import { Server } from 'socket.io';
import app from './app.js';

const server = http.createServer(app);

const io = new Server(server, {
    cors: {
        origin: "*", 
        methods: ["GET", "POST"],
        credentials: false
    },
});


io.on('connection', (socket) => {
    console.log("New client connected:", socket.id);

    socket.emit('welcome','Welcome to chat app!!');

    socket.on('message', (data) => {
        socket.broadcast.emit('message', data);
    })

});

const port = 3000;
server.listen(port, () => {
    console.log(`Server is listening on port ${port}`);
});