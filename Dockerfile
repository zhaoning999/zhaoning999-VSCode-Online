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
                    npm \
                    yarn && \
  git clone https://github.com/microsoft/vscode.git && \
  cd vscode && \
  yarn && \
  yarn watch
  
CMD ["yarn", "web", "--port", "80"]
