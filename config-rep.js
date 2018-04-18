var config={ "_id" : "NotSecure"
  ,"version": 1
  ,"members": [ { "_id":0, "host": "localhost:27010", "priority":2 }
              , { "_id":1, "host": "localhost:27011", "priority":1 }
              , { "_id":2, "host": "localhost:27012", "priority":1 } ]
};

rs.initiate(config);