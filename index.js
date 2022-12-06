// importation du framework,de l'App et des dépendances

const express = require('express');
const cors = require('cors')
const app = express()
var mysql = require("mysql")

// configuration du port,de l'APP et connexion de la base de données à mysql

app.all('/', (req, res) => {
    console.log("Just got a request!")
    res.send('Bienvenue sur l\'API des Pharmacies de POG')
})

app.listen(process.env.PORT ||3500)

app.use(express.json())
app.use(cors())

const con = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'pharmacy'
})


// La route get
app.get('/', (req, res)=>{
  res.send('Hello');
})


app.get('/api/pharmacies', (req, res)=>{
    
    con.query('SELECT * FROM pharmacies',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})

// Les  requetes post

// Ajout d'une nouvelle demande dans la bd

con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
    var sql = "INSERT INTO demandes (nom_client,telephone,ordonnance,message,id_statut ) VALUES ?";
    var values = [
      ['Richard', '0124578', 'Panadol 1000mg', 'Panadol 1000g', '1'],
      ['Susan', '062457827', 'Fervex effervescents 500mg', 'besoin de vous rencontrer', '2'],
      ['Eloise', '077546328', 'Bactol 500ml', 'besoin de deux Blédine', '2'],
      ['Max', '065124787', 'Fervex effervescents 500mg', 'besoin de vous rencontrer', '2'],
    ];
    con.query(sql, [values], function (err, result) {
      if (err) throw err;
      console.log("Number of records inserted: " + result.affectedRows);
    });
  });

