FROM node:22-bookworm-slim
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci --include=dev
COPY . .
RUN npx vite build
ENV NODE_ENV=production PORT=8080 SERVE_STATIC_DIR=./dist
EXPOSE 8080
CMD ["sh","scripts/start.sh"]
