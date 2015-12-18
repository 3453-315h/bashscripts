# Bash scripts
This repository is a collection of bashscripts that [@routeback] has developed or is in the process of developing. These have been tested on Kali linux and Mac OSX with terminator and iTerm, respectively. Most of these scripts are for a single specific use and meant to be added to the local $PATH for convenience.

Other scripts, such as sslchecks.sh are meant to provide a quick TUI for capturing evidence of multiple SSL vulnerabilities and outputting the results to a file. 

### Installation
Simply run the scripts from a bash shell:
```sh
$ source append.sh
```

Specify the path to them in your startup script or bash profile for more convenient usage
```sh
$ git clone https://github.com/routeback/bashscripts.git
$ cd bashscripts; echo "export PATH=`pwd`:$PATH" >> ~/.bashrc; source ~/.bashrc
```

### Todos
 - Upload additional scripts

### Version
0.1 - Initial Upload 20151216


License
----
MIT

<!---
[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. 

http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

-->


   [git-repo-url]: <https://github.com/routeback/bashscripts.git>

   [@routeback]: <http://twitter.com/routeback>