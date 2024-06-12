<!-- BEGIN_ANSIBLE_DOCS -->

# Ansible Role: trippsc2.adcs.sub_ca_certificate
Version: 1.0.0

This role signs a subordinate CA certificate on a Windows machine.

## Requirements

| Platform | Versions |
| -------- | -------- |
| Windows | <ul><li>2019</li><li>2022</li></ul> |

## Dependencies

| Collection |
| ---------- |
| ansible.windows |
| community.windows |

## Role Arguments
|Option|Description|Type|Required|Choices|Default|
|---|---|---|---|---|---|
| winsubca_renewal_days | Number of days before certificate expiration to renew. | int | no |  | 30 |
| winsubca_request_config_file_temp_path | Path to store the temporary request configuration file. | path | no |  | C:\Windows\temp\cacert.inf |
| winsubca_request_file_temp_path | Path to store the temporary request file. | path | no |  | C:\Windows\temp\cacert.req |
| winsubca_signing_ca_cert_file_temp_path | Path to the signing CA certificate file. | path | no |  | C:\Windows\temp\signingcacert.crt |
| winsubca_cert_file_temp_path | Path to store the signed certificate file. | path | no |  | C:\Windows\temp\cacert.crt |
| winsubca_ca_common_name | Common name of the Certificate Authority. | str | yes |  |  |
| winsubca_ca_distinguished_name_suffix | Distinguished name suffix of the Certificate Authority. | str | yes |  |  |
| winsubca_signing_ca_hostname | Ansible inventory hostname of the signing CA. | str | yes |  |  |
| winsubca_signing_ca_fqdn | Fully qualified domain name of the signing CA. If `winsubca_signing_ca_config` and `winsubca_rootca_file_path` are provided, this value is ignored. | str | no |  | {{ hostvars[winsubca_signing_ca_hostname].ansible_fqdn }} |
| winsubca_signing_ca_common_name | Common name of the signing CA. If `winsubca_signing_ca_config` and `winsubca_rootca_file_path` are provided, this value is ignored. | str | no |  |  |
| winsubca_signing_ca_config | Configuration string for the signing CA. | str | no |  | {{ winsubca_signing_ca_fqdn }}\{{ winsubca_signing_ca_common_name }} |
| winsubca_rootca_file_path | Path to the root CA certificate file. | path | no |  | C:\Windows\system32\CertSrv\CertEnroll\{{ winsubca_signing_ca_fqdn }}_{{ winsubca_signing_ca_common_name }}.crt |
| winsubca_cert_line_break_character | Line break character for the certificate file. | str | no |  | \r\n |


## License
MIT

## Author and Project Information
Jim Tarpley
<!-- END_ANSIBLE_DOCS -->
