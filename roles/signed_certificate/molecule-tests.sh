#! /bin/bash

set -e

MOLECULE_BOX="rocky8_cis" molecule test -s linux
MOLECULE_BOX="w2022_cis" molecule test -s win
MOLECULE_BOX="debian12_base" molecule test -s linux
MOLECULE_BOX="ubuntu2404_base" molecule test -s linux
MOLECULE_BOX="w11_23h2_base" molecule test -s win

MOLECULE_BOX="rocky9_base" molecule test -s linux

MOLECULE_BOX="debian11_base" molecule test -s linux

MOLECULE_BOX="w2019_cis" molecule test -s win
MOLECULE_BOX="w10_22h2_base" molecule test -s win

MOLECULE_BOX="ubuntu2204_base" molecule test -s linux
MOLECULE_BOX="ubuntu2004_base" molecule test -s linux
