Git Help Instructions
-Main Commands
git status: check status of folder
git add filename
git add --all
git commit -m "Created the Repository."
git commit -a -m "Your message.": does not add new files, but changes.
git log: check past activities

-Reset changes
git reset HEAD: HEAD is the name of the current commit, this happens after git add, it does not change the history at all nor does it change what is going on the working directory.
git checkout HEAD -- filename: remove changes from previous commit
git checkout COMMIT_IDENTIFIER -- file1, file2: remove changes for multiple files
