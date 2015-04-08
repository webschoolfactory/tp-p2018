FROM node:0.10.38
ADD . /code
WORKDIR /code
RUN npm install --no-bin-links