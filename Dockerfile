FROM python

# prep install for docker
RUN apt-get update && \
    apt-get install -y \
        curl \
        apt-transport-https \
        ca-certificates \
        software-properties-common \
        apt-transport-https \
        gnupg2
RUN curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
   $(lsb_release -cs) \
   stable"

# install apt-get packages
RUN apt-get update && \
    apt-get install -y \
        httpie \
        python3-dev \
        zip \
        jq \
        git \
        docker-ce

# install pip packages
RUN pip install \
            awscli \
            awslabs \
            awsebcli \
            cfn_flip \
            jinja2-cli \
            cfn-lint \
            chalice \
            aws-sam-cli \
            requests

# Install ecs cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod +x /usr/local/bin/ecs-cli

# Install tfenv and terraform
RUN git clone https://github.com/kamatama41/tfenv.git /apps/tfenv && \
        ln -s /apps/tfenv/bin/* /usr/local/bin
RUN tfenv install latest

WORKDIR /workdir
ENTRYPOINT /bin/bash