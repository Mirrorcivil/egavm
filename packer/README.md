# Instructions for get a Ubuntu base box

## Build it myself

I'm tired of guessing parameters of other people's box. So just copy & paste codes from other repos
to get my own packer template.

Rules:

* Keep it as simple as possible in `http/preseed.cfg`.
* apt-get from nearby mirrors.
* Install Ubuntu desktop without recommends.
* VirtualBox only. For other platform, just use boxcutter's atlas boxes.
* Install VirtualBox guest additions in building phase.
* vagrant:vagrant as username:password.
* Leave DVD there. Remove it by vagrant later.

```bash
cd ~/Scripts/egavm/packer
rm mytrusty.box
bash packer.sh
```

## Other boxes

* Official box
    * `vagrant box add ubuntu/trusty64 --provider virtualbox --box-version 20151020.0.0 --force`
    * `vagrant box add https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box --name mytrusty --force`

This build is a mixture of the following builds.

* boxcutter
    * `git clone https://github.com/boxcutter/ubuntu`
    * `vagrant box add box-cutter/ubuntu1404-desktop --provider virtualbox --box-version 2.0.5`
* shiguredo
    * https://github.com/shiguredo/packer-templates/tree/develop/ubuntu-14.04