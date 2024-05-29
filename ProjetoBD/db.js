//importa dependência mysql, atribui a mysql
var mysql = require('mysql');
// elementos para conexao com mysql
var conexao = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'MAQUIAGEM',
  multipleStatements: true
});
//executar conexao com BD
conexao.connect();
//exporta modulo globalmente para rotas app.get() e app.post()
module.exports = conexao;
