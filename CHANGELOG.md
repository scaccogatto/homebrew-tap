# Changelog

All notable changes to this tap are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).
Formula versions follow their upstream releases.

## [Unreleased]

### Changed

- `nastro`: no longer requires Xcode.app. The Command Line Tools `swiftc` is enough to build `nastro-tap`.
- `nastro`: installation stops early with a clear message on macOS 14.0 to 14.3, which lack the CoreAudio process tap API (14.4+ is required).
- `nastro`: `brew test` now also runs the `nastro-tap` self-check.
- Formula bumps arrive as pull requests that must pass CI (build, test, audit) before merging, instead of direct pushes to `main`.

### Added

- README with requirements, the update process and where to file issues.
- MIT license.
