You have a symlink pointing to /etc/config/settings.txt. The sysadmin moves that file to /etc/config/old/settings.txt and creates a new file at the original 
path. Your symlink still works, but now points to different data. Why did this happen and how could you have prevented it? 

Answer: A symbolic link stores the path to a filename and not the file’s actual inode. When the sysadmin moved the original file and created settings.txt, 
the symlink still pointed to that path. Because a new file now existed there, the symlink resolved to the new file instead of the original data. 
This could have been prevented by using a hard link to the original file, which references the inode directly.

