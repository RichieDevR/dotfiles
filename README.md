# Branch for finishing and then experimenting with Dockerfile if desired.

## Testing and Installing

In order to ensure that install script is working properly first:

1. update OS of container in **Dockerfile** if not using Debian or Ubuntu.
2. build container using:
   `$ sudo docker build -t test-script`.
3. Then run container with:
   `$ sudo docker run test-script`.

If no errors and expected output received script is safe to run on new system.

## TODO

1. Finish Arch and Debian/Ubuntu installs in scripts.
2. Add steps for setting up continued Dotfile tracking on new system.

Using bare repo setup for now however I'm interested in stow so may
switch to that in the near future. I also need to add submodule
tracking for zim to properly automate setup.
