Git Help Instructions
-Main Commands
git status: check status of folder
git add filename
git add --all
git commit -m "Created the Repository."
git commit -a -m "Your message.": does not add new files, but changes.
git log: check past activities
git rm -- filename: remove from both staging area and working directory
git rm --cached -- filename: remove from staging area but not working directory

-Reset changes
git reset HEAD: HEAD is the name of the current commit, this happens after git add, it does not change the history at all nor does it change what is going on the working directory.
git checkout HEAD -- filename: remove changes from previous commit
git checkout COMMIT_IDENTIFIER -- file1, file2: remove changes for multiple files

-Git branches and merging
git checkout COMMIT_3 -b old_intro: create a new branch called old_intro
git checkout master
git merge old_intro: throw away master branch and merge the changes from new branch
* for conflicts refer to notes

-Use on GitHub
git remote add origin <remote repository URL>
git push -u origin/master
git pull
git push origin master
