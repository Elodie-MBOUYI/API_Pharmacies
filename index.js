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

app.post('/api/demandes/ajout', (req, res)=>{
  const  nom_client = req.body.nom_client;
  const telephone = req.body.telephone;
  const ordonnance = req.body.ordonnance;
  const message = req.body.message; 
  const id_statut= req.body.id_statut; 

con.query('INSERT INTO demandes VALUES(NULL,?,?,?,?,?)',[nom_client,telephone,ordonnance,message,id_statut],(err,result)=>{
  if(err)
{
  console.log(err)
}else{
  res.send('ajout d une nouvelle demande');
}
})
})







