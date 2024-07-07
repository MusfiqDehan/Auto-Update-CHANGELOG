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
      - name: Checkout code
        uses: actions/checkout@v4
        with:
          fetch-depth: 0

      - name: Get the current version
        id: current-version
        run: echo "version=$(python setup.py --version)" >> $GITHUB_ENV
        shell: bash

      - name: Run Update Changelog Action
        uses: MusfiqDehan/Auto-Update-CHANGELOG@v1.0.2
        with:
          version: ${{ env.version }}
          user_email: 'your email'
          user_name: 'your name'
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
