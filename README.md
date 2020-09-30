# Substrate Docker Builders
This repo is the home of a set of dockerfiles and github actions to auto build and push a docker image for substrate based chains. The docker images are pushed to [the docker hub](https://hub.docker.com/u/eteissonniere) every day.

## How to add your own
1. Fork this repo
2. Edit `./.github/workflows/substrate.yml` to include the details of your project
3. Create a pull request, if it is accepted we will create the repo on our docker hub account