import pytest
import requests
import json

base_url = "http://localhost:5000"
router_url = "/routers"
good_query = "/routers?hostname=SW1"
good_query_unk = "/routers?hostname=R1"
bad_query = "/routers?hostname="

headers = {"Accept": "application/json", "Content-Type": "application/json"}
post_del_payload_good = {"hostname": "R1", "ipaddr": "10.10.10.199"}
post_del_payload_bad = {"hotname": "R1", "ipaddr": "10.10.10.199"}


def test_succeed():
    response = requests.get(url=f"{base_url}{good_query}", verify=False)
    assert response.status_code == 200
    assert '"hostname":"SW1"' in response.text


def test_succeed_unk():
    response = requests.get(url=f"{base_url}{good_query_unk}", verify=False)
    assert response.status_code == 200
    assert '"response":"No match"' in response.text


def test_succeed_fail():
    response = requests.get(url=f"{base_url}{bad_query}", verify=False)
    assert response.status_code == 400


def test_post_succeed():
    response = requests.post(url=f"{base_url}{router_url}", data=json.dumps(
        post_del_payload_good), headers=headers, verify=False)
    assert response.status_code == 201


def test_post_fail():
    response = requests.post(url=f"{base_url}{router_url}", data=json.dumps(
        post_del_payload_bad), headers=headers, verify=False)
    assert response.status_code == 500


def test_del_good():
    response = requests.delete(url=f"{base_url}{router_url}", data=json.dumps(
        post_del_payload_good), headers=headers, verify=False)
    assert response.status_code == 204


def test_del_fail():
    response = requests.delete(url=f"{base_url}{router_url}", data=json.dumps(
        post_del_payload_bad), headers=headers, verify=False)
    assert response.status_code == 500


if __name__ == "__main__":
    test_post_succeed()
    test_succeed()
    test_succeed_unk()
    test_succeed_fail()
    test_post_fail()
    test_del_good()
    test_del_fail()
