#!/bin/sh -l

# Test Code

# echo "Hello $1"

# time=$(date)
# echo "time=$time" >>$GITHUB_OUTPUT


# Path: action.yml

# Get the current version

# echo "version=$(python setup.py --version)" >> $GITHUB_ENV

# Check if the commit message matches the release pattern

# if [[ $(git log -1 --pretty=%B) != "Update changelog for v${{ env.version }}" ]]
# then
#     echo "Commit message does not match the release pattern."
#     exit 1
# fi

# Update changelog
if [[ github.event.head_commit.message == "Update changelog for v${{ env.version }}" ]]
then
    PREVIOUS_VERSION=$(git tag -l --sort=-creatordate | head -n 1)
    CHANGES=$(git log --pretty=format:"- %s (%h)" $PREVIOUS_VERSION..)
    echo "# v${{ env.version }}" >> CHANGELOG.md
    echo "## Changes" >> CHANGELOG.md
    echo "$CHANGES" >> CHANGELOG.md
    git config user.email "$1"
    git config user.name "$2"
    git commit -am "Update CHANGELOG.md with latest version by GitHub Action"
    git push
else
    echo "Commit message does not match the release pattern."
    exit 1
fi
