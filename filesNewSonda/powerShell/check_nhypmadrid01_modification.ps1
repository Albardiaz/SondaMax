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
    # Step 1: Read the JSON file
    # Get-Content $filePath
    # $jsonContent = Get-Content -Path $filePath -Raw | ConvertFrom-Json
    $jsonContent = Get-Content $filePath
    # Step 2: Change the date format
    foreach ($item in $jsonContent) {
        $item
         #if ($item.resultDate -ne $null) {
            # Change the date format (example: from 'yyyy-MM-dd' to 'dd/MM/yyyy')
         #   $item.resultDate = [datetime]::Parse($item.resultDate).ToString("yyyy-MM-dd HH:mm:ss")
        }
    }
    # Step 3: Save the updated JSON back to the file
    $jsonContent | ConvertTo-Json -Depth 10
}
else {
    # Imprimir un mensaje de que el archivo no ha sido modificado recientemente
    Write-Output "{}"  # Devuelve un JSON vacío para que Telegraf no falle
}