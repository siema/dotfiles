Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y 7zip adobereader-update cdburnerxp dropbox foobar2000 gimp googlechrome inkscape irfanview irfanviewplugins jdk8 libreoffice-fresh mpv paint.net sublimetext3
choco install -y --ignore-checksums steam
