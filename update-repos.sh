#!/usr/bin/env bash

# Directory to search for repos; defaults to current directory if none provided
ROOT_DIR="${1:-.}"

# Find all .git directories, strip off the trailing /.git to get the repo root
find "$ROOT_DIR" -type d -name .git | while read -r gitdir; do
  repo_dir="$(dirname "$gitdir")"
  echo -e "\n⇢ Updating repository in: $repo_dir"
  # Change into the repo and pull latest changes
  git -C "$repo_dir" pull
done

echo -e "\nAll done! 🚀"
