FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN adduser --disabled-password --system broadcast && \
    apt-get update && \
    apt-get install -y \
        pulseaudio \
        xvfb \
        firefox \
        ffmpeg \
        supervisor \
        curl \
        unzip && \
    curl -o /tmp/openh264.zip http://ciscobinary.openh264.org/openh264-linux64-2e1774ab6dc6c43debb0b5b628bdf122a391d521.zip && \
    unzip /tmp/openh264.zip -d /usr/lib/firefox/ && \
    rm -f /tmp/openh264.zip && \
    apt-get remove -y curl unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV SCREEN_WIDTH=1920 \
    SCREEN_HEIGHT=1080 \
    COLOR_DEPTH=24 \
    X_SERVER_NUM=2 \
    VIDEO_BITRATE=4500k \
    VIDEO_MINRATE=0 \
    VIDEO_MAXRATE=0 \
    VIDEO_BUFSIZE=0 \
    VIDEO_FRAMERATE=30 \
    VIDEO_GOP=60 \
    AUDIO_BITRATE=128k \
    AUDIO_SAMPLERATE=44100 \
    AUDIO_CHANNELS=2 \
    FFMPEG_THREADS_NUM=0

COPY pulse/default.pa /etc/pulse/default.pa
COPY firefox/syspref.js  /usr/lib/firefox/browser/defaults/preferences/syspref.js
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
