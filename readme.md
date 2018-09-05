
# docker imageのビルド
nvidia-docker-deeplearningディレクトリ以下に.zshrcとDockerfileが配置してある
build_docker_machine.shを実行するとdocker imageのビルドが開始される

# docker machineの起動
start_docker_machine.shを実行するとdocker containerが作成される
dataディレクトリをdocker環境とホスト環境で共有している

# docker machineでjupyter notebookを起動
8888ポートフォワーディングしていて、docker環境下で
jupyter notebook --ip=0.0.0.0　を入力
ホスト環境のブラウザ上でlocalhost:8888　→　token入力（ターミナル上のリンクをクリック）
でjupyter notebookを起動できる
