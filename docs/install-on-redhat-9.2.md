* Install Ansible 

```
dnf -y install ansible-core
```

* ERROR! couldn't resolve module/action 'selinux'
```
ansible-galaxy collection install ansible.posix
```

* ERROR! couldn't resolve module/action 'pam_limits'

```
ansible-galaxy collection install community.general
```

