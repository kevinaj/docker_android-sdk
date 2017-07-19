FROM ubuntu:xenial

RUN apt-get update \
  && apt-get install -y \
    unzip \
    wget \
  && apt-get clean


ENV ANDROID_SDK_ROOT=/home/android/Android/Sdk


RUN useradd -m android
USER android

RUN mkdir -p $ANDROID_SDK_ROOT
VOLUME $ANDROID_SDK_ROOT
WORKDIR $ANDROID_SDK_ROOT

# Make get and extract Android SDK
RUN wget https://dl.google.com/android/repository/sdk-tools-linux-3952940.zip -O sdk-tools.zip \
  && wget https://dl.google.com/android/repository/sys-img/google_apis/armeabi-v7a-25_r06.zip \
  && wget https://dl.google.com/android/repository/sys-img/google_apis/x86_64-25_r06.zip \
  && wget https://dl.google.com/android/repository/emulator-linux-4077558.zip -O emulator.zip \
  && wget https://dl.google.com/android/repository/platform-tools_r26.0.0-linux.zip -O platform-tools.zip\
  && unzip sdk-tools.zip \
  && unzip emulator.zip \
  && unzip platform-tools.zip \
  && mkdir system-images \
  && unzip armeabi-v7a-25_r06.zip -d system-images/ \
  && unzip x86_64-25_r06.zip -d system-images/ \
  && rm sdk-tools.zip emulator.zip platform-tools.zip \
  && rm armeabi-v7a-25_r06.zip x86_64-25_r06.zip




