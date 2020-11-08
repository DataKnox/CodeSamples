from nornir import InitNornir
from nornir_scrapli.tasks import netconf_get
from nornir_utils.plugins.functions import print_result
import xmltodict
import os
import logging

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")


ospf_xpath = '//ospf-neighbor/state'


def ospf_nbr_state(task):
    result = task.run(task=netconf_get, filter_type='xpath',
                      filter_=ospf_xpath, severity_level=logging.DEBUG)
    return result.result


results = nr.run(task=ospf_nbr_state)
print_result(results)
