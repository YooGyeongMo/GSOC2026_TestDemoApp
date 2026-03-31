# GSOC2026 TestDemoApp

Demo app for the GSoC 2026 project **Globally Scoped Traits for Swift Testing via Runtime Configuration Schema**.

This app references a modified [swift-testing fork](https://github.com/YooGyeongMo/swift-testing/tree/demian/gsoc-global-traits) as a local dependency to validate the global traits feature.

## Requirements

- Swift 6.3+
- [swift-testing fork](https://github.com/YooGyeongMo/swift-testing) cloned locally (`demian/gsoc-global-traits` branch)

## Project Structure

```
GSOC2026_TestDemoApp/
├── Package.swift
├── Sources/
├── Tests/
│   └── TestDemoAppTests/
│       ├── TimeoutTest.swift        — global timeout
│       ├── OverrideTest.swift       — local wins over global
│       ├── SerializedTest.swift     — global serialization
│       ├── RetryTest.swift          — global retry
│       └── TagTest.swift            — global tags
└── config.json
```

## config.json

```json
{
  "globalTraits": {
    "defaultTimeLimit": { "seconds": 5 },
    "maximumTimeLimit": { "seconds": 30 },
    "tags": ["ci"],
    "serialized": true,
    "retryCount": 3,
    "timeLimitGranularity": { "seconds": 1 }
  }
}
```

| Setting | What it does |
|---------|-------------|
| defaultTimeLimit | 5s fallback for tests without a time limit |
| maximumTimeLimit | 30s hard cap on all tests |
| tags | Adds "ci" tag to every test |
| serialized | Runs all tests sequentially |
| retryCount | Retries 3 times on failure (4 total) |
| timeLimitGranularity | 1s precision (default is 60s) |

## How to Run

### Before (no global traits)

```bash
swift test
```

All tests pass without limits. Tests run in parallel.

### After with JSON config

```bash
swift test --configuration-path config.json
```

Same test code. Global traits applied through config.json.

### After with CLI Flags

CLI flags require the [modified SwiftPM](https://github.com/YooGyeongMo/swift-package-manager/tree/demian/gsoc-global-traits-cli).

```bash
# timeout only
~/Documents/GitHub/swift-package-manager/.build/debug/swift-test \
    --experimental-global-timeout 5 --experimental-global-granularity 1

# serialized only
~/Documents/GitHub/swift-package-manager/.build/debug/swift-test \
    --experimental-global-serialized

# all flags
~/Documents/GitHub/swift-package-manager/.build/debug/swift-test \
    --experimental-global-timeout 5 \
    --experimental-global-granularity 1 \
    --experimental-global-serialized \
    --experimental-global-retry-count 3 \
    --experimental-global-tags ci \
    --experimental-global-max-timeout 30
```

Only specified flags apply. Unspecified settings use defaults.

## Before / After

| | Before | After |
|---|---|---|
| Slow test (10s) | Pass (no limit) | TIMEOUT (5s limit) |
| Local wins (8s) | Pass | Pass (local 1min wins) |
| Execution order | Parallel (1s) | Sequential (3s) |
| Failed test | Done | 4 iterations |
| Config change | Code change + recompile | JSON or CLI only |

## Links

- [swift-testing Fork](https://github.com/YooGyeongMo/swift-testing/tree/demian/gsoc-global-traits)
- [SwiftPM Fork](https://github.com/YooGyeongMo/swift-package-manager/tree/demian/gsoc-global-traits-cli)
- [Forum Discussion](https://forums.swift.org/t/gsoc-2026-globally-scoped-traits-for-swift-testing-design-questions/85541)
