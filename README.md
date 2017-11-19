# Docker-python-serverless

Found on Github @ [andrewfarley/docker-python-serverless](https://github.com/AndrewFarley/docker-python-serverless)

[![Dockerhub badge](http://dockeri.co/image/andrewfarley/docker-python-serverless)](https://hub.docker.com/r/andrewfarley/docker-python-serverless)

Docker-powered build/deployment environment for Python-based Serverless projects. This Docker image is intended for use with [Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) and [AWS CodeBuild](https://aws.amazon.com/codebuild).

This image is based on the official [amazonlinux](https://hub.docker.com/_/amazonlinux/) from AWS and has the AWS CLI, Serverless v1.24.1 and Python 2.7 & 3.6 pre-installed for you.  It includes make and g++ which is necessary for compiling native Python modules.