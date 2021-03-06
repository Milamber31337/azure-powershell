<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

Microsoft.PowerShell.Core\Set-StrictMode -Version Latest

<#
.DESCRIPTION
   Get parameter values from the specified Azure resource identifier.

.PARAMETER  Id
    The unique resource identifier of the Azure Resource.

.PARAMETER  IdTemplate
    The unique resource identifier template of the Azure Resource.
#>
function Get-ArmResourceIdParameterValue {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $Id,

        [Parameter(Mandatory = $true)]
        [string]
        $IdTemplate
    )

    Write-Verbose -Message ("Resource Id value is '{0}'" -f $Id)
    Write-Debug -Message ("Resource IdTemplate is '{0}'" -f  $IdTemplate)
    
    $IdTokens = $Id.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
    $IdTemplateTokens = $IdTemplate.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
    
    if ($IdTokens.Count -ne $IdTemplateTokens.Count) {
        Write-Error -Message ("Invalid resource id '{0}'. Expected id template is '{1}'." -f $Id, $IdTemplate) -ErrorId 'InvalidResourceIdValue'
        return
    }
    
    $ResourceIdParameterValues = [ordered]@{}
    for ($i = 0; $i -lt $IdTemplateTokens.Count; $i++) {
        if ($IdTokens[$i] -ne $IdTemplateTokens[$i]) {
            if ($IdTemplateTokens[$i] -notmatch '^{.*}$') {
                Write-Error -Message ("Invalid resource id '{0}'. Expected id template is '{1}'." -f $Id, $IdTemplate) -ErrorId 'InvalidResourceIdValue'
                return
            }
    
            $ResourceIdParameterValues[$IdTemplateTokens[$i].Trim('{}')] = $IdTokens[$i]
        }
    }

    return $ResourceIdParameterValues
}
