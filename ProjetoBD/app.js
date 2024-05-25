var express = require("express");
var app = express();
var db = require('./db.js');

app.set("engine ejs", "ejs");
app.use(express.urlencoded({extended: false}));


app.get('/', function(req, res) {
    db.query("SELECT * FROM Produtos", function(err, dado) {
    res.render('index.ejs', {
    dados: dado
    });
    });
});

app.listen(3000, () => {
    console.log('SERVIDOR ATIVO, ACESSE http://localhost:3000');
});
