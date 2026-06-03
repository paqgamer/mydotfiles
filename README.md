<div align="center">

# ❄️ Meus Dotfiles

Um repositório pessoal para manter meu ambiente de desenvolvimento e uso diário sincronizado e organizado. 

![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-00a7b5?style=for-the-badge&logo=linux&logoColor=white)
![C++](https://img.shields.io/badge/C++-00599C?style=for-the-badge&logo=c%2B%2B&logoColor=white)
![Bash](https://img.shields.io/badge/Scripts-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)

<br>
<table>
  <tr>
    <td valign="top" width="50%">
      <img src="./screenshots/desktop.png" alt="Desktop Setup" width="100%">
      <p align="center">🖥️ Arch Linux (Desktop)</p>
    </td>
    <td valign="top" width="50%">
      <img src="./screenshots/desktopwindows.png" alt="Windows Setup" width="100%">
      <p align="center">🪟 Ambiente Secundário / Notebook</p>
    </td>
  </tr>
</table>

---
</div>

## 🛠️ O Setup

Essas são as engrenagens principais que fazem o sistema rodar:

* **Sistema Operacional:** Arch Linux
* **Window Manager:** Hyprland (Wayland)
* **Papel de parede:** linux-wallpaperengine (niri fork)
* **Barra de Status:** Waybar
* **Lockscreen:** Hyprlock
* **Captura de Tela:** Grim + Slurp + Magick
* **Edição Rápida:** Satty

## 📂 Estrutura do Repositório

Como eu utilizo máquinas com propósitos e hardwares diferentes, dividi os arquivos para evitar conflitos. Tudo é copiado seletivamente para a pasta `~/.config/`.

```text
📦 meus-dotfiles
 ┣ 📂 comum/                 # Funciona perfeitamente em qualquer máquina
 ┃ ┗ 📂 scripts/             # Scripts de captura de tela, utilitários, etc.
 ┣ 📂 desktop/               # Configurações de alta performance e múltiplos monitores
 ┃ ┗ 📜 hyprland.conf        
 ┗ 📂 notebook/              # Configurações focadas em economia de bateria e rede móvel
   ┗ 📜 hyprland.conf
```
<br>
## 📦 A Megathread de Aplicativos (🚧EM CONSTRUÇÃO🚧)

Esta é a coletânea de ferramentas que utilizo no meu dia a dia no Arch Linux. A lista está dividida por categorias para facilitar a navegação.

### 🖥️ Core System & Terminal
| Ícone | Categoria | Ferramenta | Por que uso? |
| :---: | :--- | :--- | :--- |
| 🐚 | Shell | Zsh | *[Insira o motivo aqui]* |
| 💻 | Terminal | Kitty | *[Insira o motivo aqui]* |
| 📂 | Gerenciador de Arquivos | Dolphin | *[Insira o motivo aqui]* |

### 🛠️ Desenvolvimento & Engenharia
| Ícone | Categoria | Ferramenta | Por que uso? |
| :---: | :--- | :--- | :--- |
| 📝 | Editor de Código | VSCodium | *[Insira o motivo aqui]* |
| 🦭 | Containers | Podman Desktop | *[Insira o motivo aqui]* |

### 🌐 Navegação, Comunicação & Downloads
| Ícone | Categoria | Ferramenta | Por que uso? |
| :---: | :--- | :--- | :--- |
| 🦊 | Navegador Web | Floorp | *[Insira o motivo aqui]* |
| 💬 | Central Social | Ferdium | *[Insira o motivo aqui]* |
| 📥 | Gestor de Downloads | AB Download Manager | *[Insira o motivo aqui]* |

### ✍️ Escrita, Leitura & Produtividade
| Ícone | Categoria | Ferramenta | Por que uso? |
| :---: | :--- | :--- | :--- |
| 📚 | Escrita Criativa | novelWriter | *[Insira o motivo aqui]* |
| 📖 | Leitura & E-books | Calibre | *[Insira o motivo aqui]* |
| 💼 | Suíte de Escritório | LibreOffice / Google Docs | *[Insira o motivo aqui]* |

### 🎬 Mídia & Entretenimento
| Ícone | Categoria | Ferramenta | Por que uso? |
| :---: | :--- | :--- | :--- |
| 🧡 | Player de Vídeo | VLC | *[Insira o motivo aqui]* |