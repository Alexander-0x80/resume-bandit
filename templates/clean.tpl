<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>TPL</title>
        <link rel="stylesheet" href="css/pure-min.css">
        <link href='http://fonts.googleapis.com/css?family=Ubuntu' rel='stylesheet' type='text/css'>
        <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
        <style>             
            .pure-g [class *= "pure-u"] {
                font-family: 'Ubuntu', sans-serif;
            }

            h1 {
                font-size: 42px;
                margin-bottom: 0px;
            }

            h3 {
                font-size: 28px;
                margin-bottom: 5px;
            }

            .capitalize:first-letter {
                text-transform:capitalize;
            }

            .col-pri {
                color: <%= theme.colors.pri %>;
            }

            .col-sec {
                color: <%= theme.colors.sec %>;
            }
        </style>
    </head>
    <body>
        <div class="pure-g">
            <div class="pure-u-1-24"></div>
            <div class="pure-u-22-24">
                <div><h1><%= name.first %><span  class="col-pri"><%= name.last %></span></div>
                <div>
                    <% whois.forEach(function(item) {  %>
                    <span class="col-pri">//</span> <span class="col-sec"> <%= item %></span>
                    <% }); %>
                </div>

                <div class="pure-g">
                    <div class="pure-u-1-2">
                        <h3><i class="<%= theme.icons.about %>"></i> About</h3>
                        <% for (var item in about) { %>
                        <div class="pure-g">
                            <div class="pure-u-6-24 col-sec capitalize"><%= item %></div>
                            <div class="pure-u-2-24">
                                <i class="<%= theme.icons.details.shift() %>"></i>
                            </div>
                            <div class="pure-u-16-24"><%= about[item] %></div>                      
                        </div>
                        <% } %>
                    </div>

                    <div class="pure-u-1-2">
                        <h3><i class="<%= theme.icons.skills %>"></i> Skills</h3>
                        <% for (stype in skills) { %>
                        <div class="pure-g">
                            <div class="pure-u-4-24 col-sec capitalize"><%= stype %></div>
                            <div class="pure-u-2-24"><i class="<%= theme.icons.skill %>"></i></div>
                            <div class="pure-u-10-24">
                                <% for (var skill in skills[stype]) { %>
                                <div><%= skill %></div>
                                <% } %>
                            </div>
                            <div class="pure-u-8-24">
                                <% for (var skill in skills[stype]) { %>
                                <div class="col-pri">
                                    <% _.times(skills[stype][skill], function(){ %>
                                    <i class="<%= theme.icons.level %>"></i>
                                    <% }); %>
                                </div>
                                <% } %>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

                <div class="pure-u-2-2">
                    <h3><i class="<%= theme.icons.experience %>"></i> Experience</h3>
                    <% for (var timespan in experience) {  %>
                    <div class="pure-g">
                        <div class="pure-u-1-5 col-sec"><%= timespan %></div>
                        <div class="pure-u-4-5">
                            <b><%= experience[timespan].title %></b> <span class="col-pri">@ </span><%= experience[timespan].company %>
                            <p><%= experience[timespan].descr %></p>
                            
                        </div>
                    </div>
                    <% } %>
                </div>

                <div class="pure-u-2-2">
                    <h3><i class="<%= theme.icons.education %>"></i> Education</h3>
                    <% for (var institute in education) { %>
                    <div class="pure-g">
                        <div class="pure-u-1-5 col-sec capitalize"><%= institute %></div>
                        <div class="pure-u-4-5"><%= education[institute] %></div>
                    </div>
                    <% } %>
                </div>

                <div class="pure-u-2-2">
                    <h3><i class="<%= theme.icons.interests %>"></i> Interests</h3>
                    <% for (var subject in interests) { %>
                    <div class="pure-g">
                        <div class="pure-u-1-5 col-sec capitalize"><%= subject %></div>
                        <div class="pure-u-4-5">
                        <% interests[subject].forEach(function(item) { %>
                        <span class="col-pri">//</span> <%= item %>
                        <% }); %>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>>
    </body>
</html>