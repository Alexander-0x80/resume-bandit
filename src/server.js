#!/usr/bin/env node

var fs = require("fs");
var consolidate = require('consolidate');
var body_parser = require('body-parser');
var yaml = require("js-yaml");
var express = require('express');
var app = express();

var text_parser = body_parser.text({type: "text/x-yaml"});
app.engine('html', consolidate.underscore);
app.set('view engine', 'html');
app.set('views', __dirname + '/../templates');


var tpl_data = yaml.safeLoad(
    fs.readFileSync(__dirname + "/../data/sample.yaml", "utf8"));


app.post('/file', text_parser, function(req, res){
  console.log(req.body);      // your JSON
  //res.send(req.body);    // echo the result back
  res.render("clean", yaml.safeLoad(req.body));
});

app.get('/', function(req, res){
  res.render('clean', tpl_data);
});

var server = app.listen(3000, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
