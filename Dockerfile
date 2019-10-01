FROM python:3.7
RUN mkdir /library
WORKDIR /library
ADD . /library
RUN pip3 install -r requirements.txt