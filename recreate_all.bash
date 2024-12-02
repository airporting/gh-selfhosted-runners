#!/bin/bash
for i in {0..7}
do
  bash multi-runners/mr.bash del --user runner-$i
  bash multi-runners/mr.bash add --org airporting
done
