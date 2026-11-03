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

To publish a new version:

1. Create a release with tag `v<version>` and attach `AuForgeMaint-Setup-<version>.exe` (keep that exact name).
2. In the vendor tool choose *Remote control → Publish a new version*, using the release download link
   `https://github.com/aymenmedpro-gif/auforge-updates/releases/download/v<version>/AuForgeMaint-Setup-<version>.exe`.
3. Replace `manifest.json` here with the one the tool saved.
