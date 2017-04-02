# cloud-ops

Provisioning for cloud infrastructure.

## Getting Started

Because _"it works on my computer"_ should never be said again by anyone, `cloud-ops` is intended to require as little upfront configuration as possible.

To get started all you need is [Docker for Mac or Windows](https://www.docker.com/).

### What's inside the ~~box~~ container?

`cloud-ops` comes packaged with

- [Ansible](https://www.ansible.com/)
- [Packer](https://www.packer.io/)
- [Terraform](https://www.terraform.io/)

and can currently be used with the following cloud providers

- [Amazon Web Services (AWS)](https://aws.amazon.com/)

## cloud-ops

```
Usage: ./cloud-ops [OPTION]
    cloud-ops is a simple CLI intended to make getting started with cloud
    infrastructure provisioning quick and easy.

    --check         Checks your environment for an existing Docker image and env file
    -b, --build     Builds a new cloud-ops Docker image and runs it
    -h, --help      Displays this help menu and exits
```

## Repository Contents (Disclaimer)

The contents of this repository past the root level are configuration for my personal cloud. While the configuration can certainly be used for reference and examples, __I would suggest that you review and understand all settings, options, and configurations used before blindly using any of this__.
