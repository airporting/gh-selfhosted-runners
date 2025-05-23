#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for i in {0..5}
do
  LABELS=$(bash ./labels.bash runner-$i)
  KEEP_LABELS=$(echo $LABELS | jq -r '[.[] | select(startswith("repo"))] | join(",")')
  echo keeping labels: $KEEP_LABELS
  bash multi-runners/mr.bash del --user runner-$i
  bash multi-runners/mr.bash add --org airporting ${KEEP_LABELS:+--labels "$KEEP_LABELS"}
done
