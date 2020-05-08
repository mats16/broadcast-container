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

ENV SCREEN_WIDTH=1280 \
    SCREEN_HEIGHT=720 \
    COLOR_DEPTH=24 \
    VIDEO_BITRATE=3000 \
    VIDEO_FRAMERATE=30 \
    VIDEO_GOP=60 \
    AUDIO_BITRATE=160k \
    AUDIO_SAMPLERATE=44100 \
    AUDIO_CHANNELS=2

COPY pulse/default.pa /etc/pulse/default.pa
COPY firefox/syspref.js  /usr/lib/firefox/browser/defaults/preferences/syspref.js
COPY supervisor/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]