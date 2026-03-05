Add-Type -AssemblyName System.Drawing

$imgFile = "c:\Users\User\Desktop\Antigravity使用\財務規劃\icon.png"
if (-Not (Test-Path $imgFile)) {
    Write-Host "File not found"
    exit
}

$img = [System.Drawing.Image]::FromFile($imgFile)
$size = [math]::Min($img.Width, $img.Height)

$x = [math]::Floor(($img.Width - $size) / 2)
$y = [math]::Floor(($img.Height - $size) / 2)

$rect = New-Object System.Drawing.Rectangle($x, $y, $size, $size)
$bmp = New-Object System.Drawing.Bitmap($img)
$cropped = $bmp.Clone($rect, $img.PixelFormat)

# Resize 512
$bmp512 = New-Object System.Drawing.Bitmap(512, 512)
$g = [System.Drawing.Graphics]::FromImage($bmp512)
$g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g.DrawImage($cropped, 0, 0, 512, 512)
$bmp512.Save("c:\Users\User\Desktop\Antigravity使用\財務規劃\icon-512.png", [System.Drawing.Imaging.ImageFormat]::Png)

# Resize 192
$bmp192 = New-Object System.Drawing.Bitmap(192, 192)
$g2 = [System.Drawing.Graphics]::FromImage($bmp192)
$g2.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
$g2.DrawImage($cropped, 0, 0, 192, 192)
$bmp192.Save("c:\Users\User\Desktop\Antigravity使用\財務規劃\icon-192.png", [System.Drawing.Imaging.ImageFormat]::Png)

$g.Dispose()
$g2.Dispose()
$bmp512.Dispose()
$bmp192.Dispose()
$cropped.Dispose()
$bmp.Dispose()
$img.Dispose()

Write-Host "Done resizing to 192x192 and 512x512"
