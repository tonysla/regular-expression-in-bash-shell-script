# regular-expression-with-bash-script

Regular expression can also be used to extract data. The script file `regex_bash_script.sh` contains a good number of codes necessary to extract data from a web page. 

# Commands used

      curl  
      egrep  
      cut  
      sed  
      
 
 1. The `curl` command is used to retrive URL's, and html tags. Then you can save it as a text file to be used later to fetch the data.   
 
 
 2. The `egrep` command fetches the part of the data that matches with what is specified inside quotes. Type `egrep --help` on terminal on kali linux and check for more options. On the script I have used `egrep` and `egrep -o`. The `egrep -o` stands for "all that matches".   
 
 3. The `cut` command is used (as the word says) to cut/skip the data from a particular point and keep the rest or a portion of the data. There are several ways of using the `cut` tool, but the most useful I found is the `cut -d` method. The `-d` stands for 'delimited', use `cut --help` in the console for more options.   
 
 4. The `sed` command is used to replace parts of the data. It can be anything from white space, upper/lower case letters, numbers, words, symbols etc. First use command `sed` followed by `"s/"` and after the forward slash place the symbol that needs to be replaced, `"sed/A/a/"` and right after place the other symbol that replaces the capital `A`. In case of replacing white space with no white space do the following `sed "s/ //"`.
 
 

