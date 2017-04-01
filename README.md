# Vapor for Docker

This setup has been made with Docker 1.12 for Mac.
You can download Docker For Mac/Windows here
[Mac](https://download.docker.com/mac/stable/Docker.dmg)

This will remove Docker toolbox and migrate your current containers to Docker Engine if you have any.

The [base image](https://hub.docker.com/r/vapor/vapor/) is build on Ubuntu 16.04 with [Swift](https://github.com/apple/swift) 3.1 and [Vapor toolbox](https://github.com/vapor/toolbox)

## Simple setup
You can use the base image to get a simple setup with Vapor & Docker up and running.
Go to your projects root directory and run this command

`docker run --rm -ti -v $(pwd):/vapor -p 8080:8080 vapor/vapor:latest`

This command will start a container with a mounted directory and build and run the source inside the container. You can access to your app using https://localhost:8080

**this image doesn't have MySQL, PGSQL or SQLite**

## Extended setup
You need to build your own image to extend my base image with MySQL, PGSQL or SQLite.
There is a Dockerfile that makes this really simple.

Clone this repo inside your vapor project, go to the directory `/docker/vapor`.
Run this command

`docker build -t <your own name to choose> .`
We are going to use `vapormysql` in this example.

These options can be added to the build line:
##### MySQL
`--build-arg INSTALL_MYSQL=true`

##### PGSQL
`--build-arg INSTALL_PGSQL=true`

##### SQLite
`--build-arg INSTALL_SQLITE=true`

So for example to get Swift & Vapor with MySQL support run this
`docker build -t vapormysql --build-arg INSTALL_MYSQL=true .`

That will make a image with MySQL support based on the base image.
Then you can use the commands i put in the top of this document and replace `vapor/vapor:latest` with `vapormysql`.

##### Nginx
You need to name your vapor container for `vapor` that is done by adding `--name vapor` in the run command for your `vapor` image.
Then you go to the folder nginx and build the image `docker build -t nginxvapor .`

After the image has been build run it with `docker run -d --link vapor:vapor -p 80:80 nginxvapor`
This command will start nginx and run it detached.`
