#/bin/bash

# remove include from *.rc files
pattern=".\s\/.*\/helpers"
egrep -s $pattern ~/.bashrc && sed -i "" "/$pattern/d" ~/.bashrc
egrep -s $pattern ~/.zshrc && sed -i "" "/$pattern/d" ~/.zshrc

# remove downloaded file
rm -rf ~/.scutil/

echo "Done."