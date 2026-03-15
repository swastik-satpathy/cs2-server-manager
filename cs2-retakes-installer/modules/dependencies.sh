echo "Installing dependencies..."

apt update

apt install -y \
  curl \
  wget \
  git \
  jq \
  tar \
  unzip \
  screen \
  lib32gcc-s1 \
  lib32stdc++6