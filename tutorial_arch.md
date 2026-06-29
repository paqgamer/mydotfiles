<div align="center">

# Tutorial de instalação Arch Linux
> Sem scripts prontos, completamente manual.

![Arch Linux](https://img.shields.io/badge/OS-Arch_Linux-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)

</div>

## Primeiros passos: Preparando o terreno
 
### 1. Criando a mídia de instalação

* **Backup:** Tenha em mãos um pendrive de no mínimo 8GB. Faça backup de todos os seus arquivos, pois a unidade será completamente formatada.
* **Ventoy:** Baixe e utilize o [Ventoy](https://www.ventoy.net) para preparar o pendrive. Ele permite criar um disco de boot múltiplo apenas arrastando as imagens ISO para dentro dele.
* **Arch Linux:** Baixe a imagem oficial do [Arch Linux](https://archlinux.org/) e copie para o pendrive formatado com o Ventoy.

> **Dica (Opcional):** Se houver espaço sobrando no pendrive, recomendo baixar também a ISO do [Gparted Live](https://gparted.org/download.php) e colocá-la no pendrive. Isso permite que você inicie o PC pelo GParted, faça todo o particionamento do disco de forma gráfica e visual, e depois reinicie para dar boot no Arch Linux, poupando o trabalho de usar ferramentas de particionamento via linha de comando.


### 2. Ligando a partir do pendrive

Com o pendrive devidamente preparado, vamos iniciar o computador por ele.

> **Atenção:** Antes de prosseguir, acesse a BIOS/UEFI da sua máquina e **desabilite o Secure Boot**. O Arch Linux não possui assinatura digital para sua mídia live, portanto com o Secure Boot ativado o pendrive provavelmente será ignorado ou bloqueará a inicialização.

---

**Passo 1 – Insira o pendrive**  
Conecte o pendrive em uma porta USB (de preferência em uma porta traseira, diretamente na placa-mãe, para evitar instabilidades de energia ou reconhecimento).

**Passo 2 – Reinicie o computador**  
Durante a tela de POST (aquela com o logo da fabricante), pressione repetidamente a tecla responsável por abrir o **menu de boot** (Boot Menu). As teclas mais comuns são:

| Fabricante / Modelo | Tecla do Boot Menu |
| :--- | :--- |
| Gigabyte, MSI, Dell | `F12` |
| HP (desktops e notebooks) | `F9` ou `ESC` |
| ASUS | `ESC` ou `F8` |
| Acer | `F12` ou `F2` |
| Notebooks em geral (Lenovo, Samsung) | `F10` ou `F2` |

Caso o menu de boot não apareça, reinicie novamente, entre na BIOS/UEFI (tecla `DEL` ou `F2`) e altere a **ordem de boot** manualmente, colocando o pendrive como primeira opção. O passo a passo detalhado pode variar de acordo com a marca da placa mãe, pesquise por tutoriais na internet e terá a resposta.

**Passo 3 – Escolha a opção correta no menu de boot**  
No menu que aparecer, você verá o nome do seu pendrive. Preste **MUITA ATENÇÃO** na hora de selecionar:

- ✅ **ESCOLHA:** A opção que começa com o prefixo `UEFI:` (exemplo: `UEFI: Kingston DataTraveler 3.0`).
- ❌ **EVITE:** A opção que aparece apenas com o nome do pendrive, **sem** o prefixo `UEFI:` (geralmente marcada como `USB` ou `Legacy`).

> **Por que isso é tão importante?** Escolher o modo UEFI garante que sua futura instalação utilize o esquema de particionamento **GPT**, que é o padrão moderno e suporta discos maiores que 2TB, inicialização mais rápida e maior segurança. Se você escolher o modo Legacy (MBR), corre o risco de ter que refazer todo o particionamento do zero mais tarde. Fique no UEFI!

**Passo 4 – Inicie o ambiente live**  
Após selecionar o pendrive em modo UEFI, a tela preta com o menu inicial do Arch Linux aparecerá. Basta selecionar a primeira opção (*"Arch Linux install medium (x86_64, UEFI)"*) e pressionar `Enter`.

Aguarde alguns segundos enquanto o kernel e os drivers são carregados. Ao final, você será recebido por um prompt de terminal semelhante a este:

```bash
root@archiso ~ #
```

Com isso você está oficilamente dentro do ArchLinux, mas ele ainda não está instalado, está apenas ligado diretamente do arquivo no pendrive


### 3. Instalando o Arch

Agora vamos preparar o disco rígido (HD ou SSD) do seu computador para receber o sistema, baixar os pacotes essenciais e instalar o Arch de fato.

> [!WARNING]
> **ATENÇÃO TOTAL:** A partir daqui, todos os comandos envolvem manipulação direta do disco. **Todos os dados existentes no disco escolhido serão APAGADOS.** Verifique duas vezes cada comando antes de pressionar `Enter`.

