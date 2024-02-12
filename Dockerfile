FROM node::12.2.0-alpine
WORKDIR /app/

# Install dependencies
COPY package.json /app/
COPY package-lock.json /app/
RUN npm cofig set unsafe-perm true
# If no pacakge-lock make it npm -i
RUN npm ci
RUN npm install -g server@13.0.4
# Add rest of the client code
COPY . /app/
EXPOSE 3000
RUN  REACT_APP_ENV=production GENERATE_SOURCEMAP=false npm run build
CMD export PORT=3006 && serve -s build