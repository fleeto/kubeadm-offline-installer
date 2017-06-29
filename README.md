# kubeadm-offline-installer
> Setup a cluster with kubeadm, without internet connections.

[Kubeadm](https://kubernetes.io/docs/setup/independent/install-kubeadm/) is a
great way to set up a kubernetes cluster.

But every time I'm setting up a new cluster with it, I have to keep the internet connection,
and do something like
`cat xxx EOF `, `yum install xxx`, when kubeadm finished, I still have to copy
config file, ca certs and save the tokens. this is boring, so I composed this
playbook, working for minimal CentOS 7, can install a cluster without internet.

## Usage

`ansible-playbook -i hosts/hosts.sample -u root cluster.yml`

1. Write down ip in the hosts file, here is a sample in `hosts/hosts.sample`.
2. Change the variables in `group_vars/all`.
3. Run the playbook.
4. You can find init/join script in `/usr/local/bin`.
5. Configuration files are stored in Master node's `/etc/kubernetes`
5. Enjoy it.

## Features

1. Offlineq
2. Support for different lvm configuration in CentOS.
3. Calico plugins included.
