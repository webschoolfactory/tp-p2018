set -o errexit #abort if any command fails
echo '############## INSTALL GIT ####################'
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git
apt-get install -y git-core bash-completion
echo '############## INSTALL NODE ####################'
apt-get update
apt-get install -y python-software-properties python g++ make
apt-get install -y software-properties-common
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
node --version
echo '############## INSTALL NPM ####################'
npm config set tmp='/tmp'
#sudo chown -R $(whoami) $HOME/.npm
sudo npm i -g npm
echo '############## INSTALL MONGODB ####################'
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get install mongodb-10gen
set +o errexit #don't abort if any command fails
mkdir /data/
mkdir /data/db
chmod 777 /data/db
mongod --version
set -o errexit #abort if any command fails
cd /vagrant
npm install --no-bin-links

echo '############## INSTALL SERVER APP ####################'
sudo npm install pm2 -g
#sudo chown -R $(whoami) $HOME/.npm
pm2 start /vagrant/app.js -name webschool
pm2 startup ubuntu
sudo env PATH=$PATH:/usr/local/bin pm2 startup ubuntu -u vagrant
pm2 save

