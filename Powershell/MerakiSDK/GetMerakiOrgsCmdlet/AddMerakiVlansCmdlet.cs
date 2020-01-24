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
    [Cmdlet(VerbsCommon.Add, "merakivlans")]
    [OutputType(typeof(CreateMerakiVlan))]
    public class AddMerakiVlansCommand : PSCmdlet
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

        [Parameter(
            Mandatory = true,
            Position = 2,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string name { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 3,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string vlanid { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 4,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string subnet { get; set; }

        [Parameter(
            Mandatory = true,
            Position = 5,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string applianceIp { get; set; }

        private static readonly HttpClient client = new HttpClient();

        private static async Task<string> AddVlans(string Token, string netid, CreateMerakiVlan vlan)
        {
            string jsonString;
            string uri;
            uri = $"https://dashboard.meraki.com/api/v0/networks/{netid}/vlans";
            jsonString=JsonSerializer.Serialize<CreateMerakiVlan>(vlan);
            var content = new StringContent(jsonString);
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);

            var response = await client.PostAsync(uri,content);
            var contents = await response.Content.ReadAsStringAsync();
            return contents;
        }

        private static string ProcessRecordAsync(string Token, string netid, CreateMerakiVlan vlan)
        {
            var task = AddVlans(Token, netid, vlan);
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
            CreateMerakiVlan vlan = new CreateMerakiVlan();
            vlan.name = name;
            vlan.id = vlanid;
            vlan.applianceIp = applianceIp;
            vlan.subnet = subnet;
            WriteVerbose("Entering Get Orgs call");
            var list = ProcessRecordAsync(Token, netid, vlan);
            CreateMerakiVlan result = JsonSerializer.Deserialize<CreateMerakiVlan>(list);
            WriteObject(result,true);


            WriteVerbose("Exiting foreach");
        }


        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }

    public class CreateMerakiVlan
    {
        public string name {get; set;}
        public string applianceIp {get; set;}
        public string subnet {get; set;}
        public string id {get; set;}
    }
}