# Known problems

## Sterling B2Bi in Multizone Environments on IBM Cloud

The **ibmc-file-gold-gid** StorageClass is not compatible with multizone environments. The following error will happen when you try to provide environment

```
failed to provision volume with StorageClass "ibmc-file-gold-gid": GID allocation not supported on Multi-Zone Cluster [Multi-Zone Cluster: Zones
```

You can modify the ansible-ibm-sterling scripts to use the ibmc-file-gold StorageClass, but this will result in the following error:

```
mkdir: cannot create directory '/ibm/trace/logs': Permission denied
chown: cannot access '/ibm/trace/logs/dbSetup': No such file or directory
```

This error occurs because the ibmc-file-gold StorageClass requires the container to run as root.

If your environment is multizone, you can adjust the scripts to use ibmc-file-gold by modifying the file:

```
roles/sb2b_deploy/defaults/main.yaml
````

and changing the storage_class object, then proceed with the installation. However, the ac, api, and asi pods will not reach the "ready" state and will restart.

To resolve this issue, create a pod to fix the permissions.


```yaml
apiVersion: v1
kind: Pod
metadata:
  name: fix-permission
  namespace: sterling-b2bi-poc01-app
spec:
  containers:
    - name: fix-permission
      image: 'busybox'
      command: ['sh','-c']
      args: ['chmod 777 /ibm/trace']
      volumeMounts:
        - name: logs
          mountPath: /ibm/trace
  volumes:
    - name: logs
      persistentVolumeClaim:
        claimName: s0-b2bi-logs
```


## Connect:Direct Versions: 6.3.0.0_ifix016 and Helm Version: 1.3.1

```
  SPCLI> SPCG760E rc=8 CMS KeyStore open exception - Invalid KeyStore Format..
  [2024/03/18 17:30:42.46 ] | [ERROR] | Failure in generating self-signed certificate with RC=8. Line no: 221
```

In IBM Cloud, the StorageClass of the **ReadWriteOnce** type, which is requested in the values.yaml of the Helm chart, is **ibmc-block-gold**.

But when using this storageClass I had permission problems. When changing to the **ibmc-file-gold** and/or **ibmc-file-gold-gid** storageClass, I had no problems running C:D in Container, both storageClasses are of the **ReadWriteMany** type.


