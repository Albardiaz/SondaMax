# Ruta del archivo
$filePath = "C:\Users\jbello5\GitHub_Albardiaz\SondaMax\filesNewSonda\jsonScripts\nhypmadrid.json"

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
    }
    $jsonObject = $jsonContent | ConvertTo-Json
    $jsonObject
}
else {
    # Imprimir un mensaje de que el archivo no ha sido modificado recientemente
    Write-Output "{}"  # Devuelve un JSON vacío para que Telegraf no falle
}