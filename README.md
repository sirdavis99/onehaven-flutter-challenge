# OneHaven Flutter Challenge – Docker-Only Setup

This repository implements the OneHaven Challenge MVP with a Docker-only developer workflow.

Key features
- Mock login (no backend auth), token stored in SharedPreferences
- Dashboard with member list from a mock REST API
- Member detail screen
- Toggle screen-time per member (PATCH), with offline queue and sync via Hive
- All Flutter tooling runs in Docker; Android emulator runs on the host
- Mock backend served by json-server in Docker

---

## Prerequisites
- macOS with Docker Desktop installed
- Android Studio installed and an Android emulator created (e.g. `emulator-5554`)

---

## Environment configuration
Copy the example file and adjust as needed.

```bash
cp .env.example .env
```

`.env` content (default works with Android emulator):

```
MOCK_API_BASE_URL=http://10.0.2.2:3000
```

Notes
- 10.0.2.2 is how the Android emulator reaches the host machine’s localhost.
- The mock API runs on host port 3000 (via Docker `mock-api` service).

---

## Quick start

1) Build Docker images
```bash
make build
```

2) Start the mock API
```bash
make mock-up
open http://localhost:3000/members
```

3) Prepare Flutter toolchain (inside container)
```bash
make setup
```

4) Start the Android emulator on host
```bash
# Use Android Studio > Device Manager > Start
```

5) Verify devices (from container)
```bash
make devices
```

6) Run the app
```bash
make run DEVICE=emulator-5554
```

---

## Makefile targets
- `make build` – docker compose build
- `make shell` – open a bash shell inside the dev container
- `make setup` – flutter doctor, clean, pub get
- `make br` – build_runner (if codegen is used)
- `make analyze` – flutter analyze
- `make fmt` – dart format .
- `make test` – flutter test
- `make devices` – flutter devices
- `make run DEVICE=<id>` – flutter run targeting a device
- `make mock-up` – start json-server mock API
- `make mock-logs` – follow mock API logs
- `make mock-down` – stop mock API

---

## App flow
- App launches to Login.
- Enter any valid email and 6+ character password, then Log in.
- Dashboard lists members from the mock API; pull-to-refresh is supported.
- Toggle a member’s screen time; if offline, changes queue and sync later.
- Tap a member to open the details screen.

---

## Troubleshooting
- Emulator not detected in container
  - Ensure the emulator is running on host via Android Studio
  - The container uses `ADB_SERVER_SOCKET=tcp:host.docker.internal:5037`
  - Run `adb start-server` on host, then retry `make devices`

- Network issues to mock API from app
  - Ensure `.env` has `MOCK_API_BASE_URL=http://10.0.2.2:3000`
  - Confirm mock API is running: `make mock-up` and visit http://localhost:3000/members

- Hot reload
  - Code is bind-mounted into the container; use `r`/`R` in the terminal running `flutter run`.

---

## Project structure (relevant)
- `lib/presentation/pages/login_page.dart` – mock login form
- `lib/presentation/pages/dashboard_page.dart` – member list + toggle
- `lib/presentation/pages/member_detail_page.dart` – member detail
- `lib/logic/provider/member_store.dart` – state store with Hive caching and sync
- `lib/services/member_service.dart` – API client (Dio) using `MOCK_API_BASE_URL`
- `lib/presentation/app.dart` – Provider setup and app entry
- `lib/domain/routes` – routing

---

## Security
- `.env` is ignored in git, use `.env.example` as reference.
- No secrets are required for the mock API.

---

## License
This repository is for the OneHaven challenge and intended for evaluation purposes.
