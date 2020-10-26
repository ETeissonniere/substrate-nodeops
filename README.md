# Substrate Node OPs
✨ This repo contains everything you need to deploy and manage substrate based nodes! ✨

So far, we have:
- a suite of docker containers being built everyday and pushed to [the docker hub](https://hub.docker.com/u/eteissonniere)
- self configuring images for both prometheus and grafana
- a built in grafana dashboard to monitor your nodes
- templates to deploy on your own cloud provider through [moncc](https://moncc.io/)

> If you'd like to see how you can use this project to deploy your own nodes please check our [recent medium post](https://medium.com/@eliott_t/ce2ddc001e65?source=friends_link&sk=be285141f01ddd0d66733f6d014abfbd).

![Grafana Dashboard](https://user-images.githubusercontent.com/10683430/95597134-8d57cb00-0a4e-11eb-8ade-af105ec86ed7.png)

# Contributing

## How to add your own substrate node
If you are running a substrate based chain and would your node to be included in our build suite follow these steps:
1. Fork this repo
2. Edit `./.github/workflows/substrate.yml` to include the details of your project
3. Create a pull request, if it is accepted we will create the repo on our docker hub account
4. Profit!