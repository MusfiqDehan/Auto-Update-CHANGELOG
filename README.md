# Hello World Docker Action

This action prints "Hello World" or "Hello" + the name of a person to greet to the log.

## Inputs

## `who-to-greet`

**Required** The name of the person to greet. Default `"World"`.

## Outputs

## `time`

The time we greeted you.

## Example usage

```yml
uses: MusfiqDehan/Auto-Update-CHANGELOG@v0.8.0
with:
    who-to-greet: "MusfiqDehan"
```
