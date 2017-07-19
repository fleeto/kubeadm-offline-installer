# kubeadm-offline-installer

- Upgraded to v1.7.1

没有好的完整的网络连接，Kubernetes 是很难搞的。

这里给出一个离线安装的 Release，尽量跟踪更新最新版本，给网络没那么方便的朋友们拿来玩。

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

1. Download and extract bin package from [Releases tab](https://github.com/fleeto/kubeadm-offline-installer/releases)
2. Write down ip in the hosts file, here is a sample in `hosts/hosts.sample`.
3. Change the variables in `group_vars/all`.
4. Run the playbook.
5. You can find init/join script in `/usr/local/bin`.
6. Configuration files are stored in Master node's `/etc/kubernetes`
7. Enjoy it.

## Features

1. Offline.
2. Support for different lvm configuration in CentOS.
3. Calico plugins included.
