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
    [Cmdlet(VerbsCommon.Get, "MerakiInFWRules")]
    [OutputType(typeof(MerakiRules))]
    public class GetMerakiInFWRulesCommand : PSCmdlet
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

         private static async Task<MerakiRules> GetInFWRules(string Token, string netid)
        {
            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);

            var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/networks/{netid}/appliance/firewall/inboundFirewallRules");
            
            return await JsonSerializer.DeserializeAsync<MerakiRules>(await streamTask);
        }

        private static  MerakiRules ProcessRecordAsync(string Token, string netid)
        {
            var task = GetInFWRules(Token, netid);
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
            WriteVerbose("Entering Get Rules call");
            var list = ProcessRecordAsync(Token, netid);

            WriteObject(list.rules,true);
            
            WriteVerbose("Exiting foreach");
        }

        // // This method will be called once at the end of pipeline execution; if no input is received, this method is not called
        protected override void EndProcessing()
        {
            WriteVerbose("End!");
        }
    }
    public class Rule
    {
        public string comment {get; set;}
        public string policy {get; set;}
        public string protocol {get; set;}
        public string destPort {get; set;}
        public string destCidr {get; set;}
        public string srcPort {get; set;}
        public string srcCidr {get; set;}
        public bool syslogEnabled {get; set;}
    }
    public class MerakiRules
    {
        public Rule[] rules {get; set;}
        public string syslogDefaultRule {get; set;}
    }
}