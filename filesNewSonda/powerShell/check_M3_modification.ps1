# Ruta del archivo
$filePath = "C:\M360\Power Automate\PowerAutomate_Aplicacion_M3.json"

# Obtener la fecha de modificación del archivo
$fileInfo = Get-Item $filePath
$lastModified = $fileInfo.LastWriteTime

# Obtener la fecha y hora actual
$currentTime = Get-Date

# Calcular la diferencia en minutos
$timeDifference = ($currentTime - $lastModified).TotalMinutes

# Verificar si la diferencia es menor o igual a 20 minutos
if ($timeDifference -le 20) {
    # Leer y imprimir el contenido del archivo
    Get-Content $filePath
} else {
    # Imprimir un mensaje de que el archivo no ha sido modificado recientemente
    Write-Output "{}"  # Devuelve un JSON vacío para que Telegraf no falle
}