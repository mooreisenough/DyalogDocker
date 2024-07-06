#!/bin/bash -xe

## install and modify dyalog kernel
pip install dyalog-jupyter-kernel[2.0.2] --user
python -m 'dyalog_kernel' install --user

## Config file in error is /home/vscode/.local/lib/python3.10/site-packages/dyalog_kernel/kernel.py
## replace instances of the word mapl with dyalog will temporarily fix the issue
sed -i 's/mapl/dyalog/g' /home/vscode/.local/lib/python3.10/site-packages/dyalog_kernel/kernel.py

## Start up Jupyter Lab
jupyter lab --NotebookApp.token='abcde54321' --ip=0.0.0.0 --no-browser --allow-root --debug --NotebookApp.iopub_msg_rate_limit=1000000.0 --NotebookApp.iopub_data_rate_limit=100000000.0 &

/entrypoint
 