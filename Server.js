var express = require("express");
var app = express();
var router = express.Router(); //routing service
const hbs= require('hbs');
const bodyParser = require('body-parser');

app.set('view engine','hbs');
app.use(bodyParser.urlencoded({ extended: true }));

hbs.registerPartials(__dirname + '/views/partials')

var path = __dirname + '/views/';

router.use(function (req,res,next) {
  console.log("/" + req.method);
  next();
});

router.get("/index",function(req,res){
 // res.sendFile(path + "index.hbs");
 res.render(path + "index.hbs");
});

router.get("/about",function(req,res){
  res.render(path + "about.hbs");
});

router.get("/register",function(req,res){
  res.render(path + "register.hbs");


  
});

router.get("/login",function(req,res){
  res.render(path + "login.hbs");
});

app.use("/",router);

/*
app.use("*",function(req,res){
  res.sendFile(path + "404.html");
});
*/
app.listen(3000,function(){
  console.log("Live at Port 3000");
});
