#/bin/bash

# remove include from *.rc files
pattern=".\s\/.*\/helpers"
egrep -sq $pattern ~/.bashrc && sed -i "" "/$pattern/d" ~/.bashrc
egrep -sq $pattern ~/.zshrc && sed -i "" "/$pattern/d" ~/.zshrc

# remove downloaded file
rm -rf ~/.scutil/

echo "Done."