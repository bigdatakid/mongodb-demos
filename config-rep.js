var config={ "_id" : "NotSecure"
  ,"version": 1
  ,"members": [ { "_id":0, "host": "localhost:27010"}
            , { "_id":1, "host": "localhost:27011"}
            , { "_id":2, "host": "localhost:27012"} ]
};

rs.initiate(config);