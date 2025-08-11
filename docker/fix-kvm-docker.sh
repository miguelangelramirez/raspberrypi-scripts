#!/bin/bash
set -e

echo "🔍 Checking CPU virtualization support..."
if [ "$(egrep -c '(vmx|svm)' /proc/cpuinfo)" -eq 0 ]; then
    echo "❌ Virtualization not supported or disabled in BIOS/UEFI."
    echo "➡ Please enable Intel VT-x or AMD-V in BIOS, then run again."
    exit 1
else
    echo "✅ Virtualization supported."
fi

echo "📦 Installing KVM and dependencies..."
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils virt-manager

echo "👤 Adding $USER to kvm and libvirt groups..."
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER

echo "🔧 Fixing /dev/kvm permissions..."
sudo chown root:kvm /dev/kvm || true
sudo chmod 660 /dev/kvm || true

echo "✅ KVM setup complete."
echo "🔄 Rebooting in 5 seconds to apply changes..."
sleep 5
sudo reboot
