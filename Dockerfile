FROM node:lts-alpine

# install simple http server for serving static content
#RUN chmod -R 755 /root

# make the 'app' folder the current working directory
WORKDIR /src

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install -g npm @ionic/cli@latest && npm i --silent
#RUN npm install

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . /src

# build app for production with minification
#RUN npm run build

EXPOSE 8100

ENTRYPOINT ["ionic"]
CMD ["serve", "8100", "--host", "0.0.0.0"]
#CMD ["tail", "-f", "/dev/null"]