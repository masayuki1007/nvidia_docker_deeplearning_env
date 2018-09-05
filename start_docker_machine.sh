# nvidia-docker-imageを起動
# dataディレクトリをホスト環境と共有
# dockerマシンからホスト環境に8888ポートフォワーディング
nvidia-docker run -it -v /home/hakuhodo/Desktop/nvidia_docker_env/data/:/home/ubuntu/data --shm-size 8G -p 8888:8888 nvidia-docker-deeplearning zsh
