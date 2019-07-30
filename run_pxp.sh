#!/bin/bash
#
#
#
# Binario de PLP
#

./run_plp_old.sh

cd ~

#Archivos base para generar carga a Cloudera
cd $3/$2/$1/

files="plpcen.csv plpbar.csv plplin.csv indhor.csv etapas.csv ordhid.csv"

zip $1.zip plpcen.csv plpbar.csv plplin.csv indhor.csv etapas.csv ordhid.csv

rm plpbar.csv plpcen.csv plplin.csv plpemb.csv plpser.csv

cd ~

#Crear carpeta en servidor del cluster (quilleco)
ssh $USER@quilleco.colbunsa.cl "mkdir -p $3/$2/$1"

#Mueve archivos a servidor Quilleco (cluster)

	
scp  $3/$2/$1/$1.zip $USER@quilleco.colbunsa.cl:$3/$2/$1

ssh $USER@quilleco.colbunsa.cl "cd $3/$2/$1/ && unzip -o $1.zip && rm $1.zip"

cd ~

#Sube archivos a hadoop
ssh $USER@quilleco.colbunsa.cl "hadoop fs -mkdir -p $3/$2/$1 &&\
hdfs dfs -put -f /home/$USER/$3/$2/$1/* $3/$2/$1 && \
spark2-submit plp_upload.py $1 $3 $2 $4 && \
rm -rf $3/$2/$1"

#hdfs dfs rm -rf $3/$2/$1 "
