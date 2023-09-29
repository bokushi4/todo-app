import os
import boto3
from boto3.dynamodb.conditions import Key


def _get_database():
    endpoint = os.environ.get("DB_ENDPOINT")
    if endpoint:
        return boto3.resource("dynamodb", endpoint_url=endpoint)
    else:
        return boto3.resource("dynamodb")


def get_all_todos():
    table = _get_database().Table(os.environ.get("DB_TABLE_NAME"))
    response = table.scan()
    return response["Items"] 


def get_todo(todo_id):
    table = _get_database().Table(os.environ.get("DB_TABLE_NAME"))
    response = table.query(
        KeyConditionExpression=Key("id").eq(todo_id)
    )
    items = response["Items"]

    return items[0] if items else None
