Hard Links vs Symbolic Links

1. You have a symlink pointing to /etc/config/settings.txt. The sysadmin moves that file to /etc/config/old/settings.txt and creates a new file at the original path. Your symlink still works, but now points to different data. Why did this happen and how could you have prevented it? 

A symbolic link stores the path to a filename and not the file’s actual inode. When the sysadmin moved the original file and created settings.txt, 
the symlink still pointed to that path. Because a new file now existed there, the symlink resolved to the new file instead of the original data. 
This could have been prevented by using a hard link to the original file, which references the inode directly.

2. You delete all hardlinks to a file, but the inode still exists and the data isn’t freed. What’s keeping the file alive?

Even though the hardlinks are deleted, running processes is what keeps the file alive. The data will be freed once the running process is terminated.

3. You create 10 hardlinks to a file and then delete the original. You edit one of the hardlinks and add 50 lines. How many of the remaining hardlinks now have 150 lines, and why?

All hardlinks will show all 150 lines because hardlinks reference the same inode and data which point to the same file whenever a change takes effect.

4. You’re setting up a configuration system where a symlink in /home/user/config should always point to the active config in /opt/configs/. Why would a relative symlink break here but an absolute one wouldn’t?

An absolute symlink always points to the full path while an relative symlink will not. Relative symlinks won't be able to access the same file when moved to a different location while absolute symlinks have no problem doing so.

File Permissions

1. You set a file to 644 but users in the group still can’t read it. The file owner is you. What could be wrong, and how would you systematically debug this?

Most likely the issue is the group has permission to read the file but no permission to access it. The permissions should be changed so everyone can read 
and write to the file which should fix the issue. Listing permissions can also confirm who has permissions and who doesn't.

2. A script is 755 and owned by root. A regular user can execute it, but when the script tries to write to a file in /var/log/, it fails with “Permission denied”. Why, and what’s the security implication?

A regular user can't run a script that has elevated permissions especially if it has to do with system logs. System logs can't be modified by unauthorized users and this is why the system reacts this way when attempting to access it. 

3. Your application needs to create files in /tmp that only the owner can read, but it needs to be run by multiple different users. If you just chmod 600 the directory, what breaks and why?

Using chmod 600 will make it where no other user than you will be able to read and write to the file. Other users beside you should get execute permissions so they can be able to access the file with you.

4. You have a directory that’s drwxr-xr-x but you want to prevent others from listing the contents while still letting them access files if they know the name. What permission would you use and why does the execute bit matter here?

The correct command to use would be chmod 711. Chmod 711 removes the read permissions for users and removing execute privileges will make it where users can't list any content of a file even if they know it's name.

Shell Scripts

1. You write a script with #!/bin/bash but it still fails when run as ./script.sh from the cron daemon. The same script works fine when you run it manually. What’s likely wrong?

Cron runs in a minimal environment and doesn't load user environment variables or path settings. You have to use absolute paths and define required environment variables in the script to get it to run.

2. A script uses read NAME but you’re piping input to it: echo "John" | ./script.sh. The script doesn’t receive the name. Why, and how would you fix it?

THe script might be waiting for interactive input from the user or it is calling from a different source. o get the script to read correctly, standard input should be used correctly or arguments initialized to something like like NAME = $1 to receive input.

3. You pass 5 arguments to a script but only use $1 and $2. You later realize you need to pass the remaining arguments to another command: some_command $@. What’s the difference between $@ and $* and when does it matter?

$@ expands each argument into a separate quoted value while $* combines all arguments into a single string. The difference between the two i $@ will preerve it's original structure and should be taken into consideration before using for specific reasons.

4. You have a function that returns 1 on error, but your script doesn’t check the return value and continues anyway. Later, your script appears to run successfully but actually failed silently. How would you structure your script to catch errors earlier?

I think the most simple way to know the script has an error is by enabling a command such as set -e at a line you believe can cause an error and exit out of the script once that fails.

5. You write a loop: for file in *.txt; do process "$file"; done. If a filename has spaces in it, what breaks and how would you fix it?

When you don't use curly braces in a file name, it will split it into multiple arguments which will cause the script to break. Adding curly braces will cause the system to address it as single string.




