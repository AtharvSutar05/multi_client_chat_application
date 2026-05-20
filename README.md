<h1>Multi-Client Chat Application</h1>
    <p>A real-time, multi-client chat application built using <strong>Flutter</strong> for the frontend web/mobile interface and <strong>Node.js with Socket.io</strong> for the backend real-time communication server.</p>
    <p>The application utilizes Socket.io's broadcasting feature to ensure seamless, instant messaging across multiple concurrent clients.</p>

<h2><span class="icon">🚀</span>Features</h2>
<ul>
    <li><strong>Real-time Messaging:</strong> Messages are instant and synced across all instances using WebSockets.</li>
    <li><strong>Smart Broadcasting:</strong> Sent messages are correctly broadcasted to all active clients <em>except</em> the sender.</li>
    <li><strong>Dynamic UI Alignment:</strong> Messages sent by the current user align to the right, while messages from other clients align to the left.</li>
    <li><strong>Multi-Client Support:</strong> Built to handle multiple active user connections simultaneously.</li>
</ul>
<h2><span class="icon">🛠️</span>Tech Stack</h2>
    <table>
        <thead>
            <tr>
                <th align="left">Layer</th>
                <th align="left">Technology Used</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><strong>Frontend</strong></td>
                <td>Flutter (Web / Mobile)</td>
            </tr>
            <tr>
                <td><strong>Backend</strong></td>
                <td>Node.js, Express</td>
            </tr>
            <tr>
                <td><strong>Real-time Engine</strong></td>
                <td>Socket.io</td>
            </tr>
        </tbody>
    </table>
