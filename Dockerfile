FROM mhart/alpine-node:12

LABEL maintainer="BitSky docker maintainers <help.bitskyai@gmail.com>"

# create app directory
WORKDIR /usr/bitsky


COPY package*.json ./
COPY index.js ./
COPY server.js ./
COPY utils.js ./
COPY package-lock.json ./

# Only install production dependencies
RUN npm ci --only=production

EXPOSE 8090
CMD ["node", "index.js"]

# Metadata
LABEL bitsky.image.vendor="BitSky" \
    bitsky.image.url="https://www.bitsky.ai" \
    bitsky.image.title="BitSky HTTP Producer" \
    bitsky.image.description="Response for executing tasks that don't require chrome, based on Axios" \
    bitsky.image.documentation="https://docs.bitsky.ai"