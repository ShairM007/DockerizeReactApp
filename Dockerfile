FROM node:13-alpine


RUN mkdir -p /home/app

COPY . /home/react-app
# set default dir so that next commands executes in /home/app dir
WORKDIR /home/react-app

# will execute npm install in /home/app because of WORKDIR
RUN npm install

EXPOSE 80

CMD ["", "/home/node-app/server.js"]

