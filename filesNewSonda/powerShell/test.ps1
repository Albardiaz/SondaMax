$value = "2024-11-20 04:27:04 p. m."

# Replace "a. m." with "AM" and "p. m." with "PM"
if ($value.Contains("p. m.")) {
    $value = $value -replace "p. m.", "PM"
    Write-Output "Change to PM"
}
elseif ($value.Contains("a. m.")) {
    $value = $value -replace "a. a.", "AM"
    Write-Output "Change to AM"
}

Write-Output "Updated value: $value"