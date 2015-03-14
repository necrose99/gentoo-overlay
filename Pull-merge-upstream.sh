### This is set-up for making a public layman for testing by non spike-  general Gentoo use Abuse and Etc..
### you can always edit this to keep your own fork In sync, 
##git remote set-url --push origin https://github.com/Sabayon-Labs/spike-overlay/.git  git@github.com:Spike-Pentesting/App-witchcraft.git
git remote add origin https://github.com/necrose99/gentoo-overlay.git
git remote add upstream https://github.com/izaakschroeder/gentoo-overlay.git
git checkout master
git fetch upstream
git add *
git merge upstream/master
git merge master
git commit -m "robot script syncing files..."
git push -f
git push origin master
git rebase -i master
