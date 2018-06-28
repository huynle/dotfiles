## Getting docker to run
alias doc='nvidia-docker-compose'
alias docl='doc logs -f --tail=100'


alias tf="docker run --runtime=nvidia -it -p 8890:8888 tensorflow/tensorflow:latest-gpu"
