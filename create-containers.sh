#!/bin/bash

# the default node number is 4
# 3 slaves and 1 master node
N=${1:-4}


# deleting containers [risky to uncomment!]
# sudo docker rm -f hadoop-master &> /dev/null

# Create hadoop master container
echo "Creating hadoop-master container..."
sudo docker run -itd \
                --net=hadoop \
                -p 50070:50070 \
                -p 8088:8088 \
                --name hadoop-master \
                --hostname hadoop-master \
                kiwenlau/hadoop:1.0 &> /dev/null


# Create hadoop slave containers
i=1
while [ $i -lt $N ]
do
	# deleting containers [risky to uncomment!]
	# sudo docker rm -f hadoop-slave$i &> /dev/null
	echo "Creating hadoop-slave$i container..."
	sudo docker run -itd \
	                --net=hadoop \
	                --name hadoop-slave$i \
	                --hostname hadoop-slave$i \
	                kiwenlau/hadoop:1.0 &> /dev/null
	i=$(( $i + 1 ))
done 

# get into hadoop master container
# sudo docker exec -it hadoop-master bash
