#!/bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

for i in {0..5}
do
  bash multi-runners/mr.bash del --user runner-$i
  bash multi-runners/mr.bash add --org airporting
done
