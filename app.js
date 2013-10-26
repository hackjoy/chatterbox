// ** MODULE DEPENDENCIES **  https://npmjs.org/doc/install.html

require('coffee-script');

var express = require('express');
var http = require('http');
var path = require('path');

var app = express();

// ** CONFIG **

// All ENV's
app.set('port', process.env.PORT || 3000);
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'jade');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));

// Dev ENV
if ('development' == app.get('env')) {
  app.use(express.errorHandler());
}

// ** HTTP ROUTING **

// File paths variables
var routes = require('./routes');
var static_pages = require('./routes/static_pages');

// App routes defined and passed to route controllers
app.get('/', routes.index);
app.post('/', routes.login);

app.get('/about', static_pages.about);

// Start the server
http.createServer(app).listen(app.get('port'), function(){
  console.log('Express server listening on port ' + app.get('port'));
});