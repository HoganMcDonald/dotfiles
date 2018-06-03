# the path to the directory this shell is running in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# if no local directory exists, create it.
if [ ! -d ~/dotfiles-local ]; then
    mkdir ~/dotfiles-local
fi

# create a local gitconfig file
cp $DIR/sample.gitconfig.local ~/dotfiles-local/gitconfig.local

# open it in vim so you can add your credentials
vim ~/dotfiles-local/gitconfig.local

echo '\n updating dotfile symlinks'

# update .gitconfig to use your credentials
rcup
