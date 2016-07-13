sync-local-to-s3
================

Bash script to sync local folder to Amazon S3

Copyright: Christos Pontikis http://www.pontikis.net 

License: MIT https://raw.github.com/pontikis/sync-local-to-s3/master/MIT_LICENSE

Release: 0.9.1 (13 Jul 2016)

View CHANGELOG https://github.com/pontikis/sync-local-to-s3/blob/master/CHANGELOG.md

Github https://github.com/pontikis/sync-local-to-s3

Bitbucket https://bitbucket.org/pontikis/sync-local-to-s3

Documentation
-------------

Clone 
```
git clone https://github.com/pontikis/sync-local-to-s3.git
```

or Download: https://github.com/pontikis/sync-local-to-s3/archive/master.zip

Update
```
cd /path/to/sync-local-to-s3
git fetch
git merge origin master
```

Do not change main script ```sync-local-to-s3.sh``` neither ```config/config.dist.sh```.

Just copy ```config.dist.sh``` somewhere (with any name you like) and make the appropriate modifications. It is recommended to add your config file(s) in config folder (all files in config directory except ```config.dist.sh``` are ignored by git).

*Execute*

```
sync-local-to-s3.sh /path/to/your/config
```

In case you want to close the terminal, run something like 
```
nohup sync-local-to-s3.sh /path/to/your/config &
```

Detailed log file is created. Log file can be sent via email (see ```config.dist.sh```).

Required:
* Amazon AWS account https://aws.amazon.com/ 
* s3cmd setup http://s3tools.org/s3cmd 
* Optional: trickle bandwidth shaper http://linux.die.net/man/1/trickle