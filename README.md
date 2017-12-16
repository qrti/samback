# samback

#### linux bash scripts to backup and restore samsung tv recordings 
\- for real or VM linux desktop systems  
\- consider further [remarks](#remarks)


#### download  
download repository from GitHub,  
unzip and copy for example to: ~/samback

**or**

copy scripts to current directory  
`$ wget -r --no-parent -A.sh https://raw.github.com/qrti/samback/master/script`

**or**

check if git is installed  
`$ git --version`

if git is not installed  
`$ sudo apt-get install git-all`

clone repository to current directory  
`$ git clone https://github.com/qrti/samback.git`

- - -

#### necessary install  
pipe viewer  
`$ sudo apt-get install pv`  

- - -

#### configure  
edit the scripts and enter _your_ data between the quotation marks  

`$ nano backup.sh`
```
SRC="/media/USER/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/CONTENTS/"    # source path to harddisk drawer with tv recordings
DST="~/Downloads/"                                                  # destination path to backup drawer

#    yyyyMMddhhmmss           backup mask 
REC="201711????????"        # (example: all recordings made in november 2017)
```

`$ nano restore.sh`
```
SRC="~/Downloads/"                                                  # source path to backup drawer
DST="/media/USER/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/CONTENTS/"    # destination path to harddisk drawer with tv recordings
```

- - -

#### execute  
change directory  
`$ cd ~/samback`

make scripts executable once  
`$ chmod 755 backup.sh restore.sh`

execute backup  
`$ sudo ./backup.sh`  
backes up a group of recordings (to define in script)  
after backup you will be asked to delete the original recordings

execute restore  
`$ sudo ./restore.sh yyyyMMddhhmmss`  
restores one distinct recording

- - -

#### remarks  
- simply copying recordings does not work, because owner and permissions are altered and restored files are not recognized by the tv anymore
- every recording (6 files each), is therefore backed up unchanged to a corresponding tar-file (without compression)
- use this script completely at your own risk

Donations are welcome!

[![https://www.paypal.com](https://www.paypalobjects.com/webstatic/en_US/btn/btn_donate_pp_142x27.png)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=E7JNEDMHAJ3TJ)

- - -

#### copyright  
samback is published under the terms of MIT license

Copyright (c) 2017 [qrt@qland.de](mailto:qrt@qland.de)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
