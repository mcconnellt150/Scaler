if (-not (Test-Path "C:\Program Files\WindowsPowerShell\Modules\OctopusDSC")) {
    mkdir c:\temp -ErrorAction SilentlyContinue | Out-Null
    $client = new-object system.Net.Webclient
    $client.DownloadFile("https://codeload.github.com/OctopusDeploy/OctopusDSC/zip/master","c:\temp\octopusdsc.zip")
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    [System.IO.Compression.ZipFile]::ExtractToDirectory("c:\temp\octopusdsc.zip", "c:\temp")
    cp -Recurse C:\temp\OctopusDSC-master\OctopusDSC "C:\Program Files\WindowsPowerShell\Modules\OctopusDSC"
}
