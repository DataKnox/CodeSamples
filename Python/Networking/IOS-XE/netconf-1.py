from ncclient import manager

# updated host address and port
router = {""host": "sandbox-iosxe-latest-1.cisco.com", "port": "830",
          "username": "developer", "password": "C1sco12345"}

# added new arguments to eliminate 'ncclient.transport.errors.AuthenticationError: SSHException('No existing session')' error.
with manager.connect(host=router["host"], port=router["port"], username=router["username"], password=router["password"], hostkey_verify=False, allow_agent=False, look_for_keys=False) as m:
    m.close_session()
