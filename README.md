Multi-Client Chat Application
A real-time, multi-client chat application built using Flutter for the frontend web/mobile interface and Node.js with Socket.io for the backend real-time communication server.

The application utilizes Socket.io's broadcasting feature to ensure seamless, instant messaging across multiple concurrent clients.

🚀 Features
Real-time Messaging: Messages are instant and synced across all instances using WebSockets.

Smart Broadcasting: Sent messages are correctly broadcasted to all active clients except the sender.

Dynamic UI Alignment: Messages sent by the current user align to the right, while messages from other clients align to the left.

Multi-Client Support: Built to handle multiple active user connections simultaneously.

🛠️ Tech Stack
Frontend: Flutter (Web/Mobile)

Backend: Node.js, Express

Real-time Engine: Socket.io
