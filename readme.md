# AWS Toolbox

This toolbox is useful for those who want to do a lot on AWS with the Linux tools, but run a Windows OS, or run MacOS but their Python setup is corrupt.

Contains the following cli tools:

* awscli
* sam
* terraform (use tfenv to install other versions!)
* ecs-cli
* eb
* chalice
* sceptre
* cfn-lint
* cfn-flip

And a lot of other handy tools like: httpie, curl, git, jq, docker, jinja.

```
docker run -it \
    -v $(pwd)/:/workdir \
    -v $HOME:/root \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -p "3000:3000" \
    binxio/aws-toolbox
```

Mount the current workdir in the workdir in the container.

```
-v $(pwd)/:/workdir
```

Mount the home folder to the homefolder /root in the container. To use your aws credentials, and other settings.

```
-v $HOME:/root
```

To run Docker containers from inside this container.

```
-v /var/run/docker.sock:/var/run/docker.sock
```

To open sam local or other ports:

```
-p "3000:3000"
```