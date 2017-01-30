import pytest
import requests

DEVICES_URL = "http://localhost/devices"
AUTH=None
DEVICE=None

def test_create_auth():
    global AUTH
    ret = requests.post(DEVICES_URL)
    ret = ret.json()
    AUTH = (ret["uuid"], ret["token"])


def test_device_create():
    global DEVICE
    ret = requests.post(DEVICES_URL, json={ "test_key": "test_value" })
    ret = ret.json()
    assert ret["test_key"] == "test_value"
    DEVICE = ret


def test_device_delete():
    ret = requests.delete(DEVICES_URL+"/"+DEVICE["uuid"], auth=AUTH)
    ret = ret.json()
    assert ret["uuid"] == DEVICE["uuid"]


def test_delete_auth():
    global DEVICE
    DEVICE = { "uuid": AUTH[0] }
    test_device_delete()
