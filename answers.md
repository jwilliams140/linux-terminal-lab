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





