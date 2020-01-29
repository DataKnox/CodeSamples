using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
using System.Threading.Tasks;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text.Json;
using System.Collections.Generic;

namespace GetMerakiOrgsCmdlet
{
    [Cmdlet(VerbsCommon.Get, "merakideviceclients")]
    [OutputType(typeof(DeviceClient))]
    public class GetMerakiDeviceClientCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string Token { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 1,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string serial { get; set; }

        // This method creates the API call and returns a Task object that can be waited on
        private static async Task<IList<DeviceClient>> GetDevClients(string Token, string serial)
        {
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);
                
                var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/devices/{serial}/clients");
                
                return await JsonSerializer.DeserializeAsync<IList<DeviceClient>>(await streamTask);
            }
            
        }
        //This method calls GetNets and waits on the result. It then returns the List of MerakiDevice objects
        private static  IList<DeviceClient> ProcessRecordAsync(string Token, string serial)
        {
            var task = GetDevClients(Token, serial);
            task.Wait();
            var result = task.Result;
            return result;
        }

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            WriteVerbose("Begin!");
            WriteVerbose($"Token is {Token}");
            WriteVerbose($"serial is {serial}");
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            WriteVerbose("Entering Get Orgs call");
            
            var list = ProcessRecordAsync(Token, serial);
            
            WriteObject(list,true);


            WriteVerbose("Exiting foreach");
        }

        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
    public class Usage
    {
        public double sent { get; set; }
        public double recv { get; set; }
    }

    public class DeviceClient
    {
        public Usage usage { get; set; }
        public string id { get; set; }
        public string description { get; set; }
        public string mac { get; set; }
        public string ip { get; set; }
        public string user { get; set; }
        public int vlan { get; set; }
        public object switchport { get; set; }
        public string mdnsName { get; set; }
        public string dhcpHostname { get; set; }
    }
}