cert_manager
===============================================================================
Deploy **Red Hat Certificate Manager Operator** into the target OCP cluster.

!!! tip
    DO NOT USE 'Community Certificate Manager', STILL NOT WORKING

- Red Hat Certificate Manager Operatos will be installed into the `cert-manager-operator` namespace and the Operand will be created in the `cert-manager` namespace.
- Community Certificate Manager Operatos will be installed into the `cert-manager-community-operator` namespace and the Operand will be created in the `cert-manager-community` namespace.


Prerequisites
-------------------------------------------------------------------------------
### Red Hat Certificate Manager
You must have already installed the **Red Hat Operators** CatalogSource.

### Community Certificate Manager
You must have already installed the **Community Operators** CatalogSource.

Role Variables
-------------------------------------------------------------------------------
### cert_manager_action
Inform the role whether to perform an `install` or an `uninstall` the Certificate Manager service, action can also be set to `none` to instruct the role to take no action.

- Optional
- Environment Variable: `CERT_MANAGER_ACTION`
- Default: `install`

### cert_manager_provider
Choose which flavour of Certificate Manager to install; Red Hat (`redhat`) or Community (`community`)

- Optional
- Environment Variable: `CERT_MANAGER_PROVIDER`
- Default: `community`

**Note:** Certificate Manager is a cluster-wide dependency, therefore be really careful when uninstalling it as this might be used by several applications and dependencies installed in the cluster.

Example Playbook
-------------------------------------------------------------------------------
After installing the Ansible Collection you can include this role in your own custom playbooks.

### Red Hat Certificate Manager
```yaml
- hosts: localhost
  vars:
    - cert_manager_action: install
    - cert_manager_provider: redhat
  roles:
    - cert_manager
```

### Community Certificate Manager
```yaml
- hosts: localhost
  vars:
    - cert_manager_action: install
    - cert_manager_provider: community
  roles:
    - cert_manager
```


License
-------------------------------------------------------------------------------
EPL-2.0
