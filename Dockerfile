FROM hashicorp/terraform:0.8.5

# override $GOPATH WORKDIR
WORKDIR /

RUN apk add --update --no-cache \
    build-base \
    linux-headers \
    libffi-dev \
    openssl-dev \
    python \
    python-dev \
    py-pip \
  && pip install --upgrade pip \
  && pip install ansible \
    awscli

# override terraform entrypoint
ENTRYPOINT ["ash"]
