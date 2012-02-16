sudo chown andrew:andrew -R cubanker
./mkGPL.sh copyright
./mkmanpg.sh cubanker.1
find -type f -name "*~" -exec rm {} \;
sudo rm *.deb
sudo dpkg --purge cubanker
sudo chown root:root -R cubanker
sudo chmod -R 775 .
sudo dpkg --build cubanker
sudo mv cubanker.deb cubanker-0.0.1.deb
sudo dpkg -i cubanker-0.0.1.deb
sudo chown andrew:andrew -R cubanker
