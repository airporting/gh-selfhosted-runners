HOST=$(hostname)
LABELS=$(bash ./gh_api.bash actions/runners -X GET | jq '.runners[] | {name: .name, labels: [.labels[].name]}')
LABEL=$(echo $LABELS | jq --arg name "$1@$HOST" 'select(.name == $name) | .labels')
echo $LABEL | jq
