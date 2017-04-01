FROM hashicorp/terraform:0.9.2

RUN apk add --update --no-cache \
    build-base \
    linux-headers \
    libffi-dev \
    openssl-dev \
    python \
    python-dev \
    py-pip \
    tree \
  && pip install --upgrade pip \
  && pip install ansible \
    awscli \
  && mkdir /cloud-ops

WORKDIR /cloud-ops

# override terraform entrypoint
ENTRYPOINT ["ash"]
