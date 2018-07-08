#!/bin/bash
IMAGELIST=`docker images --format "{{.Repository}}:{{.Tag}}"`
for IMAGE in $IMAGELIST
do
   FILENAME=`echo $IMAGE | grep -o -E "[a-z0-9-]*?:.*?$" | sed "s/:/-/g"`
   echo "Dumping image '$IMAGE' into '$FILENAME.tar.gz'"
   docker save -o "$FILENAME.tar" $IMAGE
   gzip "$FILENAME.tar"
done
