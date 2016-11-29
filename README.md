# Vapor for Docker

This setup has been made with Docker 1.12 for Mac.
You can download Docker For Mac/Windows here
[Mac](https://download.docker.com/mac/stable/Docker.dmg)

This will remove Docker toolbox and migrate your current containers to Docker Engine if you have any.

The [base image](https://hub.docker.com/r/zyxep/vapor/) is build on Ubuntu 14.04 with [Swift](https://github.com/apple/swift) 3 and [Vapor toolbox](https://github.com/vapor/toolbox)

## Simple setup
You can use my base image to get a simple setup with Vapor & Docker up and running.
Go to your projects root directory and run this command

`docker run -v $(pwd):/vapor zyxep/vapor vapor build`

This command will start a container with a mounted directory so you can build the source inside the container, the container will shut down when the build is done
When it's done build run the following command

`docker run -v $(pwd):/vapor -p 8080:8080 zyxep/vapor vapor run`

This command will start another container with same storage mount and bind port 8080 in the host to the container you can change the first `8080` to what ever you want to get that on the host machine.

**this image doesn't have MySQL, PGSQL or SQLite**

## Extended setup
You need to build your own image to extend my base image with MySQL, PGSQL or SQLite.
I have made a Dockerfile that makes this really simple.

Go to the directory `vapor` of this repo and run this command
`docker build -t <your own name to choose> .`

These options can be added to the build line:
##### MySQL
`--build-arg INSTALL_MYSQL=true`

##### PGSQL
`--build-arg INSTALL_PGSQL=true`

##### SQLite
`--build-arg INSTALL_SQLITE=true`

So for example to get Swift & Vapor with MySQL support run this
`docker build -t vapormysql --build-arg INSTALL_MYSQL=true .`

That will make a image with MySQL support based on my image.
Then you can use the commands i put in the top of this document and replace `zyxep/vapor` with `vapormysql`.

##### Nginx
You need to name your vapor container for `vapor` that is done by adding `--name vapor` in the run command for your `vapor` image.
Then you go to the folder nginx and build the image `docker build -t nginxvapor .`

After the image has been build run it with `docker run -d --link vapor:vapor -p 80:80 nginxvapor`
This command will start nginx and run it detached.
