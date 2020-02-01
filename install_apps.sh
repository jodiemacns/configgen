pips=(
   youtube-dl 
   mps-youtube
   )

sudo apt install $@ 

for var in "${pips[@]}"
do
   echo hi1
   echo "****************************************"
   echo Pip installing $var
   echo ----------------------------------------
   pip3 install --user $var  
   pip3 install --user $var --upgrade
   echo "****************************************"
done

git config --global user.email "$USER@gmail.com"
git config --global user.name "$USER"

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/ericcurtin/CurtineIncSw.vim.git ~/.vim/bundle/CurtineIncSw.vim
git clone https://github.com/LukeSmithxyz/mutt-wizard ~/code/mutt-wizard
mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

