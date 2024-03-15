FROM node:14-alpine
WORKDIR /app/

# Install dependencies
COPY package.json /app/
COPY package-lock.json /app/
RUN npm config set unsafe-perm true

# If no pacakge-lock make it npm -i
RUN npm ci
RUN npm install -g serve

# Add rest of the client code
COPY . /app/

RUN  REACT_APP_ENV=production GENERATE_SOURCEMAP=false npm run build
CMD export PORT=3000 && serve -s build