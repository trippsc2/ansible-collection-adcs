<!-- BEGIN_ANSIBLE_DOCS -->

# Ansible Role: trippsc2.adcs.sub_ca_certificate
Version: 1.4.1

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
| winsubca_renewal_days | <p>Number of days before certificate expiration to renew.</p> | int | no |  | 30 |
| winsubca_request_config_file_temp_path | <p>Path to store the temporary request configuration file.</p> | path | no |  | C:\Windows\temp\cacert.inf |
| winsubca_request_file_temp_path | <p>Path to store the temporary request file.</p> | path | no |  | C:\Windows\temp\cacert.req |
| winsubca_signing_ca_cert_file_temp_path | <p>Path to the signing CA certificate file.</p> | path | no |  | C:\Windows\temp\signingcacert.crt |
| winsubca_cert_file_temp_path | <p>Path to store the signed certificate file.</p> | path | no |  | C:\Windows\temp\cacert.crt |
| winsubca_ca_common_name | <p>Common name of the Certificate Authority.</p> | str | yes |  |  |
| winsubca_ca_distinguished_name_suffix | <p>Distinguished name suffix of the Certificate Authority.</p> | str | yes |  |  |
| winsubca_signing_ca_hostname | <p>Ansible inventory hostname of the signing CA.</p> | str | yes |  |  |
| winsubca_signing_ca_fqdn | <p>Fully qualified domain name of the signing CA.</p><p>If `winsubca_signing_ca_config` and `winsubca_rootca_file_path` are provided, this value is ignored.</p> | str | no |  | {{ hostvars[winsubca_signing_ca_hostname].ansible_fqdn }} |
| winsubca_signing_ca_common_name | <p>Common name of the signing CA.</p><p>If `winsubca_signing_ca_config` and `winsubca_rootca_file_path` are provided, this value is ignored.</p> | str | no |  |  |
| winsubca_signing_ca_config | <p>Configuration string for the signing CA.</p> | str | no |  | {{ winsubca_signing_ca_fqdn }}\{{ winsubca_signing_ca_common_name }} |
| winsubca_rootca_file_path | <p>Path to the root CA certificate file.</p> | path | no |  | C:\Windows\system32\CertSrv\CertEnroll\{{ winsubca_signing_ca_fqdn }}_{{ winsubca_signing_ca_common_name }}.crt |
| winsubca_cert_line_break_character | <p>Line break character for the certificate file.</p> | str | no |  | \r\n |


## License
MIT

## Author and Project Information
Jim Tarpley (@trippsc2)
<!-- END_ANSIBLE_DOCS -->
