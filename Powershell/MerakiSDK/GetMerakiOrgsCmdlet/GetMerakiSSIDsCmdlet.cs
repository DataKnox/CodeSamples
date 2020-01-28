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
    [Cmdlet(VerbsCommon.Get, "merakissids")]
    [OutputType(typeof(MerakiSSID))]
    public class GetMerakiSsidsCommand : PSCmdlet
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

        private static async Task<IList<MerakiSSID>> GetSsids(string Token, string netid)
        {
            using HttpClient client = new HttpClient();
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(
                new MediaTypeWithQualityHeaderValue("application/json"));
            client.DefaultRequestHeaders.Add("X-Cisco-Meraki-API-Key", Token);

            var streamTask = client.GetStreamAsync($"https://dashboard.meraki.com/api/v0/networks/{netid}/ssids");
            
            return await JsonSerializer.DeserializeAsync<IList<MerakiSSID>>(await streamTask);
        }

        private static  IList<MerakiSSID> ProcessRecordAsync(string Token, string netid)
        {
            var task = GetSsids(Token, netid);
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

    public class MerakiSSID
    {
        public int number {get; set;}
        public string name {get; set;}
        public bool enabled {get; set;}
        public string splashPage {get; set;}
        public bool ssidAdminAccessible {get; set;}
        public string authMode {get; set;}
        public string encryptionMode {get; set;}
        public string wpaEncryptionMode {get; set;}
        public string radiusAccountingEnabled {get; set;}
        public bool radiusEnabled {get; set;}
        public string radiusAttributeForGroupPolicies {get; set;}
        public string radiusFailoverPolicy {get; set;}
        public string radiusLoadBalancingPolicy {get; set;}
        public string ipAssignmentMode {get; set;}
        public string adminSplashUrl {get; set;}
        public string splashTimeout {get; set;}
        public bool walledGardenEnabled {get; set;}
        public string walledGardenRanges {get; set;}
        public int minBitrate {get; set;}
        public string bandSelection {get; set;}
        public int perClientBandwidthLimitUp {get; set;}
        public int perClientBandwidthLimitDown {get; set;}
    }
}