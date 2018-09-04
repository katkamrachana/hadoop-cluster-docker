## Run Hadoop Cluster within Docker Containers

- Ref. Blog: [Run Hadoop Cluster in Docker Update](http://kiwenlau.com/2016/06/26/hadoop-cluster-docker-update-english/)

![alt tag](https://raw.githubusercontent.com/kiwenlau/hadoop-cluster-docker/master/hadoop-cluster-docker.png)


### 4 Nodes Hadoop Cluster

##### 1. Pull docker image [ubuntu 14.04]

```
sudo docker pull kiwenlau/hadoop:1.0
```

##### 2. Clone github repository

```
https://github.com/katkamrachana/hadoop-cluster-docker.git
```

##### 3. Create hadoop network

```
sudo docker network create --driver=bridge hadoop
```

##### 4. Create containers

```
cd hadoop-cluster-docker
sudo ./start-container.sh
```

**output:**

```
start hadoop-master container...
start hadoop-slave1 container...
start hadoop-slave2 container...
start hadoop-slave3 container...
root@hadoop-master:~# 
```

- start 4 containers with 1 master and 3 slaves
- you will get into the /root directory of hadoop-master container

##### 5. Start hadoop

```
./start-hadoop.sh
```

##### 6. Run wordcount example

```
./run-wordcount.sh
```

**output**

```
input file1.txt:
Hello Hadoop

input file2.txt:
Hello Docker

wordcount output:
Docker    1
Hadoop    1
Hello    2
```
