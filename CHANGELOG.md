# Changelog

All notable changes to this project will be documented in this file.

## [1.4.0] - 2025-02-20

### Role - signed_certificate

- Added support for Nobara Linux to allow for local testing of the role in certain contexts.
- Removed all support for CSR to file.  If this is needed, copy the contents of `cert_csr_content` to a file using a task.

## [1.3.0] - 2025-02-18

### Role - signed_certificate

- Restructured role to match *trippsc2.general.generate_csr* role and make writing certificate to file optional.

## [1.2.4] - 2025-01-07

### Collection

- Added Changelog.
- Updated collection README documentation.

## [1.2.3] - 2024-10-22

### Role - certificate_authority

- Removed `os_family` subset for fact gathering step as it is not used on Windows machines.

### Role - sub_ca_certificate

- Removed `os_family` subset for fact gathering step as it is not used on Windows machines.

## [1.2.2] - 2024-09-06

### Role - certificate_authority

- Added `no_log` tag to `winca_password` variable.

### Role - sub_ca_certificate

- Changed task to get contents of the CSR from using *ansible.windows.slurp* module to using *ansible.builtin.slurp* module.

## [1.2.1] - 2024-08-09

### Collection

- Minimum Ansible version changed from `2.14` to `2.15` due to EOL status.

## [1.2.0] - 2024-07-26

### Collection

- Added dependency reference to **trippsc2.general** with a version requirement of `>=2.4.0`.

### Role - signed_certificate

- Changed variable usage to reflect that *trippsc2.general.generate_csr* role requires `cert_private_key_path` and `cert_certificate_path` variables to be defined.

## [1.1.6] - 2024-07-26

### Role - certificate_authority

- Changed the implementation of the `winca_crypto_provider_algorithm` and `winca_key_length` variables for readability and maintainability.
- Changed formatting of vars file for readability.

### Role - signed_certificate

- Changed the structure of `cert_certificate_path`, `cert_private_key_path`, and `cert_csr_tmp_path` to allow for platform-specific default values.

### Role - sub_ca_certificate

- Changed formatting of template file and vars file for readability.

## [1.1.5] - 2024-07-10

### Role - certificate_authority

- Separated `winca_crypto_provider_name` variable that previously defined the cryptography provider name and cryptographic algorithm in a single variable into `winca_crypto_provider_name` (defining the cryptography provider name) and `winca_crypto_provider_algorithm` (defining the cryptographic algorithm) variables.
- Added validating for the `winca_key_length` variable that refers to `winca_crypto_provider_algorithm` variable to determine allowed values.

## [1.1.4] - 2024-07-08

### Collection

- Updated manifest file to ensure that molecule tests are not included in releases.

## [1.1.3] - 2024-07-07

### Role - certificate_authority

- Added validation that the system is a running Windows Server.
- Added validation that a certification authority that is AD-integrated must be a domain member.

### Role - signed_certificate

- Added tasks to make use of the `ssl-cert` package on Debian-based systems by adding the owner to the `ssl-cert` group.

### Role - sub_ca_certificate

- Added validation that the system is a running Windows Server.

## [1.1.2] - 2024-06-30

### Role - certificate_authority

- Fixed documentation to properly include role dependencies.

## [1.1.1] - 2024-06-24

### Role - certificate_authority

- Removed steps to install `NuGet` package provider, `PowerShellGet` module, `PackageManagement` module, and `PSGallery` repository from tasks.
- Added role dependency on *trippsc2.windows.install_psgallery* role to install `NuGet` package provider, `PowerShellGet` module, `PackageManagement` module, and `PSGallery` repository.

## [1.1.0] - 2024-06-24

### Collection

- Removed dependency reference to **trippsc2.general** collection.
- Added dependency reference to **trippsc2.windows** collection.

### Role - certificate_authority

- Changed reference to *trippsc2.general.win_package_provider* module to *trippsc2.windows.win_package_provider* module.

## [1.0.1] - 2024-06-20

### Role - certificate_authority

- Updated documentation and role metadata for readability.

### Role - signed_certificate

- Updated documentation and role metadata for readability.

### Role - sub_ca_certificate

- Updated documentation and role metadata for readability.

## [1.0.0] - 2024-06-11

### Collection

- Initial release.
- *certificate_authority* role added.
- *signed_certificate* role added.
- *sub_ca_certificate* role added.
