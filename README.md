# Ansible Collection: trippsc2.adcs
This collection contains modules and roles for configuring Active Directory Certificate Services.

## Content

### Roles

- [certificate_authority](roles/certificate_authority/README.md) - This role installs and configures a Windows machine as a Active Directory Certificate Services Certification Authority.
- [signed_certificate](roles/signed_certificate/README.md) - This role issues a certificate from a AD CS Certification Authority.
- [sub_ca_certificate](roles/sub_ca_certificate/README.md) - This role signs a subordinate CA certificate on a Windows machine.
