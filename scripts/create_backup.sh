#!/bin/sh -e

S3_STORAGE_CLASS=${S3_STORAGE_CLASS:-STANDARD}
FILE_NAME=/tmp/$BACKUP_NAME-`date "+%Y-%m-%d_%H-%M-%S"`.tar.gz

if [[ -z ${TARGET} ]];
then
    TARGET=/data
    echo "Warning: The targeted directory isn't set and is now set to the default: ${TARGET}"
fi

if [ -z "${S3_ENDPOINT_URL}" ]; then
  AWS_ARGS=""
else
  AWS_ARGS="--endpoint-url ${S3_ENDPOINT_URL}"
fi

echo "Info: Start compression of the targeted folder: ${TARGET}"
tar -zcvf $FILE_NAME $TARGET
echo "Info: Start file upload to the S3 storage as: ${FILE_NAME} (${S3_STORAGE_CLASS})"
aws s3 $AWS_ARGS cp --storage-class $S3_STORAGE_CLASS $FILE_NAME $S3_BUCKET_URL
echo "Info: File upload completed, deleting the uploaded file from filesystem"
rm $FILE_NAME
echo "Info: Backup done"