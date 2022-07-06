FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && apt-get install -y curl wget unzip

ENV AWS_DEFAULT_REGION=us-east-1

RUN wget https://github.com/Illumina/ExpansionHunter/releases/download/v5.0.0/ExpansionHunter-v5.0.0-linux_x86_64.tar.gz
RUN tar -xvzf ExpansionHunter-v5.0.0-linux_x86_64.tar.gz
RUN rm ExpansionHunter-v5.0.0-linux_x86_64.tar.gz
