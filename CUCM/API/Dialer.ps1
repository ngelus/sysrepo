function CiscoDialApi {
  param (
  )
  [string] $input = read-host -prompt "Geben Sie bitte die IP Ihres Cisco Tel ein "
  [string] $uri = "http://${input}/CGI/Execute"
  [string] $target = read-host -prompt "Geben Sie bitte die Nummer an, die Sie anrufen wollen "
  
  [string] $xmlbody = @"
  <CiscoIPPhoneExecute>
    <ExecuteItem URL='Dial:${target}' />
  </CiscoIPPhoneExecute>
  "@
  
  write-host "Rufe die Nummer: ${target} an..."
  Invoke-WebRequest "${uri}" -Method Post -ContentType "text/xml" -Body $xmlbody
}

CiscoDialApi
