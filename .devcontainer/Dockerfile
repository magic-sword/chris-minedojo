# Python3.9以上で利用するため、nvidia/cudaから利用
FROM minedojo/minedojo:latest

# NVIDIA コンテナ ツールキットのインストール https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
RUN curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
RUN curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
RUN sudo apt-get update
RUN sudo apt-get install -y nvidia-container-toolkit

# Pytorch インストール
RUN pip install torch torchvision torchaudio

# USER 1000

# jupyterlab インストール
RUN pip install jupyterlab

# 起動時のスクリプトをコピー
COPY --chmod=755 .devcontainer/start_up.sh /usr/local/bin/

# コンテナ起動時にjupyter_notebookを起動
CMD ["sh", "/usr/local/bin/start_up.sh"]
