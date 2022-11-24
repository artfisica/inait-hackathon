FROM python:3.9-slim
RUN apt-get update && apt -y install curl gnupg libgl1-mesa-glx libglib2.0-0 && rm -rf /var/lib/apt/lists/*
RUN echo "deb https://packages.cloud.google.com/apt coral-edgetpu-stable main" | tee /etc/apt/sources.list.d/coral-edgetpu.list 
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && apt-get update && apt-get install -y python3-tflite-runtime && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt /
RUN pip install -r /requirements.txt
COPY * /app/
