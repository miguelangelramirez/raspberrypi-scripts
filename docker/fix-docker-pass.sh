#!/bin/bash
set -e

echo "🚀 Installing required packages..."
sudo apt update
sudo apt install -y haveged pass gnupg2

echo "🔑 Starting haveged service..."
sudo systemctl enable haveged
sudo systemctl start haveged

# Temp GNUPGHOME to avoid conflicts
export GNUPGHOME=$(mktemp -d)

echo "🔐 Generating GPG key (non-interactive)..."
KEY_NAME="docker-pass-fix"
KEY_EMAIL="docker-pass-fix@localhost"
KEY_ID=$(gpg --batch --passphrase '' --quick-gen-key "$KEY_NAME <$KEY_EMAIL>" default default 0 && gpg --list-keys --with-colons | grep '^pub' | tail -n1 | cut -d: -f5)

if [ -z "$KEY_ID" ]; then
    echo "❌ Failed to generate GPG key."
    exit 1
fi

echo "✅ Generated GPG key: $KEY_ID"

echo "📦 Initializing pass with GPG key..."
pass init "$KEY_ID"

echo "🔄 Restarting Docker Desktop..."
systemctl --user restart docker-desktop || true

echo "🎉 Done! You can now log in to Docker Desktop without the 'enable pass' error."
