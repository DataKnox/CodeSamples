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
    //[OutputType(typeof(MerakiOrg))]
    public class GetMerakiOrgsCommand : PSCmdlet
    {
        [Parameter(
            Mandatory = true,
            Position = 0,
            ValueFromPipeline = true,
            ValueFromPipelineByPropertyName = true)]
        public string Token { get; set; }

        private static async Task<IList<MerakiOrg>> GetOrgs(string Token)
        {
            using HttpClient client = new HttpClient();
            //Cmdlet.WriteVerbose("Setting HTTP headers");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);
            //Cmdlet.WriteVerbose("Making HTTP GET");
            var streamTask = client.GetStreamAsync("https://dashboard.meraki.com/api/v0/organizations");
            //Cmdlet.WriteVerbose("Awaiting JSON deserialization");
            return await JsonSerializer.DeserializeAsync<IList<MerakiOrg>>(await streamTask);
            client.Dispose();
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
    }


    public class MerakiOrg
    {
        public string id { get; set; }
        public string name { get; set; }
        public string url { get; set; }
    }


}
