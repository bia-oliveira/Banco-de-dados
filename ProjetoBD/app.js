var express = require("express");
var app = express();
var db = require('./db.js');

app.set("engine ejs", "ejs");
app.use(express.urlencoded({extended: false}));


app.get('/', function(req, res) {
    db.query("SELECT Produtos.Nome AS NomeProduto, Produtos.Preco, Produtos.Categoria, Marcas.Nome AS NomeMarca, Marcas.Pais_Origem FROM Produtos INNER JOIN Marcas ON Produtos.Marca_ID = Marcas.ID ORDER BY Produtos.Nome;", function(err, dado) {
    res.render('index.ejs', {
    dados: dado
    });
    });
});

app.listen(3000, () => {
    console.log('SERVIDOR ATIVO, ACESSE http://localhost:3000');
});
