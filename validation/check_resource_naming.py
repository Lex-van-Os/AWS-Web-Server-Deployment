import boto3
from botocore.exceptions import ClientError

# This script doesn't work properly / is not efficient
# Code is kept, because this code is to be refactored later into necessary boto3 client functionality

# def check_resource_name(resource_type, resource_name):
#     print("checking resource name")
#     s3 = boto3.resource('s3')

#     for bucket in s3.buckets.all():
#         print(bucket.name)

# if __name__ == "__main__":
#     check_resource_name("foo", "bar")
# if __name__ == "__main__":
#     import sys
#     if len(sys.argv) != 2:
#         print("Usage: python check_bucket.py <bucket_name>")
#         sys.exit(1)

#     bucket_name = sys.argv[1]
#     if check_bucket_name(bucket_name):
#         sys.exit(0)
#     else:
#         sys.exit(1)
