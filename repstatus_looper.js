// Execute the following command in the Mongo Shell to load and run this script:
// load("looper.js")

db = db.getSiblingDB("testdb");
db.tbl_records
db.setSlaveOk();

while (true) {
    print("Port: "+ db.serverCmdLineOpts().parsed.net.port + "\tStatus: " + (db.isMaster().ismaster ? "PRIMARY     " : "SECONDARY   ") + "\tRecords Count: " + db.tbl_records.find({val: {$gte: 0}}).count());
    sleep(1000);
};
