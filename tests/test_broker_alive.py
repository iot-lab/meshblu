import pytest
import requests

def test_meshblu_is_alive():
    ret = requests.get("http://localhost/status")
    ret = ret.json()
    assert ret["meshblu"] == "online"
