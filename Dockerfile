FROM ubuntu:16.04
MAINTAINER S3nh "steam.panek@gmail.com"

RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && apt-get install -y python3.6 python3.6-dev python3-pip

RUN ln -sfn /usr/bin/python3.6 /usr/bin/python3 && ln -sfn /usr/bin/python3 /usr/bin/python && ln -sfn /usr/bin/pip3 /usr/bin/pip

COPY requirements.txt /app/requirements.txt
RUN apt update && apt install -y libsm6 libxext6
WORKDIR /app
RUN pip3 install -r requirements.txt
RUN apt-get install libxrender1
COPY . /app
EXPOSE 8000

ENTRYPOINT ["python"]
CMD [ "app.py" ]





