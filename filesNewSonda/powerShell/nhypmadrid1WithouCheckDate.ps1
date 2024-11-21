# Ruta del archivo
$filePath = "C:\Users\jbello5\GitHub_Albardiaz\SondaMax\filesNewSonda\jsonScripts\nhypmadrid.json"

# Obtener la fecha de modificación del archivo
$fileInfo = Get-Item $filePath
$lastModified = $fileInfo.LastWriteTime

# Obtener la fecha y hora actual
$currentTime = Get-Date

# Calcular la diferencia en minutos
$timeDifference = ($currentTime - $lastModified).TotalMinutes

$jsonContent = Get-Content -Path $filePath -Encoding UTF8 | ConvertFrom-Json
# Change the date format
foreach ($item in $jsonContent) {           
    #$item.resultDate
    $item.resultDate = $item.resultDate -replace "\u00A0", " " 
    if ($item.resultDate.Contains("a. m.")) {
        $item.resultDate = $item.resultDate -replace "a. m.", "AM"
    }
    elseif ($item.resultDate.Contains("p. m.")) {
        $item.resultDate = $item.resultDate -replace "p. m.", "PM"
    }  
    #$item.resultDate
}
$jsonObject = $jsonContent | ConvertTo-Json
$jsonObject