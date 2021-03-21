FROM node:current-buster-slim

RUN apt-get update \
  && apt-get install -y \
    libpcre2-8-0 git ssh python3 make build-essential libsecret-1-0 \
  && apt-get autoremove -y

RUN NPM_CONFIG_PREFIX=~/.joplin-bin npm install -g joplin \
  && ln -s ~/.joplin-bin/bin/joplin /usr/bin/joplin

ENTRYPOINT ["joplin"]
CMD ["server", "start"]
