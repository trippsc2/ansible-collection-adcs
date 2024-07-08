<!-- BEGIN_ANSIBLE_DOCS -->

# Ansible Role: trippsc2.adcs.certificate_authority
Version: 1.1.4

This role installs and configures a Windows machine as a Active Directory Certificate Services Certification Authority.

## Requirements

| Platform | Versions |
| -------- | -------- |
| Windows | <ul><li>2019</li><li>2022</li></ul> |

## Dependencies
| Role |
| ---- |
| trippsc2.windows.install_psgallery |

| Collection |
| ---------- |
| ansible.windows |
| community.windows |
| trippsc2.windows |

## Role Arguments
|Option|Description|Type|Required|Choices|Default|
|---|---|---|---|---|---|
| winca_is_root_ca | <p>Whether to install the Certificate Authority as a Root CA.</p> | bool | no |  | true |
| winca_is_ad_integrated | <p>Whether to integrate the Certificate Authority with Active Directory.</p><p>If `true`, the system must be joined to an Active Directory domain and the account used must be an Enterprise Admin.</p> | bool | no |  | false |
| winca_certificate_type | <p>The type of CA certificate.</p><p>If `winca_is_root_ca` is set to `true` or `winca_is_ad_integrated` is set to `false`, this is ignored.</p><p>If set to `existing`, an existing CA certificate matching `winca_ca_cert_common_name` is used.</p><p>If set to `enterprise_parent`, a new CA certificate is generated and signed by the parent.</p> | str | no | <ul><li>existing</li><li>enterprise_parent</li></ul> | existing |
| winca_install_management_tools | <p>Whether to install the Remote Server Administration Tools (RSAT) for Certificate Authority feature.</p> | bool | no |  | true |
| winca_username | <p>The username to use when installing the Certificate Authority.</p><p>This account must have administrative rights on the target system.</p><p>If `winca_is_ad_integrated` is `true`, this account must be an Enterprise Admin.</p> | str | yes |  |  |
| winca_password | <p>The password for the `winca_username` account.</p> | str | yes |  |  |
| winca_ca_cert_common_name | <p>The common name for the Certificate Authority certificate.</p><p>If `winca_is_root_ca` is set to `true`, this is the common name for the generated Root CA certificate.</p><p>If `winca_is_root_ca` is set to `false` and either `winca_is_ad_integrated` is set to `false` or `winca_certificate_type` is set to `existing`, this is used to lookup the existing CA certificate by common name.</p><p>If `winca_is_root_ca` is set to `false`, `winca_is_ad_integrated` is set to `true`, and `winca_certificate_type` is set to `enterprise_parent`, this is used as the CA certificate common name to be signed by the parent.</p> | str | yes |  |  |
| winca_ca_distinguished_name_suffix | <p>The distinguished name suffix for the Certificate Authority.</p><p>If `winca_is_root_ca` is set to `true`, this is the distinguished name suffix for the generated Root CA certificate.</p><p>If `winca_is_root_ca` is set to `false`, `winca_is_ad_integrated` is set to `true`, and `winca_certificate_type` is set to `enterprise_parent`, this is used as the CA certificate distinguished name suffix to be signed by the parent.</p> | str | no |  |  |
| winca_crypto_provider_name | <p>The cryptographic provider name to use when generating the CA key pair.</p><p>This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`.</p> | str | no |  | RSA#Microsoft Software Key Storage Provider |
| winca_database_directory | <p>The directory to store the Certificate Authority database.</p> | str | no |  | C:\Windows\system32\CertLog |
| winca_hash_algorithm_name | <p>The hash algorithm name to use when generating the CA key pair.</p><p>This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`.</p> | str | no | <ul><li>sha256</li><li>sha3_256</li><li>sha3_384</li><li>sha3_512</li><li>sha384</li><li>sha512</li></ul> | sha256 |
| winca_ignore_unicode | <p>Whether to ignore Unicode characters in the distinguished name.</p><p>This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`.</p> | bool | no |  | false |
| winca_key_length | <p>The key length to use when generating the CA key pair.</p><p>This is only used when `winca_is_root_ca` is set to `true` or `winca_certificate_type` is set to `enterprise_parent`.</p> | int | no |  | 2048 |
| winca_overwrite_existing_ca_in_domain | <p>Whether to overwrite the existing Certificate Authority in the domain.</p><p>This is only used when `winca_is_ad_integrated` is set to `true`.</p> | bool | no |  | false |
| winca_overwrite_existing_database | <p>Whether to overwrite the existing Certificate Authority database.</p> | bool | no |  | false |
| winca_overwrite_existing_key | <p>Whether to overwrite the existing CA key pair.</p><p>This is only used when `winca_is_root_ca` is set to `true`.</p> | bool | no |  | false |
| winca_ca_cert_validity_period | <p>The validity period for the CA certificate.</p><p>This is only used when `winca_is_root_ca` is set to `true`.</p> | int | no |  | 5 |
| winca_ca_cert_validity_period_unit | <p>The validity period unit for the CA certificate.</p><p>This is only used when `winca_is_root_ca` is set to `true`.</p> | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Years |
| winca_add_certenroll_virtual_directory | <p>Whether to install Internet Information Services (IIS) and add the CertEnroll virtual directory to the default website.</p><p>Installing the Certification Authority Web Enrollment feature handles this for you.</p><p>If this is not an offline Root CA, it is recommended to set this to `true` or the Certification Authority Web Enrollment feature is installed and configured.</p> | bool | no |  | false |
| winca_parent_ca_config | <p>The parent CA configuration to use when generating the CA certificate.</p><p>This is only used when `winca_certificate_type` is set to `enterprise_parent`.</p><p>This should be formatted as `<server-fqdn>\<ca-common-name>`.</p> | str | no |  |  |
| winca_log_directory | <p>The directory to store the Certificate Authority log files.</p> | str | no |  | C:\Windows\system32\CertLog |
| winca_ca_cert_publication_urls | <p>The URLs for the Certificate Authority certificate publication.</p><p>Refer to this Technet article for formatting: https://social.technet.microsoft.com/wiki/contents/articles/18590.recommended-windows-ca-publication-urls-flags-two-tier-small-scale-internal-cas.aspx</p> | list of 'str' | no |  |  |
| winca_crl_publication_urls | <p>The URLs for the Certificate Revocation List publication.</p><p>Refer to this Technet article for formatting: https://social.technet.microsoft.com/wiki/contents/articles/18590.recommended-windows-ca-publication-urls-flags-two-tier-small-scale-internal-cas.aspx</p> | list of 'str' | no |  |  |
| winca_issued_cert_validity_period | <p>The maximum validity period for issued certificates.</p> | int | no |  | 5 |
| winca_issued_cert_validity_period_unit | <p>The maximum validity period unit for issued certificates.</p> | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Years |
| winca_ad_config_distinguished_name | <p>The distinguished name for the Active Directory configuration.</p><p>This is must be specified on a Standalone Root CA, if it is meant to sign Enterprise Subordinate CA certificates.</p> | str | no |  |  |
| winca_ad_base_distinguished_name | <p>The base distinguished name for the Active Directory configuration.</p><p>This is must be specified on a Standalone Root CA, if it is meant to sign Enterprise Subordinate CA certificates.</p> | str | no |  |  |
| winca_audit_filter | <p>The types of event types to log for the Certificate Authority.</p> | list of 'str' | no | <ul><li>StartAndStopADCS</li><li>BackupAndRestoreCADatabase</li><li>IssueAndManageCertificateRequests</li><li>RevokeCertificatesAndPublishCRLs</li><li>ChangeCASecuritySettings</li><li>StoreAndRetrieveArchivedKeys</li><li>ChangeCAConfiguration</li></ul> | ["StartAndStopADCS", "BackupAndRestoreCADatabase", "IssueAndManageCertificateRequests", "RevokeCertificatesAndPublishCRLs", "ChangeCASecuritySettings", "StoreAndRetrieveArchivedKeys", "ChangeCAConfiguration"] |
| winca_crl_overlap_period | <p>The overlap period for the Certificate Revocation List deltas to be published.</p> | int | no |  | 1 |
| winca_crl_overlap_period_unit | <p>The overlap period unit for the Certificate Revocation List deltas to be published.</p> | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Days |
| winca_crl_period | <p>The period for the full Certificate Revocation List to be published.</p> | int | no |  | 1 |
| winca_crl_period_unit | <p>The period unit for the full Certificate Revocation List to be published.</p> | str | no | <ul><li>Hours</li><li>Days</li><li>Weeks</li><li>Months</li><li>Years</li></ul> | Days |


## License
MIT

## Author and Project Information
Jim Tarpley
<!-- END_ANSIBLE_DOCS -->
