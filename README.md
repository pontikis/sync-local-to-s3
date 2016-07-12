sync-local-to-s3
================

Bash script to sync local folder to Amazon S3
(Amazon AWS account required)

Copyright: Christos Pontikis http://www.pontikis.net 

License: MIT https://raw.github.com/pontikis/sync-local-to-s3/master/MIT_LICENSE

Release: 0.9.0 (12 Jul 2016) - View CHANGELOG
https://raw.github.com/pontikis/sync-local-to-s3/master/CHANGELOG.md

Github https://github.com/pontikis/sync-local-to-s3
Bitbucket https://bitbucket.org/pontikis/sync-local-to-s3

Documentation
-------------

Clone 
```
git clone git@github.com:pontikis/sync-local-to-s3.git
```

or Download: https://github.com/pontikis/sync-local-to-s3/archive/master.zip

Update
```
git fetch
git merge origin master
```

Do not change main script, neither config.dist.sh
Just copy config.dist.sh somewhere (with any name you like) and make the appropriate modifications

Run 
```
sync-local-to-s3 /path/to/your/config
```

Required:
* Amazon AWS account 
* s3cmd setup http://s3tools.org/s3cmd 
* Optional: trickle bandwidth shaper http://linux.die.net/man/1/trickle