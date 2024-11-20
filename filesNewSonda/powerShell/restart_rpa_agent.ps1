# Detener el agente RPA de Power Automate
Stop-Process -Name "microsoft.flow.rpa.agent" -Force

# Esperar unos segundos
Start-Sleep -Seconds 10

# Iniciar el agente nuevamente (asegúrate de poner la ruta correcta)
Start-Process "C:\Program Files (x86)\Power Automate Desktop\Microsoft.Flow.RPA.Agent.exe"