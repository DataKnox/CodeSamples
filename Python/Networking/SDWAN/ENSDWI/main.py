import requests
import json
from datetime import datetime
from ensdwiauth import getAuth
from ensdwidevices import getDevices
from ensdwievents import getEvents
from ensdwicontrolconn import getControlConnections
from ensdwitunnelstats import getTunnelStats
from datetimehandler import epochHandler, epochFormatter, epochTableFormatter
from prettytable import PrettyTable
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

base_url = "https://192.168.1.107/"

if __name__ == "__main__":
    # Get Authenticated
    sesh = getAuth(base_url, 'admin', 'admin')

    # Get device data
    devices = getDevices(base_url, sesh)

    # set up table
    deviceTable = PrettyTable(['Hostname', 'Site', 'Sys-ID', 'Status'])

    # retrieve each device's details
    for device in devices['data']:
        deviceTable.add_row([device['host-name'], device['site-id'],
                             device['system-ip'], device['status']])
    print(deviceTable)

    # Get events in the last 24 hours
    events = getEvents(base_url, sesh)
    eventTable = PrettyTable(
        ['Hostname', 'Event', 'Sys-ID', 'Component', 'Severity', 'EventTime'])
    for event in events['data']:
        datediff = epochHandler(event['entry_time'])
        if datediff < 24:
            entrytime = epochTableFormatter(event['entry_time'])
            eventTable.add_row([event['host_name'], event['eventname'],
                                event['vmanage_system_ip'], event['component'], event['severity_level'], entrytime])
    print(eventTable)

    # Get Device Control Connections
    device_id = '7.7.7.10'
    ControlConnections = getControlConnections(base_url, sesh, device_id)

    controlTable = PrettyTable(
        ['Hostname', 'System-IP', 'Site', 'Peer', 'Color', 'Protocol', 'Uptime'])
    for control in ControlConnections['data']:
        controlTable.add_row([control['vdevice-host-name'], control['system-ip'], control['site-id'],
                              control['peer-type'], control['local-color'], control['protocol'], control['uptime']])
    print(controlTable)

    # Get Device tunnel statistics
    device_id = '7.7.7.10'
    tunnelStats = getTunnelStats(base_url, sesh, device_id)
    tunnelTable = PrettyTable(['Hostname', 'Source Color', 'Remote Color',
                               'Source IP', 'Dest IP', 'Tx Packets', 'Rx Packets'])
    for stat in tunnelStats['data']:
        tunnelTable.add_row([stat['vdevice-host-name'], stat['local-color'], stat['remote-color'],
                             stat['source-ip'], stat['dest-ip'], stat['tx_pkts'], stat['rx_pkts']])

    print(tunnelTable)
