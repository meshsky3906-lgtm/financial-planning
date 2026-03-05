Add-Type -AssemblyName System.Drawing

$basePath = 'c:\Users\User\Desktop\Antigravity\financial'

$img192Path = Join-Path $basePath 'icon-192.png'
$img512Path = Join-Path $basePath 'icon-512.png'

$img192 = [System.Drawing.Image]::FromFile($img192Path)
Write-Host "icon-192 original: $($img192.Width)x$($img192.Height)"

$img512 = [System.Drawing.Image]::FromFile($img512Path)
Write-Host "icon-512 original: $($img512.Width)x$($img512.Height)"

# Resize icon-192 to 192x192
if ($img192.Width -ne 192 -or $img192.Height -ne 192) {
    $bmp192 = New-Object System.Drawing.Bitmap(192, 192)
    $g192 = [System.Drawing.Graphics]::FromImage($bmp192)
    $g192.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g192.DrawImage($img192, 0, 0, 192, 192)
    $img192.Dispose()
    $bmp192.Save($img192Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g192.Dispose()
    $bmp192.Dispose()
    Write-Host "icon-192 resized to 192x192"
} else {
    $img192.Dispose()
    Write-Host "icon-192 already correct size"
}

# Resize icon-512 to 512x512
if ($img512.Width -ne 512 -or $img512.Height -ne 512) {
    $bmp512 = New-Object System.Drawing.Bitmap(512, 512)
    $g512 = [System.Drawing.Graphics]::FromImage($bmp512)
    $g512.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g512.DrawImage($img512, 0, 0, 512, 512)
    $img512.Dispose()
    $bmp512.Save($img512Path, [System.Drawing.Imaging.ImageFormat]::Png)
    $g512.Dispose()
    $bmp512.Dispose()
    Write-Host "icon-512 resized to 512x512"
} else {
    $img512.Dispose()
    Write-Host "icon-512 already correct size"
}

Write-Host "Done!"
