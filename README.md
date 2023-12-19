# server_mem_stats

## Overview
This project is to see the server memory stats

## Preparation
You have to prepare for this command, following the steps:
1. Create ```~/command``` directory. ```mkdir ~/command```
2. Add shellscript in the directory you created above. ```touch ~/command/memshow```
3. Wirte the script in the file
```
#!/bin/bash

cat path/to/memory_status/memory
```
4. Change the permission for the file. ```chmod 777 ~/command/memshow```
5. Add PATH to eable ```memshow``` command. ```export PATH=$HOME/command:$PATH```

Now you've done the preparation for this project:)
