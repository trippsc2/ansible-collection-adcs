#! /bin/bash

cd ./roles/certificate_authority

aar_doc . markdown

cd ../signed_certificate

aar_doc . markdown

cd ../sub_ca_certificate

aar_doc . markdown
