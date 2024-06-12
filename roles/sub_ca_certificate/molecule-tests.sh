#! /bin/bash

set -e

MOLECULE_BOX="w2019_cis" molecule test
MOLECULE_BOX="w2022_cis" molecule test
