minio
=========

Deploy Minio S3 storage


Role Variables
--------------

| Environment Variable        | Default Value         | Required | Description                                      |
|-----------------------------|-----------------------|----------|--------------------------------------------------|
| MINIO_PROVIDER              | standard              | No       | Currently supported providers: standard          |
| MINIO_ACTION                | install               | No       | Currently supported action: install              |
| MINIO_NAMESPACE             | sterling-minio        | No       | Namespace for MinIO                              |
| MINIO_ROOT_USER             | root                  | No       | Root user for MinIO                              |
| MINIO_ROOT_PASSWORD         | passw0rd              | No       | Root password for MinIO                          |
| MINIO_STORAGE_SIZE          | 10Gi                  | No       | Storage size for MinIO                           |



Currently supported providers is only standard. Minio provider is in development.