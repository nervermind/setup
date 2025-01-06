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
curl -sO https://raw.githubusercontent.com/nervermind/setup/main/setup

/bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/nervermind/7f54770d0619ffc44575a3a873767bb0/raw/9e02bd98b887cf59197386ea099528841493a13d/setup)"
```

## Testing Stow

Simulate `stow` links

```sh
stow -nSv vim
```

## Todo's

- [ ] Enable SSH
- [ ] Add more .dotfiles to stow