#!/bin/bash -e
# https://qiita.com/koara-local/items/940ce66e2ecd8e4d8582

cd `tmux display-message -p -F "#{pane_current_path}"`
user_name=`git config --get user.name`
email_address=`git config --get user.email`

echo " ${user_name} / ${email_address}"
