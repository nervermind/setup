# Setup

Dieses Repository hilft dabei, eine Entwicklungsumgebung auf einem **MacOS**-Rechner einzurichten. Es enthält Skripte und Konfigurationsdateien, um alle benötigten Pakete und Anwendungen zu installieren, Konfigurationsdateien zu verwalten und bevorzugte MacOS-Einstellungen zu setzen.

Original coming from: [https://medium.com/@protiumx/bash-gnu-stow-take-a-walk-while-your-new-macbook-is-being-set-up-351a6f2f9225]

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

/bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/nervermind/7f54770d0619ffc44575a3a873767bb0/raw/8fe4e3c5edd35ed3a3b11f4a19da2f366b926bd6/setup)"
```

## Testing Stow

Simulate `stow` links

```sh
stow -nSv vim
```

## Todo's

- [ ] Enable SSH
- [ ] Add more .dotfiles to stow
- [ ] add ssh at beginning