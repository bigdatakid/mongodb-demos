{  "_id" : "SECURED",
	"version" : 1,
	"protocolVersion" : NumberLong(1),
	"members" : [
		{ "_id" : 0, "host" : "node1:27017"}
    	,{
			"_id" : 1,
			"host" : "node2:27017",
		}		
    	,{
			"_id" : 2,
			"host" : "node3:27017",
		}	
	] } }


db.createUser({ "user": "mongodba" , "pwd" : "pw123test", "roles" : [ { role: "root", db : "admin" } ]})

  ssl:
    mode: requireSSL
    PEMKeyFile: /etc/ssl/mongodb/node1.pem
    CAFile: /etc/ssl/mongodb/ca.pem
security:
  clusterAuthMode: x509


use admin
db.createUser({
 user: "foo",
 pwd: "bar",
 roles: [{role: "root", db: "admin"}]
});
db.createUser({
 user: "bar",
 pwd: "baz",
 roles: [{role: "userAdminAnyDatabase", db: "admin"}]
});
db.createUser({
 user: "mongo-messenger",
 pwd: "nodejs",
 roles: [{role: "readWrite", db: "security-lab"}]
});

security:
  redactClientLogData: true


use admin
db.auth("foo","bar")
db.adminCommand( {setParameter:1, redactClientLogData:1 } )


```
{
  "KeyPair": "AdvancedAdministrator",
  "NumberOfTeams": "8",
  "Name": "NathanL-NHTT",
  "Teams": [
    {
      "SecurityGroup": "sg-c48850af",
      "Hosts": [
        {
          "PublicName": "ec2-52-14-58-89.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "52.14.58.89",
          "Role": "node1",
          "Id": "i-0585a4e9f0c064553"
        },
        {
          "PublicName": "ec2-18-216-237-22.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "18.216.237.22",
          "Role": "node2",
          "Id": "i-0fd834a8cd35ce67c"
        },
        {
          "PublicName": "ec2-18-219-106-253.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.219.106.253",
          "Role": "node3",
          "Id": "i-064e8505013705e04"
        },
        {
          "PublicName": "ec2-18-221-185-159.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.221.185.159",
          "Role": "node4",
          "Id": "i-0a90d711f6628c1e9"
        }
      ],
      "VPC": "vpc-82c36eea",
      "SubnetMask": "10.0.0.0/24",
      "Id": "1",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-e18c548a",
      "Hosts": [
        {
          "PublicName": "ec2-18-219-28-41.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.219.28.41",
          "Role": "node1",
          "Id": "i-0516483ab2fb32abc"
        },
        {
          "PublicName": "ec2-13-59-217-63.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "13.59.217.63",
          "Role": "node2",
          "Id": "i-0daa2171aebb33423"
        },
        {
          "PublicName": "ec2-18-221-180-221.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.221.180.221",
          "Role": "node3",
          "Id": "i-05209110209be35e0"
        },
        {
          "PublicName": "ec2-18-219-72-29.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.219.72.29",
          "Role": "node4",
          "Id": "i-07c933bf7f5866184"
        }
      ],
      "VPC": "vpc-77c36e1f",
      "SubnetMask": "10.0.0.0/24",
      "Id": "2",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-b28c54d9",
      "Hosts": [
        {
          "PublicName": "ec2-18-219-103-241.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.219.103.241",
          "Role": "node1",
          "Id": "i-03fe50821e73755b5"
        },
        {
          "PublicName": "ec2-13-59-127-203.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "13.59.127.203",
          "Role": "node2",
          "Id": "i-0f8be27afe9eccd9e"
        },
        {
          "PublicName": "ec2-13-59-206-22.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "13.59.206.22",
          "Role": "node3",
          "Id": "i-0f17c958f5cf2ef26"
        },
        {
          "PublicName": "ec2-13-59-79-59.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "13.59.79.59",
          "Role": "node4",
          "Id": "i-0f1563974b2239697"
        }
      ],
      "VPC": "vpc-19c66b71",
      "SubnetMask": "10.0.0.0/24",
      "Id": "3",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-ae8b53c5",
      "Hosts": [
        {
          "PublicName": "ec2-18-221-182-25.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.221.182.25",
          "Role": "node1",
          "Id": "i-08f6828f8981894e7"
        },
        {
          "PublicName": "ec2-52-14-27-46.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "52.14.27.46",
          "Role": "node2",
          "Id": "i-0170261ceb0cdf13b"
        },
        {
          "PublicName": "ec2-18-219-35-150.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.219.35.150",
          "Role": "node3",
          "Id": "i-042cc2afe91070326"
        },
        {
          "PublicName": "ec2-18-217-126-152.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.217.126.152",
          "Role": "node4",
          "Id": "i-088d1ff02c50b039a"
        }
      ],
      "VPC": "vpc-d2dd70ba",
      "SubnetMask": "10.0.0.0/24",
      "Id": "4",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-79895112",
      "Hosts": [
        {
          "PublicName": "ec2-52-15-163-156.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "52.15.163.156",
          "Role": "node1",
          "Id": "i-0bfa762acc68ee0d3"
        },
        {
          "PublicName": "ec2-13-59-6-213.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "13.59.6.213",
          "Role": "node2",
          "Id": "i-06c8f91eda25cc20c"
        },
        {
          "PublicName": "ec2-13-58-38-101.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "13.58.38.101",
          "Role": "node3",
          "Id": "i-02dc10f6164d3c63b"
        },
        {
          "PublicName": "ec2-18-216-133-240.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.216.133.240",
          "Role": "node4",
          "Id": "i-02e21e64c854deccc"
        }
      ],
      "VPC": "vpc-68c06d00",
      "SubnetMask": "10.0.0.0/24",
      "Id": "5",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-778c541c",
      "Hosts": [
        {
          "PublicName": "ec2-18-219-81-75.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.219.81.75",
          "Role": "node1",
          "Id": "i-0f4b31793ade22fb9"
        },
        {
          "PublicName": "ec2-18-216-74-117.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "18.216.74.117",
          "Role": "node2",
          "Id": "i-026c3338839a3574d"
        },
        {
          "PublicName": "ec2-18-218-209-237.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.218.209.237",
          "Role": "node3",
          "Id": "i-0ee3e76b97f014ab6"
        },
        {
          "PublicName": "ec2-18-216-126-246.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.216.126.246",
          "Role": "node4",
          "Id": "i-0ceac5cdbcdfcbd5c"
        }
      ],
      "VPC": "vpc-a7dc71cf",
      "SubnetMask": "10.0.0.0/24",
      "Id": "6",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-568d553d",
      "Hosts": [
        {
          "PublicName": "ec2-18-219-47-100.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.219.47.100",
          "Role": "node1",
          "Id": "i-0bca1dc38ace1944c"
        },
        {
          "PublicName": "ec2-13-59-139-99.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "13.59.139.99",
          "Role": "node2",
          "Id": "i-01d237a6d6aacb1b7"
        },
        {
          "PublicName": "ec2-18-219-106-136.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.219.106.136",
          "Role": "node3",
          "Id": "i-0ae327cba777c7d6b"
        },
        {
          "PublicName": "ec2-18-217-145-79.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.217.145.79",
          "Role": "node4",
          "Id": "i-0c5241f94b89969cb"
        }
      ],
      "VPC": "vpc-32c06d5a",
      "SubnetMask": "10.0.0.0/24",
      "Id": "7",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    },
    {
      "SecurityGroup": "sg-278b534c",
      "Hosts": [
        {
          "PublicName": "ec2-18-219-32-27.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-101.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.101",
          "PublicIP": "18.219.32.27",
          "Role": "node1",
          "Id": "i-079adb1febe043799"
        },
        {
          "PublicName": "ec2-18-219-9-82.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-102.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.102",
          "PublicIP": "18.219.9.82",
          "Role": "node2",
          "Id": "i-0ad17a0bca7102ec9"
        },
        {
          "PublicName": "ec2-18-221-97-89.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-103.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.103",
          "PublicIP": "18.221.97.89",
          "Role": "node3",
          "Id": "i-0c8775e59efa594f0"
        },
        {
          "PublicName": "ec2-18-219-9-46.us-east-2.compute.amazonaws.com",
          "PrivateName": "ip-10-0-0-104.us-east-2.compute.internal",
          "PrivateIP": "10.0.0.104",
          "PublicIP": "18.219.9.46",
          "Role": "node4",
          "Id": "i-0fbaf0835fa6d7624"
        }
      ],
      "VPC": "vpc-68dd7000",
      "SubnetMask": "10.0.0.0/24",
      "Id": "8",
      "LoadBalancer": "No Load Balancer/No Ops Manager instances"
    }
  ]
}
```







