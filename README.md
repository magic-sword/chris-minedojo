# chris-minedojo

## Docker Compose

## .env

1. `__.env`ファイルをコピーして、`.env`にリネーム
2. `.env`ファイルの環境変数`DOCKERHUB_ACCOUNTNAME`に、Docker Hubのアカウント名を設定する

アカウント名を設定しておくことで、イメージのビルド時にアカウント名が設定されて、Docker Hubへプッシュしやすくなる
その他、`docker-compose.yml`の変数を`.env`ファイルで調整できる

## jupyter_lab_config.py

jupyter labの設定をできる
現在、設定している内容は以下の通り

* c.ServerApp.notebook_dir = '/workspace'
    * jupyter lab接続時の最初のフォルダ
    * コンテナ内にマウントしているルートフォルダを開くようにしている

## MineDojo

[参考](https://docs.minedojo.org/sections/getting_started/sim.html)  MineDojo Installation

必要環境
1. nvidia-driver >= 560 (CUDAのバージョンに対応しているドライバー)
    * ホスト側のPCにインストールしておく必要がある
    * Linux インストールコマンド: 
    <pre>
    sudo add-apt-repository ppa:graphics-drivers/ppa
    sudo apt update
    sudo apt install nvidia-driver-560
    </pre>

    古いものは自動でアンインストールされる
    うまくいかなかった場合は、手動アンインストールを試す
    <pre>
    $ sudo apt purge cuda-*
    $ sudo apt purge nvidia-*
    $ sudo apt autoremove
    </pre>

    * Windows WSL2の場合は、Windows側で`GeForce Experience`などからドライバーを更新する
2. CUDA(Pytorchが対応しているCUDA)
    * Dockerで構築する場合、[NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)をインストールする必要がある
    * コンテナ上にインストールするため、Docker Fileに記載
3. Python == 3.9
    * MineDojoはPython3.9以上のみ対応している
    * MineDojoのpip installは、Python3.10以上の環境で実行すると、ビルド時に様々なエラーが発生して、解決が難しい
    * 解決方法はPythonバージョンを下げることなので、Python3.9の環境でのみインストールできるらしい
    * MineDojoのインストールの実行は難しいので、MineDojoのイメージを利用させてもらう

[参考](https://qiita.com/psymonmarkrine/items/c2111d713371dac38653)DockerでCUDA GPU環境を作る方法 自分用まとめ
