Resume Bandit
============

 > Minimalistic developer resume generator designed to fit in a single A4 page
 


### Install

    $ npm install -g resume-bandit

### Use

    Usage: resume-bandit [options]

    Options:

      -h, --help                output usage information
      -V, --version             output the version number
      -t, --template [path]     Underscore template file name
      -d, --data [path]         YAML data file name
      -e, --encoding [charset]  Set encoding
      -o, --out [path]          Output file name
      
If no command line arguments present, bandit has the defaults of : 

     $ resume-bandit -t templates/clean.tpl -d data/sample.yaml -e utf8 -o resume.html
     
      
### Example output

![img](etc/sample.png)

### Why ?

Because coding my own resume is fun™
