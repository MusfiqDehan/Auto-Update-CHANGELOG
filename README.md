# Auto Update Changelog Action

A GitHub Action to automatically update the changelog.

## Inputs

- `version`: Version number for the release. (required)

## Example Usage

```yaml
name: Update Changelog

on:
  push:
    branches:
      - master

jobs:
  update-changelog:
    runs-on: ubuntu-latest
    steps:
      - name: Run Update Changelog Action
        uses: MusfiqDehan/Auto-Update-CHANGELOG@v2
        with:
          version: '2.0.0'
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
