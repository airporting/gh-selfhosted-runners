source multi-runners/.env

curl -s -H "Authorization: token $MR_GITHUB_PAT" \
     -H "Accept: application/vnd.github+json" \
     https://api.github.com/orgs/airporting/"${@:1}"
