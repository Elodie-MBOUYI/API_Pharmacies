const express = require('express');
const cors = require('cors')
const app = express()
var mysql = require("mysql")

app.all('/', (req, res) => {
    console.log("Just got a request!")
    res.send('Bienvenue sur l\'API de AFRIJET des Pharmacies de POG')
})


app.use(express.json())
app.use(cors())

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pharmacies'
})

con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('connexion établie');
    }
})

