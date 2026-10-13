# scaccogatto/homebrew-tap

Homebrew formulae for [scaccogatto](https://github.com/scaccogatto) tools.

```sh
brew install scaccogatto/tap/nastro
```

## Formulae

| Formula | Upstream | Requirements |
| --- | --- | --- |
| `nastro` | [scaccogatto/nastro](https://github.com/scaccogatto/nastro) | macOS 14.4+, Command Line Tools (`xcode-select --install`). Built from source: Homebrew installs Go as a build dependency. |

## How formulae are updated

`.github/workflows/bump.yml` checks for a new upstream release every day (and on manual dispatch). When one exists it opens a PR that updates the URL and checksum. CI builds, tests and audits the formula on macOS, and the PR merges automatically once it passes.

## Issues

- The formula fails to install or is out of date: open an issue here.
- The tool itself misbehaves after install: open an issue upstream.

## License

[MIT](LICENSE)
