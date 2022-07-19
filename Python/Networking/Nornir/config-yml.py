import yaml
import json
config = """{
    "configuration" : {
        "@" : {
            "junos:commit-seconds" : "1607135259", 
            "junos:commit-localtime" : "2020-12-05 02:27:39 UTC", 
            "junos:commit-user" : "knox"
        }, 
        "version" : "18.2R1.9", 
        "system" : {
            "login" : {
                "user" : [
                {
                    "name" : "knox", 
                    "uid" : 2000, 
                    "class" : "super-user", 
                    "authentication" : {
                        "encrypted-password" : "$6$mbj/V6a1$jJzXiF3olsgBnN8Q.CZ/L4Ed.8HuIfWDJGb/yOX9EZbC.oEWDzkczMSZspUnbnn.MuHm4vBIdhWYi5oOgjcvo/"
                    }
                }
                ]
            }, 
            "root-authentication" : {
                "encrypted-password" : "$6$CxoYn6T0$KZs13hZZSa1XExKJIP4TLAjTG1/U5Utua3qQakgYXtiq5RRnzlkJ5P21uu5t8vj8h4eDTNkrLzKlfRbVE0RmI0"
            }, 
            "host-name" : "vMX7", 
            "domain-name" : "abc.co", 
            "services" : {
                "ssh" : [null], 
                "netconf" : {
                    "ssh" : [null]
                }
            }, 
            "syslog" : {
                "user" : [
                {
                    "name" : "*", 
                    "contents" : [
                    {
                        "name" : "any", 
                        "emergency" : [null]
                    }
                    ]
                }
                ], 
                "file" : [              
                {
                    "name" : "messages", 
                    "contents" : [
                    {
                        "name" : "any", 
                        "notice" : [null]
                    }, 
                    {
                        "name" : "authorization", 
                        "info" : [null]
                    }
                    ]
                }, 
                {
                    "name" : "interactive-commands", 
                    "contents" : [
                    {
                        "name" : "interactive-commands", 
                        "any" : [null]
                    }
                    ]
                }
                ]                       
            }, 
            "processes" : {
                "dhcp-service" : {
                    "traceoptions" : {
                        "file" : {
                            "filename" : "dhcp_logfile", 
                            "size" : "10m"
                        }, 
                        "level" : "all", 
                        "flag" : [
                        {
                            "name" : "packet"
                        }
                        ]
                    }
                }
            }
        }, 
        "interfaces" : {
            "interface" : [
            {
                "name" : "ge-0/0/1", 
                "unit" : [              
                {
                    "name" : 0, 
                    "family" : {
                        "inet" : {
                            "address" : [
                            {
                                "name" : "172.16.57.7/24"
                            }
                            ]
                        }, 
                        "iso" : [null]
                    }
                }
                ]
            }, 
            {
                "name" : "ge-0/0/2", 
                "unit" : [
                {
                    "name" : 0, 
                    "family" : {
                        "inet" : {
                            "address" : [
                            {
                                "name" : "172.16.7.1/24"
                            }
                            ]
                        }, 
                        "iso" : [null]
                    }
                }
                ]
            }, 
            {
                "name" : "ge-0/0/3", 
                "unit" : [
                {
                    "name" : 0, 
                    "family" : {
                        "iso" : [null]
                    }
                }
                ]
            }, 
            {
                "name" : "ge-0/0/9",    
                "unit" : [
                {
                    "name" : 0, 
                    "family" : {
                        "inet" : {
                            "address" : [
                            {
                                "name" : "172.27.72.1/30"
                            }
                            ]
                        }
                    }
                }
                ]
            }, 
            {
                "name" : "fxp0", 
                "unit" : [
                {
                    "name" : 0, 
                    "family" : {
                        "inet" : {
                            "dhcp" : {  
                                "vendor-id" : "Juniper-vmx-VM5FBEB11C2E"
                            }
                        }
                    }
                }
                ]
            }, 
            {
                "name" : "lo0", 
                "unit" : [
                {
                    "name" : 0, 
                    "family" : {
                        "inet" : {
                            "address" : [
                            {
                                "name" : "7.7.7.7/32"
                            }
                            ]
                        }, 
                        "iso" : {
                            "address" : [
                            {           
                                "name" : "49.0001.0000.0000.0004.00"
                            }
                            ]
                        }
                    }
                }
                ]
            }
            ]
        }, 
        "routing-options" : {
            "aggregate" : {
                "route" : [
                {
                    "name" : "172.16.0.0/16"
                }
                ]
            }, 
            "router-id" : "7.7.7.7", 
            "autonomous-system" : {
                "as-number" : "100"
            }
        },                              
        "protocols" : {
            "bgp" : {
                "group" : [
                {
                    "name" : "ext-200", 
                    "type" : "external", 
                    "export" : ["send_agg"],
                    "neighbor" : [
                    {
                        "name" : "172.27.72.2", 
                        "peer-as" : "200"
                    }
                    ]
                }, 
                {
                    "name" : "int-100", 
                    "type" : "internal", 
                    "local-address" : "7.7.7.7", 
                    "neighbor" : [
                    {
                        "name" : "5.5.5.5", 
                        "peer-as" : "100"
                    }                   
                    ]
                }
                ]
            }, 
            "isis" : {
                "interface" : [
                {
                    "name" : "ge-0/0/1.0", 
                    "level" : [
                    {
                        "name" : 2, 
                        "disable" : [null]
                    }
                    ]
                }, 
                {
                    "name" : "ge-0/0/2.0", 
                    "level" : [
                    {
                        "name" : 2, 
                        "disable" : [null]
                    }
                    ]                   
                }, 
                {
                    "name" : "ge-0/0/3.0", 
                    "level" : [
                    {
                        "name" : 2, 
                        "disable" : [null]
                    }
                    ]
                }, 
                {
                    "name" : "ge-0/0/9.0", 
                    "passive" : [null], 
                    "level" : [
                    {
                        "name" : 2, 
                        "disable" : [null]
                    }
                    ]
                }, 
                {
                    "name" : "lo0.0"
                }                       
                ]
            }
        }, 
        "policy-options" : {
            "policy-statement" : [
            {
                "name" : "send_agg", 
                "term" : [
                {
                    "name" : "term_1", 
                    "from" : {
                        "protocol" : ["aggregate"]
                    }, 
                    "then" : {
                        "accept" : [null]
                    }
                }
                ]
            }
            ]
        }
    }
}                                       
"""
config_dict = json.loads(config)
print(yaml.dump(config_dict, allow_unicode=True, default_flow_style=False))
