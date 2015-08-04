#!/usr/bin/env node

var fs = require("fs");
var consolidate = require("consolidate");
var body_parser = require("body-parser");
var yaml = require("js-yaml");
var express = require("express");
var pdf = require('html-pdf');


var app = express();
var text_parser = body_parser.text({type: "text/x-yaml"});

app.engine("html", consolidate.underscore);
app.set("view engine", "html");
app.set("views", __dirname + "/../templates");

var options = {
 
    "format": "A4",        
    "orientation": "portrait",
    "phantomPath": "c:/dev/phantomjs2/bin/phantomjs"
}

var tpl_data = yaml.safeLoad(fs.readFileSync(__dirname + "/../data/sample.yaml", "utf8"));


app.post("/resume/:template?", text_parser, function(req, res) {
    /*var template = req.params.template || "clean";
    if (!req.body) return res.sendStatus(400);
    res.render(template, yaml.safeLoad(req.body), function(err, html) {
        if (err) res.sendStatus(404);
        res.send(html);
    });*/

    var template = req.params.template || "clean";
    if (!req.body) return res.sendStatus(400);
    res.render(template, yaml.safeLoad(req.body), function(err, html) {
        if (err) res.sendStatus(404);
        pdf.create(html, options).toStream(function(err, stream){
            //console.log(res.filename);
            res.contentType("application/pdf")
            stream.pipe(res);
        });
    });
});

app.get("/", function(req, res) {
    res.render("clean", tpl_data);
});

var server = app.listen(3000, function() {
    var host = server.address().address;
    var port = server.address().port;

    console.log("listening at http://%s:%s", host, port);
});
