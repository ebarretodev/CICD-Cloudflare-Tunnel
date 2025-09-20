const express = require('express');

const app = express();

const port = 3000

app.get('/', (req, res) => {
    res.send('Eu te amo THAINARA, minha linda.')
})

app.listen(port, () => {
    console.log(`Example app listening at http://localhost:${port}`)
})