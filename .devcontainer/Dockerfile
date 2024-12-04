# Python3.9以上で利用するため、nvidia/cudaから利用
FROM nvcr.io/nvidia/pytorch:24.11-py3

# sudoを利用できるようにする
RUN apt-get update -y
RUN apt-get install sudo -y

ARG USERNAME=ubuntu

# ユーザーのパスワードがわからないので、ユーザー名で再設定
RUN echo $USERNAME:$USERNAME | chpasswd
USER $USERNAME

# 起動時のスクリプトをコピー
COPY --chmod=755 .devcontainer/start_up.sh /usr/local/bin/

# コンテナ起動時にjupyter_notebookを起動
CMD ["sh", "/usr/local/bin/start_up.sh"]
