# Changelog

All notable changes to this project will be documented in this file.

## [1.3.0] - 2025-02-18

### signed_certificate Role

- Restructured role to match *trippsc2.general.generate_csr* role and make writing certificate to file optional.

## [1.2.4] - 2025-01-07

### Collection

- Added Changelog.
- Updated collection README documentation.

## [1.2.3] - 2024-10-22

### certificate_authority Role

- Removed `os_family` subset for fact gathering step as it is not used on Windows machines.

### sub_ca_certificate Role

- Removed `os_family` subset for fact gathering step as it is not used on Windows machines.

## [1.2.2] - 2024-09-06

### certificate_authority Role

- Added `no_log` tag to `winca_password` variable.

### sub_ca_certificate Role

- Changed task to get contents of the CSR from using *ansible.windows.slurp* module to using *ansible.builtin.slurp* module.

## [1.2.1] - 2024-08-09

### Collection

- Minimum Ansible version changed from `2.14` to `2.15` due to EOL status.

## [1.2.0] - 2024-07-26

### Collection

- Added dependency reference to **trippsc2.general** with a version requirement of `>=2.4.0`.

### signed_certificate Role

- Changed variable usage to reflect that *trippsc2.general.generate_csr* role requires `cert_private_key_path` and `cert_certificate_path` variables to be defined.

## [1.1.6] - 2024-07-26

### certificate_authority Role

- Changed the implementation of the `winca_crypto_provider_algorithm` and `winca_key_length` variables for readability and maintainability.
- Changed formatting of vars file for readability.

### signed_certificate Role

- Changed the structure of `cert_certificate_path`, `cert_private_key_path`, and `cert_csr_tmp_path` to allow for platform-specific default values.

### sub_ca_certificate Role

- Changed formatting of template file and vars file for readability.

## [1.1.5] - 2024-07-10

### certificate_authority Role

- Separated `winca_crypto_provider_name` variable that previously defined the cryptography provider name and cryptographic algorithm in a single variable into `winca_crypto_provider_name` (defining the cryptography provider name) and `winca_crypto_provider_algorithm` (defining the cryptographic algorithm) variables.
- Added validating for the `winca_key_length` variable that refers to `winca_crypto_provider_algorithm` variable to determine allowed values.

## [1.1.4] - 2024-07-08

### Collection

- Updated manifest file to ensure that molecule tests are not included in releases.

## [1.1.3] - 2024-07-07

### certificate_authority Role

- Added validation that the system is a running Windows Server.
- Added validation that a certification authority that is AD-integrated must be a domain member.

### signed_certificate Role

- Added tasks to make use of the `ssl-cert` package on Debian-based systems by adding the owner to the `ssl-cert` group.

### sub_ca_certificate Role

- Added validation that the system is a running Windows Server.

## [1.1.2] - 2024-06-30

### certificate_authority Role

- Fixed documentation to properly include role dependencies.

## [1.1.1] - 2024-06-24

### certificate_authority Role

- Removed steps to install `NuGet` package provider, `PowerShellGet` module, `PackageManagement` module, and `PSGallery` repository from tasks.
- Added role dependency on *trippsc2.windows.install_psgallery* role to install `NuGet` package provider, `PowerShellGet` module, `PackageManagement` module, and `PSGallery` repository.

## [1.1.0] - 2024-06-24

### Collection

- Removed dependency reference to **trippsc2.general** collection.
- Added dependency reference to **trippsc2.windows** collection.

### certificate_authority Role

- Changed reference to *trippsc2.general.win_package_provider* module to *trippsc2.windows.win_package_provider* module.

## [1.0.1] - 2024-06-20

### certificate_authority Role

- Updated documentation and role metadata for readability.

### signed_certificate Role

- Updated documentation and role metadata for readability.

### sub_ca_certificate Role

- Updated documentation and role metadata for readability.

## [1.0.0] - 2024-06-11

### Collection

- Initial release.
- *certificate_authority* role added.
- *signed_certificate* role added.
- *sub_ca_certificate* role added.
