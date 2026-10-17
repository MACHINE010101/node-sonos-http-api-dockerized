FROM node:22-bookworm-slim
WORKDIR /app
ENV NODE_ENV=production
COPY package.json package-lock.json ./
RUN npm ci --omit=dev && npm cache clean --force
COPY --chown=node:node . .
RUN install -d -o node -g node cache static/clips static/tts presets
USER node
EXPOSE 5005
CMD ["node", "server.js"]
