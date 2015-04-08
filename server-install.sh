set -o errexit #abort if any command fails
echo "############## INSTALL GIT ####################"
sudo add-apt-repository -y ppa:git-core/ppa;
sudo apt-get update;
sudo apt-get install -y git;
sudo apt-get install -y git-core bash-completion;
echo '############## INSTALL NODE ####################'
sudo apt-get update;
sudo apt-get install -y python-software-properties python g++ make;
sudo apt-get install -y software-properties-common;
sudo add-apt-repository -y ppa:chris-lea/node.js;
sudo apt-get update;
sudo apt-get install -y nodejs;
node --version;
echo '############## INSTALL NPM ####################'
npm config set tmp='/tmp';
sudo chown -R $(whoami) $HOME/.npm;
sudo npm i -g npm;
echo '############## INSTALL MONGODB ####################'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10;
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list;
sudo apt-get update;
sudo apt-get install mongodb-10gen;
set +o errexit #don't abort if any command fails
mkdir /data/;
mkdir /data/db;
chmod 777 /data/db;;
mongod --version
set -o errexit #abort if any command fails
cd /media/sf_tp-p2018;
npm install --no-bin-links;
echo '############## INSTALL SERVER APP ####################'
sudo npm install pm2 -g;
sudo chown -R $(whoami) $HOME/.npm;
pm2 start /media/sf_tp-p2018/app.js -name webschool;
pm2 startup ubuntu;
sudo env PATH=$PATH:/usr/local/bin pm2 startup ubuntu -u $(whoami);
pm2 save;