// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Commands.Common.Compute.Version_2018_04.Models
{
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// LogAnalytics output properties
    /// </summary>
    public partial class LogAnalyticsOutput
    {
        /// <summary>
        /// Initializes a new instance of the LogAnalyticsOutput class.
        /// </summary>
        public LogAnalyticsOutput()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the LogAnalyticsOutput class.
        /// </summary>
        /// <param name="output">Output file Uri path to blob
        /// container.</param>
        public LogAnalyticsOutput(string output = default(string))
        {
            Output = output;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets output file Uri path to blob container.
        /// </summary>
        [JsonProperty(PropertyName = "output")]
        public string Output { get; private set; }

    }
}
