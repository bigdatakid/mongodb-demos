#!/usr/bin/env python
import pymongo, sys, random


URL = 'mongodb://mongodba:data__123@localhost:27010,localhost:27011,localhost:27012/admin'

URL = URL + '?replicaSet=replKey&retryWrites=true&w=majority&wtimeoutMS=2000&readConcernLevel=majority'

connection = pymongo.MongoClient(URL)
print('Inserting records continuously....')
connect_problem = False
db=connection['testdb']
counter = 0
c_step = 100

while True:
    try:
        db.tbl_records.insert({'val': random.randint(1,100)});
        counter = counter + 1
        if (counter % c_step) == 0:
           print('Counter:' + str(counter))
           print('********  Database OK  ********')
        if (connect_problem):
            print('Reconnected')
            connect_problem = False
    except KeyboardInterrupt:
        print
        sys.exit(0)
    except:
        if (counter % c_step) == 0:
           print('Counter:' + str(counter))
        print('********  Connection problem  ********')
        connect_problem = True
