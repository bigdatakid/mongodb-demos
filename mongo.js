const MongoClient=require('mongodb').MongoClient

const url = 'mongodb://mongodba:data2012@localhost:27019,localhost:270118,localhost:27017/test?replicaSet=replKey';

MongoClient.connect(url, function(err,client){ 
	if (err) 
	{
		console.error(err); 
	    console.log('trouble');
	}
	else 
	{	
	    console.log('successful connect'); 
		client.close();
	}
});
