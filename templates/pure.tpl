<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Resume</title>
  <link rel="stylesheet" href="http://yui.yahooapis.com/pure/0.6.0/pure-min.css">
  <link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
  <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
  <style>
    .pure-g [class *= "pure-u"] {
      font-family: 'Ubuntu', sans-serif;
    }
    h1, h2 {
      margin: 0;
    }
    .block {
      margin-top: 25px;
    }
    .title {
      margin-bottom: 15px;
      height: 20px;
      line-height: 20px;
    }
    .profile {
      margin-bottom: 5px;
    }
    .skill {
      margin-bottom: 10px;
    }
    .experience {
      position: relative;
    }
    .experience:before {
      content: "";
      border-left: 1px solid <%= theme.colors.sec %>;
      display: block;
      height: 100%;
      position: absolute;
      left: -95px;
      top: 0;
    }
    .col-pri { color: <%= theme.colors.pri %>; }
    .col-sec { color: <%= theme.colors.sec %>; }
  </style>
</head>
<body>
<div class="pure-g">
  <div class="pure-u-1">
    <!-- Name -->
    <div><h1><%= name.first %> <%= name.last %></h1></div>
    <!-- Who is -->
    <div>
      <% whois.forEach(function(item) {  %>
      <span class="col-pri">//</span> <span class="col-sec"><%= item %></span>
      <% }); %>
    </div>
    <!-- About & Skills -->
    <div class="pure-g block">
      <!-- About -->
      <div class="pure-u-1-2">
        <div class="pure-g title">
          <div class="pure-u-1-12"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-21-24"><h2>About</h2></div>
        </div>
        <% for (var detail in about) { %>
        <div class="pure-g profile">
          <div class="pure-u-1-12"></div>
          <div class="pure-u-1-12"><i class="<%= theme.icons.details.shift() %>"></i></div>
          <div class="pure-u-19-24"><div><%= about[detail] %></div></div>
        </div>
        <% } %>
      </div>
      <!-- Skills -->
      <div class="pure-u-1-2">
        <div class="pure-g title">
          <div class="pure-u-1-12"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-21-24"><h2>Skills</h2></div>
        </div>
        <% for (skillType in skills) { %>
        <div class="pure-g skill">
          <div class="pure-u-1-12"></div>
          <div class="pure-u-7-12">
            <% for (var skill in skills[skillType]) { %>
            <div><%= skill %></div>
            <% } %>
          </div>
          <div class="pure-u-7-24">
            <% for (var skill in skills[skillType]) { %>
            <div class="col-pri">
              <% _.times(skills[skillType][skill], function(){ %>
              <i class="<%= theme.icons.level %>"></i>
              <% }); %>
              <% _.times(5 - skills[skillType][skill], function(){ %>
              <i class="<%= theme.icons.levelEmpty %>"></i>
              <% }); %>
            </div>
            <% } %>
          </div>
        </div>
        <% } %>
      </div>
    </div>
    <!-- Objective -->
    <% if (typeof objective !== "undefined") { %>
    <div class="pure-g block">
      <div class="pure-u-1">
        <div class="pure-g title">
          <div class="pure-u-1-24"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-23-24"><h2>Objective</h2></div>
        </div>
        <div class="pure-g">
          <div class="pure-u-1-24"></div>
          <div class="pure-u-23-24"><%= objective %></div>
        </div>
      </div>
    </div>
    <% } %>
    <!-- Experience -->
    <div class="pure-g block">
      <div class="pure-u-1">
        <div class="pure-g title">
          <div class="pure-u-1-24"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-23-24"><h2>Experience</h2></div>
        </div>
        <% for (var timespan in experience) {  %>
        <div class="pure-g">
          <div class="pure-u-1-24"></div>
          <div class="pure-u-5-24"><%= timespan %></div>
          <div class="pure-u-18-24">
            <b><span class="col-pri"><%= experience[timespan].title %></span>&nbsp;&nbsp;<%= experience[timespan].company %></b>
            <p class="experience"><%= experience[timespan].descr %></p>
          </div>
        </div>
        <% } %>
      </div>
    </div>
    <!-- Education -->
    <div class="pure-g block">
      <div class="pure-u-1">
        <div class="pure-g title">
          <div class="pure-u-1-24"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-23-24"><h2>Education</h2></div>
        </div>
        <% for (var timespan in education) { %>
        <div class="pure-g">
          <p>
          <div class="pure-u-1-24"></div>
          <div class="pure-u-5-24"><%= timespan %></div>
          <div class="pure-u-18-24">
            <b>
              <% for (var eDetails in education[timespan]) { %>
              <% if (eDetails % 2 == 0) { %>
              <span class="col-pri"><%= education[timespan][eDetails] %></span>
              <% } else { %>
              <span>&nbsp;&nbsp;<%= education[timespan][eDetails] %>&nbsp;&nbsp;</span>
              <% } %>
              <% } %>
            </b>
          </div>
          </p>
        </div>
        <% } %>
      </div>
    </div>
    <!-- Interests -->
    <div class="pure-g block">
      <div class="pure-u-1">
        <div class="pure-g title">
          <div class="pure-u-1-24"><i class="fa fa-plus fa-lg col-pri"></i></div>
          <div class="pure-u-23-24"><h2>Interests</h2></div>
        </div>
        <div class="pure-g">
          <div class="pure-u-1-24"></div>
          <div class="pure-u-23-24">
            <% for (var interest in interests) { %>
            <span class="col-pri">//</span> <span class="col-sec"><%= interest %></span>
            <% } %>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
</body>
</html>