FROM ubuntu:22.04

# Vermeide interaktive Prompts
ENV DEBIAN_FRONTEND=noninteractive

# Stelle sicher, dass alle Paketquellen aktuell sind
RUN apt-get update && apt-get upgrade -y

# Installiere sudo als erstes (damit es korrekt konfiguriert wird)
RUN apt-get install -y sudo && apt-get install -f && dpkg --configure -a

# Installiere grundlegende Tools
RUN apt-get install -y locales && \
    locale-gen en_US.UTF-8 && \
    update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US.UTF-8

# Setze die Standard-Locale für alle Shells
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Installiere benötigte Yocto-Abhängigkeiten
RUN apt-get install -y \
    apt-utils \
    gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat cpio python3 python3-pip \
    python3-pexpect xz-utils debianutils iputils-ping \
    python3-git python3-jinja2 libegl1-mesa libsdl1.2-dev \
    python3-cryptography python3-pyelftools \
    pylint xterm zstd \
    curl file lz4 \
    liblz4-tool rsync \
    cmake ninja-build \
    ccache \
    mc && \
    rm -rf /var/lib/apt/lists/*

# Erstelle Benutzer für Yocto
RUN useradd -m -s /bin/bash yocto && echo "yocto ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

# RUN mkdir -p /home/yocto/.cache && chown -R yocto:yocto /home/yocto/.cache

# Setze den Benutzer "yocto" als Standard
USER yocto
WORKDIR /home/yocto

# Starte eine Shell, damit der Container nach dem Start interaktiv bleibt
CMD ["/bin/bash"]
