add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git
apt-get install -y git-core bash-completion
git –-version
apt-get update
apt-get install -y python-software-properties python g++ make
apt-get install -y software-properties-common
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get install -y nodejs
node --version
sudo npm i -g npm
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
apt-get update
apt-get install mongodb-10gen
mkdir /data/
mkdir /data/db
chmod 777 /data/db
mongod --version
npm config set tmp='/tmp'