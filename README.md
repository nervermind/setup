# Setup

Dieses Repository hilft dabei, eine Entwicklungsumgebung auf einem **MacOS**-Rechner einzurichten. Es enthält Skripte und Konfigurationsdateien, um alle benötigten Pakete und Anwendungen zu installieren, Konfigurationsdateien zu verwalten und bevorzugte MacOS-Einstellungen zu setzen.

## Funktionen

- Installiert alle von mir verwendeten Pakete und Anwendungen
- Verwendet [GNU Stow](https://www.gnu.org/software/stow/), um alle Konfigurationsdateien zu verwalten
- Setzt alle meine bevorzugten MacOS-Konfigurationen

## Installation

> **Warnung**
> Bitte überprüfen Sie die Skripte, die installierten Pakete und die Einstellungen, bevor Sie das Installationsskript ausführen.

Führen Sie das `dotfiles`-Skript aus:
```sh
curl -sO https://raw.githubusercontent.com/protiumx/.dotfiles/main/dotfiles
```

## Testing Stow

Simulate `stow` links

```sh
stow -nSv vim
```
