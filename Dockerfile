FROM ubuntu:18.04

RUN \
  apt-get update -qq && \
  apt-get install -y \
                    libx11-dev \
                    libxkbfile-dev \
                    libsecret-1-dev \
                    fakeroot \
                    rpm \
                    git \
                    curl \
                    python \
                    nodejs \
                    npm && \
  npm install npm -g && \
  npm install -g n && \
  n 12.13.1 && \
  PATH="$PATH" && \
  echo "thissss" && \
  node -v && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt update && apt install yarn && \
  git clone https://github.com/microsoft/vscode.git && \
  git checkout master && \
  yarn
WORKDIR vscode

CMD ["yarn", "web", "--port", "8080"]
