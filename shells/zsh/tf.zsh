## Getting docker to run
alias doc='nvidia-docker-compose'
alias docl='doc logs -f --tail=100'


alias tf="nvidia-docker run -it -p 8890:8888 tensorflow/tensorflow:latest-gpu"
