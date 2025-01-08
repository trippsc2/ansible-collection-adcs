#! /bin/bash

cd ./roles/certificate_authority

aar-doc . markdown

cd ../signed_certificate

aar-doc . markdown

cd ../sub_ca_certificate

aar-doc . markdown
