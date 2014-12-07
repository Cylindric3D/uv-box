$executingScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

$net_file_1 = "Electronics\controller\controller.net"
$net_file_2 = "Electronics\led_panels\led_panels.net"
$net_file_3 = "Electronics\digit_board\digit_board.net"
$bom_File = "bom.csv"

$bom_file = Join-Path $executingScriptDirectory $bom_file
$net_file_1 = Join-Path $executingScriptDirectory $net_file_1
$net_file_2 = Join-Path $executingScriptDirectory $net_file_2
$net_file_3 = Join-Path $executingScriptDirectory $net_file_3

Function ParseNetFile($netfile, $bomfile)
{
	$reader = [System.IO.File]::OpenText($netfile)
	try {
		$ref = ""
		$value = ""
		$footprint = ""
		$source = ""
		
		for(;;) {
			$line = $reader.ReadLine()
			if ($line -eq $null) { break }

			# process the line
			$line = $line.Trim()
			$line = $line.Replace("/", "\")
			
			# Detect a filename
			if($line.StartsWith("(source "))
			{
				$start = $line.LastIndexOf("\")+1
				$end = $line.LastIndexOf(".")
				$source = $line.Substring($start, $end-$start)
			}

			# Detect a Component Start
			if($line.StartsWith("(comp (ref "))
			{
				# Print out the previous part, as this means we're starting a new part
				if([string]::IsNullOrEmpty($ref) -eq $FALSE)
				{
					"SOURCE $source, REF $ref, VALUE $value, FOOTPRINT $footprint"
					"""$source"",""$ref"",""$value"",""$footprint""," | Out-File -Encoding UTF8 -FilePath $bomfile -Append
					# Reset for the next item
					$ref = ""
					$value = ""
					$footprint = ""
				}
				$start = $line.IndexOf("ref ")+4
				$end = $line.IndexOf(")", $start)
				$ref = $line.Substring($start, $end-$start)
			}
			
			# Detect a Value
			if($line.StartsWith("(value "))
			{
				$start = $line.IndexOf(" ")+1
				$end = $line.IndexOf(")", $start)
				$value = $line.Substring($start, $end-$start)
			}
			
			# Detect a Footprint
			if($line.StartsWith("(footprint "))
			{
				$start = $line.IndexOf(" ")+1
				$end = $line.IndexOf(")", $start)
				$footprint = $line.Substring($start, $end-$start)
			}
		}
		
		# Print the last item
		if([string]::IsNullOrEmpty($ref) -eq $FALSE)
		{
			"SOURCE $source, REF $ref, VALUE $value, FOOTPRINT $footprint"
			"""$source"",""$ref"",""$value"",""$footprint""," | Out-File -Encoding UTF8 -FilePath $bomfile -Append
		}

	}
	finally {
		$reader.Close()
	}
}


"source,ref,value,footprint," | Out-File -Encoding UTF8 -FilePath $bom_file -Force

ParseNetFile $net_file_1 $bom_file
ParseNetFile $net_file_2 $bom_file
ParseNetFile $net_file_3 $bom_file
