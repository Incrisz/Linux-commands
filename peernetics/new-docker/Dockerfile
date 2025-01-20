# Use the official Node.js image as the base image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) to the working directory
COPY package*.json ./

# Install dependencies

# RUN apt install npm -y

RUN npm i

# RUN cp .env.template .env 

RUN sed -i 's|^DATABASE_URL=postgresql://postgres:Qwerty.1234@3.11.67.148:5432/postgres_testing| DATABASE_URL=postgresql://postgres:password@database:5432/database|' .env
RUN echo "DATABASE_URL=postgresql://postgres:password@database:5432/database" >> .env

# RUN npm install

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "run", "dev"]














# Use an official Node.js image as the base image
FROM node:22.13.0-alpine3.21

# Install OpenSSL
RUN apk add --no-cache openssl


# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies
RUN npm i

# Copy the rest of the application code to the container
COPY . .

# RUN cp .env.template .env 

# RUN sed -i 's|^DATABASE_URL=postgresql://postgres:Qwerty.1234@3.11.67.148:5432/postgres_testing| DATABASE_URL=postgresql://postgres:password@postgres-database:5432/database|' .env

# RUN echo "DATABASE_URL=postgresql://postgres:password@postgres-database:5432/database" >> .env

# Build the Next.js app
# RUN npm run build

RUN npx prisma db push 

# Expose the port that your Next.js app will run on
# EXPOSE 3000

# Start the Next.js app
# CMD ["npm", "start"]