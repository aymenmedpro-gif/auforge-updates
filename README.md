# AuForge Maint — updates

This repository is the update channel of **AuForge Maint**, the maintenance management system by AuForge.

| File | Purpose |
| --- | --- |
| `manifest.json` | Signed update information read by every installed copy: latest version, download link and SHA-256 of the installer, cancelled licenses, message to customers. |
| Releases | The Windows installers (`AuForgeMaint-Setup-<version>.exe`). |

`manifest.json` is signed with the vendor's private key (Ed25519). Installed copies verify the signature with the
public key built into the program and ignore the file if it was changed by anyone else, so it must only be produced
with the vendor tool (`AuForge-Vendor-Tools.exe` → *Remote control* → *Save*). **Never put the private key in this
repository.**

## Download (Windows)

The installer is stored in parts (GitHub limits the size of a single file). Download every file in
[`releases/v2.3.0`](releases/v2.3.0) into one folder and double-click `INSTALL-AuForgeMaint.bat`: it joins the parts,
checks the result is identical to the original (SHA-256) and starts the installer. Installed copies update
themselves; they download and verify the parts automatically.

## Publishing a new version

1. In the vendor tool choose *Remote control → Publish a new version*, give the version number and the Setup .exe,
   and answer **y** to *Split into parts*. It writes `releases/v<version>/` and a new `manifest.json`.
2. Upload that folder and `manifest.json` here (GitHub: *Add file → Upload files*; every part is under 25 MB).
