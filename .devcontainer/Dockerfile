FROM ubuntu:22.04

# Vermeide interaktive Prompts
ENV DEBIAN_FRONTEND=noninteractive

# Stelle sicher, dass alle Paketquellen aktuell sind
RUN apt-get update && \
    apt-get install -y --no-install-recommends eatmydata && \
    eatmydata apt-get upgrade -y

# Installiere sudo als erstes (damit es korrekt konfiguriert wird)
RUN apt-get install -y sudo && apt-get install -f && dpkg --configure -a

# Installiere grundlegende Tools
RUN eatmydata apt-get install -y --no-install-recommends locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# Setze die Standard-Locale für alle Shells
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Installiere benötigte Yocto-Abhängigkeiten
RUN eatmydata apt-get install -y --no-install-recommends \
    # Basis-Tools für Paketmanagement & allgemeine Systemtools
    apt-utils \
    wget curl file rsync \
    xz-utils zstd lz4 liblz4-tool \
    debianutils \
    iputils-ping \
    nano mc \
    fuse3 sshfs \
    # Entwicklungswerkzeuge
    git-core \
    diffstat \
    unzip \
    texinfo \
    chrpath \
    socat \
    cpio \
    # Dokumentation
    doxygen graphviz \
    # Build-Systeme & Compilertools
    build-essential \
    gcc-multilib \
    cmake ninja-build \
    ccache \
    # Python-Umgebung
    python3 python3-pip \
    python3-pexpect \
    python3-git python3-jinja2 \
    python3-cryptography \
    python3-pyelftools \
    python3-dev python3-setuptools \
    pylint \
    # Yocto-spezifische Abhängigkeiten
    gawk \
    libsystemd-dev \
    # Entwicklungsbibliotheken für Grafik & UI
    libegl1-mesa \
    libsdl1.2-dev \
    xterm \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/*

# Erstelle Benutzer für Yocto
RUN useradd -m -s /bin/bash yocto && echo "yocto ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN mkdir -p /home/yocto/.cache && chown -R yocto:yocto /home/yocto/.cache

# Setze den Benutzer "yocto" als Standard
USER yocto
WORKDIR /home/yocto

# Starte eine Shell, damit der Container nach dem Start interaktiv bleibt
CMD ["/bin/bash"]
