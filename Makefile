# Docker-only Flutter workflow
# Default Android emulator device id example: emulator-5554
DEVICE ?= emulator-5554

# One-time tooling build (ensure SDK/Gradle dirs and prime Android SDK)
build:
	mkdir -p android-sdk gradle-cache
	docker compose build
	docker compose run --rm onehaven-app bash -lc 'yes | sdkmanager --licenses && sdkmanager "platform-tools" "cmdline-tools;latest" "platforms;android-35" "build-tools;35.0.0"'

# Enter dev shell
shell:
	docker compose run --rm onehaven-app bash

# Doctor, clean, get
setup:
	docker compose run --rm onehaven-app bash -lc "flutter doctor -v && flutter clean && flutter pub get"

# Codegen (if using freezed/json_serializable/hive_generator)
br:
	docker compose run --rm onehaven-app bash -lc "dart run build_runner build --delete-conflicting-outputs"

# Analyze, format, test
analyze:
	docker compose run --rm onehaven-app bash -lc "flutter analyze"
fmt:
	docker compose run --rm onehaven-app bash -lc "dart format ."
test:
	docker compose run --rm onehaven-app bash -lc "flutter test -r expanded"

# Devices and run
devices:
	docker compose run --rm onehaven-app bash -lc "flutter devices"
run:
	docker compose run --rm onehaven-app bash -lc "flutter run -d $(DEVICE)"

# Mock API lifecycle
mock-up:
	docker compose up -d mock-api
mock-logs:
	docker compose logs -f mock-api
mock-down:
	docker compose stop mock-api
