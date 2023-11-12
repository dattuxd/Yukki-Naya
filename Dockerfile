FROM python:3.12-buster
RUN apt update -y && apt upgrade -y \
    && apt install ffmpeg python3-pip python3-virtualenv -y\
    && apt clean \
    && rm -rf /var/lib/apt/lists/*
COPY . /app/
WORKDIR /app/
RUN virtualenv -p /usr/bin/python3 venv
RUN . ./venv/bin/activate
RUN pip3 install --no-cache-dir -U pip
RUN pip3 install --no-cache-dir -U -r requirements.txt
CMD python3 -m YukkiMusic
