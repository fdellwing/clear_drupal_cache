# clear_drupal_cache

[![Build Status](https://travis-ci.org/fdellwing/clear_drupal_cache.svg?branch=master)](https://travis-ci.org/fdellwing/clear_drupal_cache)[![Type](https://img.shields.io/badge/type-%2Fbin%2Fbash-blue.svg)](https://www.gnu.org/software/bash/bash.html)

This script is your easy way to clear your drupal caches.

**Foldername or file?**

You can clear the cache for each installation individually by triggering the script on the foldername of the drupal installation. But you can also put multiple foldernames in a file and the script will clear the cache for all these installations.

Example:
```shell
drupal1
drupal2
drupal3
```

**Usage**
```shell
    Usage: ./clear_drupal_cache.sh <foldername or file>
    Instead of a foldername, you can provide a file with foldernames
```

**Footnote**

Feel free to fork, modify or improve this script. I will also look at every pull request.
