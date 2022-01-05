function myfunc {

  <#
     
        .SYNOPSIS
        [Insert a short description of what the function is supposed to do]
        
        .DESCRIPTION
        [Insert a longer description of what the function is supposed to do]
        
        .PARAMETER myint
        [Insert a short description of this parameter]
      
        .EXAMPLE
        myfunc 1
        myfunc -myint 1
      
  #>

  [CmdletBinding()]
  param (
    [Parameter(Mandatory=$false)]
    [int] $myint
  )

  return $myint
}

myfunc 1
