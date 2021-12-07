

# pull the official base image
FROM node:12.12-alpine
# set working direction
WORKDIR /app
EXPOSE 3200/tcp
EXPOSE 3200/udp
# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH
# install application dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm i
# add app
COPY . ./
# start app
CMD ["npm", "start"]
