import pytest
import requests

def test_meshblu_is_alive(url):
    ret = url.get("http://localhost/status", max_retries=10, sleep_time=2)
    assert ret["meshblu"] == "online"
