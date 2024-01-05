#!/bin/bash

if [ $1 == "kur" ]; then

  # guncel node.js repolarının eklenmesi
  
  NODE_MAJOR=18
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl gnupg
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key |     sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
  echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
  
  # php repolarının eklenmesi
  
  sudo apt install software-properties-common
  sudo add-apt-repository ppa:ondrej/php
  
  #postgreSQL repoalarının eklenmesi
  
  sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
  wget -O- https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor > pgsql.gpg
  sudo mv pgsql.gpg /etc/apt/trusted.gpg.d/pgsql.gpg
  
  # Debian paketinin kurulması
  
  sudo apt update
  wget https://github.com/limanmys/core/releases/download/release.feature-new-ui.863/liman-2.0-RC2-863.deb
  apt install ./liman-2.0-RC2-863.deb
  
  echo "Kurulum tamamlandı."
  
elif [ $1 == "administrator" ]; then
   #Yeni email ve parola belirlenmesi
   sudo limanctl reset administartor@liman.dev

elif [ $1 == "kaldır" ]; then
   #Limanın kaldırılması
   apt-get remove liman

elif [ $1 == "help" ]; then
   # yardım eden dosyanın gösterilmesi
   
   

   touch help.txt

   echo "kaldır = limanı kaldırır 
   kur = limanı kurar
   administrator = email ve şifre belirler.
   help = özel parametrelerin özelliklerini gösterir.">help.txt

   cat help.txt





# Komutu çalıştır
sudo limanctl reset "$2"

# Komutun başarıyla tamamlanıp tamamlanmadığını kontrol et
if [ $? -eq 0 ]; then
  echo "mail başarıyla sıfırlandı."
else
  echo "mail sıfırlama işlemi başarısız oldu."
fi




else
  echo "Kurulum yapılamadı."
fi
