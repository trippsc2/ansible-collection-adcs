<!-- BEGIN_ANSIBLE_DOCS -->

# Ansible Role: trippsc2.adcs.signed_certificate
Version: 1.4.0

This role generates a self-signed TLS certificate.

The role depends on the `trippsc2.general.generate_csr` role to generate a private key and CSR.

The role does the following:
  - Runs the `trippsc2.general.generate_csr` role to generate a private key and CSR, if needed.
  - If the private key and CSR are generated, the role signs the CSR with the AD CS certification authority and stores it in the `cert_certificate_content` variable.
  - Optionally, the role will save the certificate to a file.


## Requirements

| Platform | Versions |
| -------- | -------- |
| Debian | <ul><li>bullseye</li><li>bookworm</li></ul> |
| EL | <ul><li>8</li><li>9</li></ul> |
| Windows | <ul><li>2019</li><li>2022</li></ul> |
| Ubuntu | <ul><li>focal</li><li>jammy</li><li>noble</li></ul> |

## Dependencies
| Role |
| ---- |
| trippsc2.general.generate_csr |

| Collection |
| ---------- |
| ansible.windows |
| trippsc2.general |

## Role Arguments
|Option|Description|Type|Required|Choices|Default|
|---|---|---|---|---|---|
| cert_signing_ca_hostname | <p>The hostname of the Certificate Authority to sign the certificate.</p> | str | yes |  |  |
| cert_signing_ca_csr_path | <p>The path to the Certificate Signing Request (CSR) file to sign.</p> | path | no |  | C:\Windows\temp\{{ inventory_hostname }}.req |
| cert_signing_ca_fqdn | <p>The Fully Qualified Domain Name (FQDN) of the Certificate Authority to sign the certificate.</p><p>This variable is only used if the `cert_signing_ca_config` option is not defined.</p> | str | no |  | {{ hostvars[cert_signing_ca_hostname].ansible_fqdn }} |
| cert_signing_ca_common_name | <p>The Common Name (CN) of the Certificate Authority to sign the certificate.</p><p>This variable is only used if the `cert_signing_ca_config` option is not defined.</p> | str | no |  |  |
| cert_signing_ca_config | <p>The configuration of the Certificate Authority to sign the certificate.</p><p>This variable is only used if the `cert_signing_ca_fqdn` and `cert_signing_ca_common_name` options are not defined.</p> | str | no |  | {{ cert_signing_ca_fqdn }}\{{ cert_signing_ca_common_name }} |
| cert_line_break_character | <p>The line break character to use in the certificate.</p> | str | no |  | \n |
| cert_certificate_to_file | <p>Whether to save the certificate to a file.</p><p>If set to `true`, the certificate will be saved to the `cert_certificate_path` path.</p> | bool | no |  | True |
| cert_certificate_to_variable | <p>Whether to save the certificate to a variable.</p><p>If set to `true`, the certificate will be saved to the `cert_certificate_content` variable.</p> | bool | no |  | False |
| cert_certificate_owner | <p>The owner of the certificate on Linux systems.</p> | str | no |  | root |
| cert_certificate_group | <p>The group of the certificate on Linux systems.</p> | str | no |  | root |
| cert_certificate_mode | <p>The mode of the certificate on Linux systems.</p> | str | no |  | 0644 |


## License
MIT

## Author and Project Information
Jim Tarpley (@trippsc2)
<!-- END_ANSIBLE_DOCS -->
