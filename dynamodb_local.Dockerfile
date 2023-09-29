FROM amazon/dynamodb-local:2.0.0

WORKDIR /home/dynamodblocal

CMD ["-jar", "DynamoDBLocal.jar", "-sharedDb", "-dbPath", "./data"]
