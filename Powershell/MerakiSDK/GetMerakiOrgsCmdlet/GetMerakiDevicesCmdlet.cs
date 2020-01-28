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
    [Cmdlet(VerbsCommon.Get, "merakidevices")]
    [OutputType(typeof(MerakiDevice))]
    public class GetMerakiDevsCommand : PSCmdlet
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
        public string netid { get; set; }

        // This method creates the API call and returns a Task object that can be waited on
        private static async Task<IList<MerakiDevice>> GetDevs(string Token, string netid)
        {
            using (HttpClient client = new HttpClient())
            {
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(
                    new MediaTypeWithQualityHeaderValue("application/json"));
                client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);
                
                var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/networks/{netid}/devices");
                
                return await JsonSerializer.DeserializeAsync<IList<MerakiDevice>>(await streamTask);
            }
            
        }
        //This method calls GetNets and waits on the result. It then returns the List of MerakiDevice objects
        private static  IList<MerakiDevice> ProcessRecordAsync(string Token, string netid)
        {
            var task = GetDevs(Token, netid);
            task.Wait();
            var result = task.Result;
            return result;
        }

        // This method gets called once for each cmdlet in the pipeline when the pipeline starts executing
        protected override void BeginProcessing()
        {
            WriteVerbose("Begin!");
            WriteVerbose(Token);
        }

        // This method will be called for each input received from the pipeline to this cmdlet; if no input is received, this method is not called
        protected override void ProcessRecord()
        {
            WriteVerbose("Entering Get Orgs call");
            var list = ProcessRecordAsync(Token, netid);
            
            WriteObject(list,true);


            WriteVerbose("Exiting foreach");
        }

        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
        public class MerakiDevice 
    {
        public string address { get; set; }
        public string firmware { get; set; }
        public string floorPlanId { get; set; }
        public string lanIp { get; set; }
        public double lat { get; set; }
        public double lng { get; set; }
        public string mac { get; set; }
        public string model { get; set; }
        public string networkId { get; set; }
        public string serial { get; set; }
        public string switchProfileId { get; set; }
    }
}