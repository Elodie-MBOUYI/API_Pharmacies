const express = require('express');
const cors = require('cors')
const app = express()
var mysql = require("mysql")

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

con.connect((err)=>{
    if(err)
    {
        console.log(err)
    }else{
        console.log('connexion établie');
    }
})

// Lister les produits enregistrés dans la base de données de la pharmacie choisie;
app.get('/api/produits', (req, res)=>{
    
    con.query('SELECT * FROM produits',(err,result)=>{
        if(err) res.status(500).send(err)
        
        res.status(200).json(result)
    })
})

//Ajouter les produits pharmaceutiques dans la base de données;
app.post('/api/produits/ajout', (req, res)=>{
    const proprietes = req.body.proprietes;
    const produits = req.body.produits;
    const description = req.body.description;
    const prix = req.body.prix;

    
    con.query('INSERT INTO produits VALUES(NULL,?,?,?,?,?)',[proprietes,produits,description,prix],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})

//Ajouter les noms de pharmacies de garde dans la base de données
app.post('/api/pharmgard/ajout', (req, res)=>{
    const nom_pharmgard = req.body.nom_pharmgard;
    const telephone = req.body.telephone;
    
    
    con.query('INSERT INTO marque VALUES(NULL,?,?)',[nom_pharmgard,telephone],(err,result)=>{
        if(err)
    {
        console.log(err)
    }else{
        res.send('POSTED');
    }
    })
})



