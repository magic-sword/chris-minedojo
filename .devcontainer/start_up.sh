#!/bin/sh

# jupyter notebookをバックアップで起動し、永続化 (ログイン不要)
nohup $HOME/.local/bin/jupyter lab --ip='*' --NotebookApp.token='' --NotebookApp.password='' --config="/workspace/.devcontainer/jupyter_lab_config.py" &

# コンテナを永続化して、消さないようにする
while sleep 1000; do :; done