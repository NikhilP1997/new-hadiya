# Stage 1: Build stage
FROM node:16-alpine

# Set working directory
WORKDIR /app/products

# Copy package files
COPY package.json ./

COPY . .

RUN rm -f package-lock.json node_modules

# Install nodemon globally
RUN npm install --global nodemon --save-dev

# Install dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["node", "/src/index.js"]
