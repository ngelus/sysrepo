Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
lxrun /install
git clone https://github.com/RoliSoft/WSL-Distribution-Switcher.git
cd WSL-Distribution-Switcher
python get-prebuilt.py kalilinux/kali-linux-docker
python install.py rootfs_kalilinux_kali-linux-docker_latest.tar.gz
lxrun /setdefaultuser root
