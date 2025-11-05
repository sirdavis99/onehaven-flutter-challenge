FROM ghcr.io/cirruslabs/flutter:stable

ENV PUB_CACHE=/root/.pub-cache \
    ANDROID_SDK_ROOT=/opt/android-sdk \
    ANDROID_HOME=/opt/android-sdk \
    ADB_SERVER_SOCKET=tcp:host.docker.internal:5037

WORKDIR /app

# Pre-cache pub deps
COPY pubspec.yaml pubspec.lock /app/
RUN flutter pub get || true

# App sources
COPY . /app

# Default command: interactive shell with a quick devices check
CMD ["bash", "-lc", "flutter --version && adb devices && flutter devices && bash"]
