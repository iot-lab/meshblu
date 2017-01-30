import pytest

import requests
import collections
import time

@pytest.fixture
def url():
    obj = {
        "get": _retry_able(url_get),
        "post": url_post,
        "delete": url_delete,
    }
    return collections.namedtuple("url", obj.keys())(**obj)

def url_get(url, **kwargs):
    return _call(requests.get, url, **kwargs)

def url_post(url, **kwargs):
    return _call(requests.post, url, **kwargs)

def url_delete(url, **kwargs):
    return _call(requests.delete, url, **kwargs)

def _call(func, url, **kwargs):
    ret = func(url, **kwargs)
    ret.raise_for_status()
    return ret.json()

def _retry_able(func):
    return lambda url, **kwargs: _retry(
        func=lambda **_kwargs: func(url=url, **_kwargs), **kwargs)

def _retry(func, max_retries=0, sleep_time=1, **kwargs):
    nb_retries = 0
    while True:
        try:
            return func(**kwargs)
        except Exception:
            assert nb_retries < max_retries
            nb_retries += 1
            time.sleep(sleep_time)
