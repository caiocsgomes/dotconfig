## Inodes, hard and soft links

Inodes are data structures stored in the filesystem that store data about files (permissions, memory location, size, etc).
Inodes do not store file names, this is stored in the filesystem. The filesystem stores the inode for each file name.
This relation: file name -> inode is called a hard link, the relation: file name -> file name, is called a soft link
When no file name point to an inode, the inode is considered free and can be realocated to other file.
The filesystem does not delete inodes, it only overwrites them when deleted.
To copy a file name and keep the same permissions we make a hard link to the same inode instead of cppying (cp).

```sh
# creating hard links
ln source_file_name target_file_name

# creating soft links
ln -s source_file_name target_file_name

# get data about inode usage
df -i
```
