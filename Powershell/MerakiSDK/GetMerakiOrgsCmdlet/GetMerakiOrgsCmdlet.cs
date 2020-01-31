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
    [Cmdlet(VerbsCommon.Get, "merakiorgs")]
    [OutputType(typeof(MerakiOrg))]
    public class GetMerakiOrgsCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string Token { get; set; }

        [Parameter(
            Position = 1,
            ValueFromPipelineByPropertyName = true)]
        public string name { get; set; }

        private static readonly HttpClient client = new HttpClient();

        private static async Task<IList<MerakiOrg>> GetOrgs(string Token)
        {
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);

            var streamTask = client.GetStreamAsync("https://dashboard.meraki.com/api/v0/organizations");
            
            return await JsonSerializer.DeserializeAsync<IList<MerakiOrg>>(await streamTask);
        }

        private static  IList<MerakiOrg> ProcessRecordAsync(string Token)
        {
            var task = GetOrgs(Token);
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
            var list = ProcessRecordAsync(Token);
            
            WriteObject(list,true);


            WriteVerbose("Exiting foreach");
        }

        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    } // end Get-MerakiOrgs
    [Cmdlet(VerbsCommon.Get, "merakinets")]
    [OutputType(typeof(MerakiNet))]
    public class GetMerakiNetsCommand : PSCmdlet
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
        public string orgid { get; set; }

        private static readonly HttpClient client = new HttpClient();

        // This method creates the API call and returns a Task object that can be waited on
        private static async Task<IList<MerakiNet>> GetNets(string Token, string orgid)
        {
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);
            
            var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/organizations/{orgid}/networks");
            
            return await JsonSerializer.DeserializeAsync<IList<MerakiNet>>(await streamTask);
            
        }
        //This method calls GetNets and waits on the result. It then returns the List of MerakiNet objects
        private static  IList<MerakiNet> ProcessRecordAsync(string Token, string orgid)
        {
            var task = GetNets(Token, orgid);
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
            var list = ProcessRecordAsync(Token, orgid);
            
            WriteObject(list,true);


            WriteVerbose("Exiting foreach");
        }

        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    } //end Get-MerakiNets

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

        private static readonly HttpClient client = new HttpClient();

        // This method creates the API call and returns a Task object that can be waited on
        private static async Task<IList<MerakiDevice>> GetDevs(string Token, string netid)
        {
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);
            
            var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/networks/{netid}/devices");
            
            return await JsonSerializer.DeserializeAsync<IList<MerakiDevice>>(await streamTask);
            
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
    } // end Get-MerakiDevices

    public class MerakiNet
    {
        public bool disableMyMerakiCom { get; set; }
        public bool disableRemoteStatusPage { get; set; }
        public string id { get; set; }
        public string name { get; set; }
        public string organizationId { get; set; }
        public string[] tags { get; set; }
        public string timeZone { get; set; }
        public string type { get; set; }
    }

    public class MerakiOrg
    {
        public string id { get; set; }
        public string name { get; set; }
        public string url { get; set; }
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
}//end Namespace
