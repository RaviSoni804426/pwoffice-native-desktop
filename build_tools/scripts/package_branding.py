#!/usr/bin/env python
# -*- coding: utf-8 -*-

import package_utils as utils

onlyoffice = False
company_name = "PW Office"
company_name_l = "pwoffice"
publisher_name = "PW Office"
cert_name = "Ascensio System SIA"

s3_bucket = "repo-doc-onlyoffice-com"
s3_region = "eu-west-1"
s3_base_url = "https://s3.eu-west-1.amazonaws.com/repo-doc-onlyoffice-com"

if utils.is_windows():
  desktop_product_name = "Desktop Editors"
  desktop_product_name_s = desktop_product_name.replace(" ","")
  desktop_package_name = company_name + "-" + desktop_product_name_s
  desktop_changes_dir = "desktop-apps/win-linux/package/windows/update/changes"

if utils.is_macos():
  desktop_package_name = "PWOffice"
  desktop_build_dir = "desktop-apps/macos"
  desktop_branding_dir = "desktop-apps/macos"
  desktop_updates_dir = "build/update"
  desktop_changes_dir = "ONLYOFFICE/update/updates/ONLYOFFICE/changes"
  sparkle_base_url = "https://download.onlyoffice.com/install/desktop/editors/mac"

builder_product_name = "Document Builder"

if utils.is_linux():
  desktop_make_targets = [
    {
      "make": "tar",
      "src": "tar/*.tar*",
      "dst": "desktop/linux/generic/"
    },
    {
      "make": "deb",
      "src": "deb/*.deb",
      "dst": "desktop/linux/debian/"
    },
    {
      "make": "rpm",
      "src": "rpm/build/RPMS/*/*.rpm",
      "dst": "desktop/linux/rhel/"
    },
    {
      "make": "rpm-suse",
      "src": "rpm-suse/build/RPMS/*/*.rpm",
      "dst": "desktop/linux/suse/"
    }
  ]
  server_make_targets = [
    {
      "make": "deb",
      "src": "deb/*.deb",
      "dst": "server/linux/debian/"
    },
    {
      "make": "rpm",
      "src": "rpm/builddir/RPMS/*/*.rpm",
      "dst": "server/linux/rhel/"
    },
    {
      "make": "tar",
      "src": "*.tar*",
      "dst": "server/linux/snap/"
    }
  ]
