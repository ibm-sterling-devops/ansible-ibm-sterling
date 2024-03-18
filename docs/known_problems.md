# Known problems

## Connect:Direct Versions: 6.3.0.0_ifix016 and Helm Version: 1.3.1

```
  SPCLI> SPCG760E rc=8 CMS KeyStore open exception - Invalid KeyStore Format..
  [2024/03/18 17:30:42.46 ] | [ERROR] | Failure in generating self-signed certificate with RC=8. Line no: 221
```

In IBM Cloud, the StorageClass of the **ReadWriteOnce** type, which is requested in the values.yaml of the Helm chart, is **ibmc-block-gold**.

But when using this storageClass I had permission problems. When changing to the **ibmc-file-gold** and/or **ibmc-file-gold-gid** storageClass, I had no problems running C:D in Container, both storageClasses are of the **ReadWriteMany** type.