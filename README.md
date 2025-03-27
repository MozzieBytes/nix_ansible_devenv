# Nix Ansible DevEnv

This Repository displays a demo of how Dev Containers, Nix, and Direnv can be used together to create reproducible ephemeral dev environments. 

It's intended to be used for demonstration purposes.

## Using the Dev Container.

The current DevContainer json is expecting the dev to be using VSCode for their development environment. 

The expected pre-requisite is that your development environment is already configured to successfully use dev containers.

When opening the project in vscode, open the project in the dev container, and the image will set up your dev environment. 

This allows engineers to take full advantage of nix and direnv without needing them configured on their machine.

## Using raw direnv. 

If you're already using nix in your dev environment, you do not need to use dev-containers to take advantage of our new ephemeral dev environment. 

Simply enabling direnv for the directory, and in your chosen editor should enable your system to automatically configure the dev environment on changing directory to this project.


## Running the playbook.

There is an example playbook provided with this repo for testing of the ephemeral environment. 

This can be run with `ansible-playbook ./playbooks/cowsay.yaml`

## Bonus Content

As bonus content, tree-fmt has been configured for this project to allow for easy code formatting using `nix fmt`. 

This will format all nix, ansible, and markdown files according to the configuration in `treefmt.nix`
