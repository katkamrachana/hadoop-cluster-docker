#!/bin/bash

# test the hadoop cluster by running wordcount

# uncomment following line:
# hadoop fs -mkdir -p input # create input directory on HDFS

# ignore the error message when put is executed more than once
hdfs dfs -put ./input/* input # put input files to HDFS

# run wordcount 
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/sources/hadoop-mapreduce-examples-2.7.2-sources.jar org.apache.hadoop.examples.WordCount input output

# print the input files
echo -e "\ninput file1.txt:"
hdfs dfs -cat input/file1.txt

echo -e "\ninput file2.txt:"
hdfs dfs -cat input/file2.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000

