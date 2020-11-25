from nornir_pyez.plugins.tasks import pyez_config, pyez_facts
from nornir import InitNornir
from nornir_utils.plugins.functions import print_result
from nornir.core.filter import F
import os

script_dir = os.path.dirname(os.path.realpath(__file__))

nr = InitNornir(config_file=f"{script_dir}/config.yml")

junos_devices = nr.filter(F(platform="junos"))

xml_payload = """<configuration>
            <protocols>
                <ospf>
                    <area>
                        <name>0.0.0.0</name>
                        <interface operation="replace">
                            <name>ge-0/0/0.0</name>
                            <priority>200</priority>
                        </interface>
                    </area>
                </ospf>
            </protocols>
        </configuration>
"""

send_result = junos_devices.run(
    task=pyez_config, payload=xml_payload, data_format='xml', commit_now=True)
print_result(send_result)
