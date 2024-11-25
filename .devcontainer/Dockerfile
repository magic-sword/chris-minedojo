# Python3.9以上で利用するため、nvidia/cudaから利用
FROM nvcr.io/nvidia/pytorch:24.11-py3-igpu

# # software-properties-commonなどをインストール時にタイムゾーンを聞かれて停止するため、タイムゾーンをインストールしておく
# # sudoでroot権限へ昇格するときに環境変数が引き継がれないので、sudoに-Eオプションを入れる
# RUN DEBIAN_FRONTEND=noninteractive sudo -E apt install -y tzdata

# === JupyterLab ===
RUN python -m pip install \
    ipywidgets \
    jupyterlab \
    matplotlib \
    nodejs \
    opencv-python \
    pandas \
    scikit-learn \
    seaborn \
    sympy \
    tqdm

# jupyter lab コマンドへのパスを通す
# RUN echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.profile

# 起動時のスクリプトをコピー
COPY --chmod=755 .devcontainer/start_up.sh /usr/local/bin/

# コンテナ起動時にjupyter_notebookを起動
CMD ["/usr/local/bin/start_up.sh"]
