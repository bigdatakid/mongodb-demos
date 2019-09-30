echo "Clean Directories"
cleandir.sh
echo "Starting mongod daemons"
mongod --fork --dbpath /tmp/mongod/00/data/ --logpath /tmp/mongod/00/log/mongod00_log.txt --port 27010 --smallfiles
