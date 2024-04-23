# DDM - Disposable Docker Machine (technically a 'container'; but we use this as a machine with a desktop environment)
# Partly derived from: https://github.com/scottyhardy/docker-remote-desktop

ARG TAG=latest

FROM ubuntu:$TAG

RUN apt update && \
    DEBIAN_FRONTEND="noninteractive" apt install -y --no-install-recommends \
        locales \
        xfce4 xfce4-goodies \
        xorgxrdp xrdp dbus-x11 x11-xserver-utils \
        # libsrvg2 is needed for Dracula theme; since it contains svg icons
        librsvg2-bin librsvg2-common \
        # Networking essentials
        openssh-server openssh-client sshfs openvpn iputils-ping \
        # Absolute essentials
        sudo nano git wget ca-certificates software-properties-common gpg-agent \
        # Install zip, 7z, rar support
        p7zip-full p7zip-rar

# Install Firefox ESR
RUN add-apt-repository ppa:mozillateam/ppa && \
    apt update && apt install -y firefox-esr

# SSH server needs this to run properly for some reason
RUN mkdir /var/run/sshd

# Optimize XRDP: https://github.com/neutrinolabs/xrdp/issues/1483
RUN sed -i '/tcp_send_buffer_bytes/c\tcp_send_buffer_bytes=4194304' /etc/xrdp/xrdp.ini 

# Install Dracula theme: https://draculatheme.com/gtk
RUN wget -O /tmp/theme.zip https://github.com/dracula/gtk/archive/master.zip && \
    wget -O /tmp/icons.zip https://github.com/dracula/gtk/files/5214870/Dracula.zip && \
    7z x /tmp/icons.zip -o/usr/share/icons/ && \
    7z x /tmp/theme.zip -o/usr/share/themes/ && \
    chmod -R a+rx /usr/share/themes/gtk-master && \
    chmod -R a+rx /usr/share/icons/Dracula && \
    sed -i 's/Greybird/gtk-master/' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml && \
    sed -i 's/elementary-xfce-dark/Dracula/' /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml && \
    rm /tmp/theme.zip && \
    rm /tmp/icons.zip

# Create the user account
RUN groupadd --gid 1020 naush && \
    useradd --shell /bin/bash --uid 1020 --gid 1020 --password $(openssl passwd naush) --create-home --home-dir /home/naush naush && \
    usermod -aG sudo naush && \
    mkdir /home/naush/.ssh && chown naush:naush /home/naush/.ssh && \
    echo '[ -f $HOME/.bashrc_custom ] && source $HOME/.bashrc_custom' >> /home/naush/.bashrc

ENV LANG=en_US.UTF-8

EXPOSE 22/tcp
EXPOSE 3389/tcp

# Start xrdp sesman service and then run xrdp in foreground
CMD ["sh", "-c", "/usr/sbin/sshd ; /usr/sbin/xrdp-sesman ; /usr/sbin/xrdp --nodaemon"]
