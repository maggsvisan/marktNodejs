var mysql = require('mysql');

var mysqlConnection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'mysqlroot18',
  database : 'MarktLabsOffice',
 
});

mysqlConnection.connect(function(err) {
  if ( !err ) {
    console.log("Connected to MySQL");
  } else if ( err ) {
    console.log(err);
  }
});
