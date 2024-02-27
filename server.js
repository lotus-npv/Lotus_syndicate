import express from 'express';
import internRouters from './src/routers/intern.router';

require('dotenv').config();
var morgan = require('morgan');

const app = express();
const port = process.env.PORT || 3000;

app.use(morgan('combined'));

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

internRouters(app);


app.listen(port, () => {
    console.log(`Connect success to http://localhost:${port}`)
})