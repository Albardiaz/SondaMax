# Ruta del archivo
$filePath = "C:\Karate\karate-robot\target\karate-reports\ebsapl.json"

# Obtener la fecha de modificación del archivo
$fileInfo = Get-Item $filePath
$lastModified = $fileInfo.LastWriteTime

# Obtener la fecha y hora actual
$currentTime = Get-Date

# Calcular la diferencia en minutos
$timeDifference = ($currentTime - $lastModified).TotalMinutes

# Verificar si la diferencia es menor o igual a 20 minutos
if ($timeDifference -le 20) {
    $jsonContent = Get-Content -Path $filePath -Encoding UTF8 | ConvertFrom-Json
    # Change the date format
    foreach ($item in $jsonContent) {           
        #$item.resultDate
        $item.resultDate = $item.resultDate -replace "\u00A0", " "    
        #$item.resultDate
        if ($item.resultDate.Contains("a. m.")) {
            $item.resultDate = $item.resultDate -replace "a. m.", "AM"
        }
        elseif ($item.resultDate.Contains("p. m.")) {
            $item.resultDate = $item.resultDate -replace "p. m.", "PM"
        }  
    }
    $jsonObject = $jsonContent | ConvertTo-Json
    $jsonObject
}
else {
    # Imprimir un mensaje de que el archivo no ha sido modificado recientemente
    Write-Output "{}"  # Devuelve un JSON vacío para que Telegraf no falle
}