<!-- BEGIN_ANSIBLE_DOCS -->

# Ansible Role: trippsc2.adcs.certificate_authority
Version: 1.0.0

This role installs and configures a Windows machine as a Active Directory Certificate Services Certification Authority.

## Requirements

| Platform | Versions |
| -------- | -------- |
| Windows | <ul><li>2019</li><li>2022</li></ul> |

## Dependencies

| Collection |
| ---------- |
| ansible.windows |
| community.windows |
| trippsc2.general |

## Role Arguments
|Option|Description|Type|Required|Choices|Default|
|---|---|---|---|---|---|
| winca_is_root_ca | Whether to install the Certificate Authority as a Root CA. | bool | no |  | true |
| winca_is_ad_integrated | Whether to integrate the Certificate Authority with Active Directory. If `true`, the system must be joined to an Active Directory domain and the account used must be an Enterprise Admin. | bool | no |  | false |
| winca_certificate_type | The type of CA certificate. If `winca_is_root_ca` is set to `true` or `winca_is_ad_integrated` is set to `false`, this is ignored. If set to `existing`, an existing CA certificate matching `winca_ca_cert_common_name` is used. If set to `enterprise_parent`, a new CA certificate is generated and signed by the parent. | str | no | <ul><li>existing</li><li>enterprise_parent</li></ul> | existing |
| winca_install_management_tools | Whether to install the Remote Server Administration Tools (RSAT) for Certificate Authority feature. | bool | no |  | true |
| winca_username | The username to use when installing the Certificate Authority. This account must have administrative rights on the target system. If `winca_is_ad_integrated` is `true`, this account must be an Enterprise Admin. | str | yes |  |  |
| winca_password | The password for the `winca_username` account. | str | yes |  |  |
| winca_ca_cert_common_name | The common name for the Certificate Authority certificate. If `winca_is_root_ca` is set to `true`, this is the common name for the generated Root CA certificate. If `winca_is_root_ca` is set to `false` and either `winca_is_ad_integrated` is set to `false` or `winca_certificate_type` is set to `existing`, this is used to lookup the existing CA certificate by common name. If `winca_is_root_ca` is set to `false`, `winca_is_ad_integrated` is set to `true`, and `winca_certificate_type` is set to `enterprise_parent`, this is used as the CA certificate common name to be signed by the parent. | str | yes |  |  |
| winca_ca_distinguished_name_suffix | The distinguished name suffix for the Certificate Authority. If `winca_is_root_ca` is set to `true`, this is the distinguished name suffix for the generated Root CA certificate. If `winca_is_root_ca` is set to `false`, `winca_is_ad_integrated` is set to `true`, and `winca_certificate_type` is set to `enterprise_parent`, this is used as the CA certificate distinguished name suffix to be signed by the parent. | str | no |  |  |
| winca_crypto_provider_name | The cryptographic provider name to use when generating the CA key pair. This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`. | str | no |  | RSA#Microsoft Software Key Storage Provider |
| winca_database_directory | The directory to store the Certificate Authority database. | str | no |  | C:\Windows\system32\CertLog |
| winca_hash_algorithm_name | The hash algorithm name to use when generating the CA key pair. This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`. | str | no | <ul><li>sha256</li><li>sha3_256</li><li>sha3_384</li><li>sha3_512</li><li>sha384</li><li>sha512</li></ul> | sha256 |
| winca_ignore_unicode | Whether to ignore Unicode characters in the distinguished name. This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`. | bool | no |  | false |
| winca_key_length | The key length to use when generating the CA key pair. This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`. | int | no |  | 2048 |
| winca_overwrite_existing_ca_in_domain | Whether to overwrite the existing Certificate Authority in the domain. This is only used when `winca_is_ad_integrated` is set to `true`. | bool | no |  | false |
| winca_overwrite_existing_database | Whether to overwrite the existing Certificate Authority database. | bool | no |  | false |
| winca_overwrite_existing_key | Whether to overwrite the existing CA key pair. This is only used when `winca_is_root_ca` is set to `true`. | bool | no |  | false |
| winca_ca_cert_validity_period | The validity period for the CA certificate. This is only used when `winca_is_root_ca` is set to `true`. | int | no |  | 5 |
| winca_ca_cert_validity_period_unit | The validity period unit for the CA certificate. This is only used when `winca_is_root_ca` is set to `true`. | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Years |
| winca_add_certenroll_virtual_directory | Whether to install Internet Information Services (IIS) and add the CertEnroll virtual directory to the default website. Installing the Certification Authority Web Enrollment feature handles this for you. If this is not an offline Root CA, it is recommended to set this to `true` or the Certification Authority Web Enrollment feature is installed and configured. | bool | no |  | false |
| winca_parent_ca_config | The parent CA configuration to use when generating the CA certificate. This is only used when `winca_certificate_type` is set to `enterprise_parent`. This should be formatted as `<server-fqdn>\<ca-common-name>`. | str | no |  |  |
| winca_log_directory | The directory to store the Certificate Authority log files. | str | no |  | C:\Windows\system32\CertLog |
| winca_ca_cert_publication_urls | The URLs for the Certificate Authority certificate publication. Refer to this Technet article for formatting: https://social.technet.microsoft.com/wiki/contents/articles/18590.recommended-windows-ca-publication-urls-flags-two-tier-small-scale-internal-cas.aspx | list of 'str' | no |  |  |
| winca_crl_publication_urls | The URLs for the Certificate Revocation List publication. Refer to this Technet article for formatting: https://social.technet.microsoft.com/wiki/contents/articles/18590.recommended-windows-ca-publication-urls-flags-two-tier-small-scale-internal-cas.aspx | list of 'str' | no |  |  |
| winca_issued_cert_validity_period | The maximum validity period for issued certificates. | int | no |  | 5 |
| winca_issued_cert_validity_period_unit | The maximum validity period unit for issued certificates. | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Years |
| winca_ad_config_distinguished_name | The distinguished name for the Active Directory configuration. This is must be specified on a Standalone Root CA, if it is meant to sign Enterprise Subordinate CA certificates. | str | no |  |  |
| winca_ad_base_distinguished_name | The base distinguished name for the Active Directory configuration. This is must be specified on a Standalone Root CA, if it is meant to sign Enterprise Subordinate CA certificates. | str | no |  |  |
| winca_audit_filter | The types of event types to log for the Certificate Authority. | list of 'str' | no | <ul><li>StartAndStopADCS</li><li>BackupAndRestoreCADatabase</li><li>IssueAndManageCertificateRequests</li><li>RevokeCertificatesAndPublishCRLs</li><li>ChangeCASecuritySettings</li><li>StoreAndRetrieveArchivedKeys</li><li>ChangeCAConfiguration</li></ul> | ["StartAndStopADCS", "BackupAndRestoreCADatabase", "IssueAndManageCertificateRequests", "RevokeCertificatesAndPublishCRLs", "ChangeCASecuritySettings", "StoreAndRetrieveArchivedKeys", "ChangeCAConfiguration"] |
| winca_crl_overlap_period | The overlap period for the Certificate Revocation List deltas to be published. | int | no |  | 1 |
| winca_crl_overlap_period_unit | The overlap period unit for the Certificate Revocation List deltas to be published. | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Days |
| winca_crl_period | The period for the full Certificate Revocation List to be published. | int | no |  | 1 |
| winca_crl_period_unit | The period unit for the full Certificate Revocation List to be published. | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Days |


## License
MIT

## Author and Project Information
Jim Tarpley
<!-- END_ANSIBLE_DOCS -->
