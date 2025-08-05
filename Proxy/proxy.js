const express = require('express');
const { createProxyMiddleware } = require('http-proxy-middleware');

const app = express();

app.use('/', createProxyMiddleware({ target: 'http://localhost:3000', changeOrigin: true }));  //Frontend port - Set it on your Olympus FrontEnd port
app.use('/api', createProxyMiddleware({ target: 'http://localhost:4512', changeOrigin: true }));//BackEnd port  - Set it on your Olympus BackEnd port
app.use('/audio', createProxyMiddleware({
    target: 'http://localhost:4000',        // Ws port (Target) - Set it on your Olympus Audio Backend port (check Readme for more info)
    changeOrigin: true,
    ws: true,
    pathRewrite: { '^/audio': '' }
}));

const server = app.listen(8080, () => {
    console.log('Proxy lancé sur http://localhost:8080'); //Proxy port  Dont change it
});

server.on('upgrade', (req, socket, head) => {
    // Pour gérer les WebSockets
    if (req.url.startsWith('/audio')) {
        const proxy = createProxyMiddleware({
            target: 'http://localhost:4000',// Ws port (Target) - Set it on your Olympus Audio Backend port (check Readme for more info)
            ws: true
        });
        proxy.upgrade(req, socket, head);
    }
});


