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
        sudo nano git wget bash-completion ca-certificates software-properties-common gpg-agent \
        # Install zip, 7z, rar + GUI support
        p7zip-full p7zip-rar xarchiver \
    && \
    # Enable bash completion globally
    echo ". /etc/bash_completion" >> /etc/bash.bashrc && \
    # https://unix.stackexchange.com/a/765817
    sed -i 's/Dir::Cache::pkgcache ""; Dir::Cache::srcpkgcache "";/Dir::Cache::pkgcache "\/var\/cache\/apt\/pkgcache.bin"; Dir::Cache::srcpkgcache "\/var\/cache\/apt\/srcpkgcache.bin";/' \
        /etc/apt/apt.conf.d/docker-clean

# Install Firefox ESR
RUN add-apt-repository ppa:mozillateam/ppa && \
    apt update && apt install -y firefox-esr

# Install Sublime
RUN wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null && \
    echo "deb https://download.sublimetext.com/ apt/stable/" | \
    sudo tee /etc/apt/sources.list.d/sublime-text.list && \
    apt update && apt install -y sublime-text

# SSH server needs this to run properly for some reason
RUN mkdir /var/run/sshd

# Setup XFCE middle click action to close window
RUN sed -i '/tasklist">/a\    <property name="middle-click" type="uint" value="1"/>' \
    /etc/xdg/xfce4/panel/default.xml

# Optimize XRDP: https://github.com/neutrinolabs/xrdp/issues/1483
RUN sed -i '/tcp_send_buffer_bytes/c\tcp_send_buffer_bytes=4194304' /etc/xrdp/xrdp.ini 

# Install Dracula theme: https://draculatheme.com/gtk
RUN wget -O /tmp/theme.zip https://github.com/dracula/gtk/archive/master.zip && \
    wget -O /tmp/icons.zip https://github.com/dracula/gtk/files/5214870/Dracula.zip && \
    7z -snld x /tmp/icons.zip -o/usr/share/icons/ && \
    7z -snld x /tmp/theme.zip -o/usr/share/themes/ && \
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

# https://stackoverflow.com/a/28406007 
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen && \
    echo "LANG=en_US.UTF-8 ; LANGUAGE=en_US:en ; LC_ALL=en_US.UTF-8" \
    >> /etc/bash.bashrc

# User specific settings
USER naush

# Enable dark theme in Sublime
RUN mkdir -p /home/naush/.config/sublime-text/Packages/User && \
    echo '{"theme": "Default Dark.sublime-theme"}' > \
    /home/naush/.config/sublime-text/Packages/User/Preferences.sublime-settings

USER root

EXPOSE 22/tcp
EXPOSE 3389/tcp

# Start xrdp sesman service and then run xrdp in foreground
CMD ["sh", "-c", "apt update ; /usr/sbin/sshd ; /usr/sbin/xrdp-sesman ; /usr/sbin/xrdp --nodaemon"]
