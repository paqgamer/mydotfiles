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

---
### 3.1 Conectando à internet 

Caso esteja usando intenet via cabo, teste a  conexão usando:

```bash
 ping -c 4 google.com
```
Se aparecer uns numeros  tipo 80ms, 90ms etc, está com internet funcional, caso contrário, tente reconectar o cabo e tente novamente.

**Usando WIFI:**
**Passo 1 – Descubra o nome exato do seu adaptador Wi-Fi**

Geralmente é wlan0 **mas nem sempre** será `wlan0`. Dependendo do hardware e do driver, o nome pode ser:

- `wlp2s0` (padrão em muitos notebooks)
- `wlan0` (mais antigo)
- `wlx00c0ca123456` (quando o endereço MAC é usado no nome)
- `wlo1` (em alguns Dell/HPs)

Para descobrir, execute no terminal:

```bash
iwctl device list
```
> se nao aparecer  nada, use internet cabeada (cabo lan)

deve aparecer algo parecido com isso:
```
wlp2s0              00:11:22:33:44:55   on        phy0      station
```

Agora precisa escanear pelas redes wifi, use o comando abaixo substituindo "wlp2s0" pelo que apareceu para você anteriormente:
```
iwctl station wlp2s0 scan
```
Esse comando não deve retornar nada, para exibir as redes wifi, use o seguinte comando:
> Lembre de substituir o nome do adaptador de rede "wlp2s0" pelo seu:
```
iwctl station wlp2s0 get-networks
```
Agora deve aparecer na sua tela todas as redes WIFI detectadas pelo seu computador
Para se conectar use este comando, digitando o nome EXATAMENTE IGUAL da sua rede:
```
iwctl station wlp2s0 connect NomedasuaRede
```
aperte enter e com isso deve pedir a senha do wifi, digite a senha e tecle  enter
Para testar  se a  conexão foi bem sucedida, digite "exit" e aperte enter, ou aperte CTRL+C para sair do iwctl, e digite o seguinte comando:
```
ping -c 4 google.com
```
Com isso é  possível verificar se a conexão foi bem sucedida, caso não tenha nenhum erro, prossiga

### 3.2 Relógio

Para ativar a sincronização automática via internet (NTP), execute:

```bash
timedatectl set-ntp true
```
E para verificar use:
```
timedatectl status
```
Caso retorne algo como System clock synchronized: yes e NTP service: active, deu certo.

### 3.3 Particionamento de Disco

Para de fato colocar o Arch dentro do seu computador, é necessário preparar o local onde ele será instalado

> [!WARNING]
> **Atenção**: Os comandos a seguir irão apagar os dados do disco selecionado. Tenha certeza absoluta de qual disco você está formatando.

Use o seguinte comando para verificar os discos e partições disponíveis:
```bash
lsblk
```

Identifique o seu disco principal prestando atenção ao tamanho de armazenamento de cada um. O disco de instalação geralmente será listado como:

    sda, sdb, sdc... (para HDDs e SSDs padrão SATA)

    nvme0n1, nvme1n1... (para SSDs NVMe M.2)


Para particionar, usaremos o `cfdisk`, que possui uma interface amigável no terminal. Substitua `sdX` pelo nome do seu disco principal identificado no passo anterior (por exemplo, `sda` ou `nvme0n1`).

```bash
cfdisk /dev/sdX
```
Siga este fluxo para criar um esquema básico para sistemas UEFI modernos:

1. **Tabela de Partições:** Se o disco for novo ou estiver totalmente limpo, o programa pedirá para escolher o tipo de tabela (label). Selecione **gpt**.

> Caso nao esteja  vazio, recomendo selecionar todas as partições uma a uma, deletar, e depois ir em 'write' e depois digitar yes, em  seguida abra o cfdisk novamente e prossiga

2. **Partição de Boot (EFI):** Selecione o espaço livre (`Free space`) e vá em **New** (Novo) na parte inferior. Para o tamanho, digite `512M` e aperte Enter. Em seguida, vá em **Type** (Tipo) e mude para **EFI System**.

3. **Partição Swap (Opcional, mas recomendada):** Selecione o espaço livre restante e vá em **New**. Digite o tamanho desejado (ex: `4G` ou `8G`) e aperte Enter. Vá em **Type** e mude para **Linux swap**.

4. **Partição Principal (Root):** Selecione o que sobrou do espaço livre e vá em **New**. Aperte Enter direto para usar todo o espaço restante. O tipo padrão já será **Linux filesystem**, então não é necessário alterar.

5. **Salvar:** Selecione a opção **Write** na parte inferior, digite a palavra `yes` e aperte Enter para confirmar a gravação. Depois, vá em **Quit** para sair da ferramenta.


Atenção: Verifique os números das partições criadas usando lsblk novamente. Se o seu disco for sda, as partições serão sda1, sda2, etc. Se for nvme0n1, serão nvme0n1p1, nvme0n1p2, etc. Substitua o sdX nos comandos abaixo de acordo.

**Criando a BOOT***
para criar a partição de boot, use esse comando, substituindo o sdx1 pela partição de 512M que foi criada:
```
mkfs.fat -F 32 /dev/sdX1
```

**Criando a Raiz**
Recomendo fortemente uso de ext4, por ser mais simples para iniciantes e muito  eficiente:

substitua o sdx3 pela maior partição que foi criada:
```
mkfs.ext4 /dev/sdX3
```

**SWAP**
Caso tenha criado uma partição swap (completamente opcional, util para hibernação etc):

> lembrete, para verificar as partições, use ```  lsblk```

Substitua sdx2 pela partição swap, que recomendo 4G à 8G de tamanho
```
mkswap /dev/sdX2
swapon /dev/sdX2
```

### 3.4 abrindo caminho

>> Respira fundo, tá quase acabando

Agora você vai acessar de fato as partições criadas no disco do seu computador, para instalar o arch de  fato

Antes de instalar o sistema, precisamos "montar" as partições no diretório /mnt do instalador. A ordem aqui é crucial: sempre monte a raiz (root) primeiro (a maior partição):

Substitua sdx3 pela partição raiz que foi criada em ext4:
```
mount /dev/sdX3 /mnt
```
Monte a partição EFI (usando a flag --mkdir para criar a pasta e montar a partição com um único comando):

Substitua sdx1 pela partição de 512M que foi formatada em fat32:
```
mount --mkdir /dev/sdX1 /mnt/boot
```

Para garantir que tudo foi montado nos lugares certos, digite lsblk novamente. Você deverá ver /mnt e /mnt/boot listados na coluna Mountpoints ao lado das suas partições.




### 4. Instalando o arch dentro do computador
O comando `pacstrap` vai baixar e instalar os pacotes essenciais dentro da sua nova partição raiz. Usaremos uma seleção limpa e minimalista:

Incluí alguns pacotes opcionais, mas que são úteis no dia a dia:
```bash
pacstrap -K /mnt base curl wget linux linux-firmware grub efibootmgr intel-ucode amd-ucode base-devel networkmanager iwd vim nano sudo bash-completion man-db man-pages ntfs-3g exfatprogs sof-firmware alsa-utils openssh htop unzip bind pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack
```

### 4.1 Fstab
Use o seguinte comando para garantir montagem automática de tudo ao  ligar o pc:
```
genfstab -U /mnt >> /mnt/etc/fstab
```

agora  use  o seguinte comando para  entrar no arch do pc (já instalado):
```
arch-chroot /mnt
```

### 4.2 Detalhes adicionais

Ainda dentro do ambiente `chroot`, precisamos definir o fuso horário do sistema. Para o horário oficial de Brasília, execute:

```bash
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```
Em seguida:
```
hwclock --systohc
```

Agora para usar os arquivos de localização, rode o seguinte comando:
```
micro /etc/locale.gen
```
Procure pelas seguintes  linhas:

    pt_BR.UTF-8 UTF-8
    en_US.UTF-8 UTF-8

E apague os  comentários (#) na frente de ambas, em  seguida salve com CTRL+S e saia com CTRL+Q

Agora, para finalizar essa parte, use  os seguintes comandos para  utilizar a localização escolhida:
```
locale-gen
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf
```


**Para definir o nome do  computador**:

Substitua o meu-computador pelo nome desejado:
```
echo "meu-computador" > /etc/hostname
```

**Senha ROOT**
O  usuario root(que nao é o  seu usuario), é  uma forma de administrar a máquina com máxima autoriadade, porém só é usado para atividades específicas por ter riscos de segurança
defina a senha do root com:
```
passwd
```
**Criar o usuário:** Substitua `seu_usuario` pelo nome de login que você deseja (use apenas letras minúsculas, sem espaços ou caracteres especiais):
```bash
useradd -m -G wheel -s /bin/bash seu_usuario
```
Agora defina a senha do usuario(nao  recomendo usar a mesma do ROOT):
```
passwd seu_usuario
```
**DAR PERMISSÃO**
Para  poder ter permissões de administrador, sem  precisar usar o usuario root toda  hora, digite este comando:
```
EDITOR=micro visudo
```
Dentro do arquivo, role a página para baixo até encontrar a seguinte linha e remova o # do início dela:

        # %wheel ALL=(ALL:ALL) ALL
Salve o arquivo com CTRL+S e saia com  CTRL+Q


### 4.3 Instalar o Bootloader:
O bootloader é responsável por  ligar o sistema, aqui vou  ensinar a  usar  o GRUB, que é  mais compatível, antigo e fácil de  instalar. Caso queira usar o systemd-boot (mais leve e moderno), veja a próxima seção:
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```
Em  seguida:
```
grub-mkconfig -o /boot/grub/grub.cfg
```


**Caso queira o systemdboot**
> Se  instalou o grub, pule esta parte, use apenas um dos dois:
Para instalar o systemdboot, use o comando:
```
bootctl install
```
Depois:
```
nano /boot/loader/loader.conf
```
dentro desse arquivo apague tudo que tiver e deixe exatamente assim:

```
default  arch.conf
timeout  3
editor   no
```
Salve com CTRL+S, saia com CTRL+Q e agora faça isso:
```
nano /boot/loader/entries/arch.conf
```
Deixa o arquivo assim:
> Substitua o adm-ucode.img  por intel-ucode.img caso seu processador seja  intel, e troque o /dev/sdx3 para a partição raiz previamente  criada, aquela maior com ext4
```
title   Arch Linux
linux   /vmlinuz-linux
initrd  /intel-ucode.img
initrd  /amd-ucode.img
initrd  /initramfs-linux.img
options root=/dev/sdX3 rw quiet
```
Salve com CTRL+S depois-> CTRL+Q

Agora seu PC está com ARCHLINUX completamente  instalado e funcional, para prosseguir com segurança, digite `exit`  para sair do chroot e digite o seguinte comando:
```
umount -R /mnt
```
Agora pode reiniciar o computador com o comando `reboot` e remova  o pendrive rapidamente para evitar que  ligue novamente no ambiente temporário.

>Caso o  sistema nao ligue, verifique na  bios (mencionado no inicio) a ordem de boot, e selecione  a opção Arch Linux (Ou partição, dependendo da bios)
>Em alguns casos, será preciso selecionar manualmente dentro da "BOOT/EFI/systemd/systemd-bootx64.efi"
salve (normalmente ctrl+f10) e  agora deve  ligar
<div align=center>

# Parabéns, Arch foi instalado, agora caso não queira ficar apenas com linhas de comando, prossiga  para  instalar um ambiente desktop (O mais difícil já foi)
</div>

### 5. Instalando  um Ambiente Gráfico:

> **Eu uso e recomendo Hyprland** porém vou ensinar primeiro os mais "clichês" e tradicionais, e em breve adiciono  seção do hyprland, por ter mais etapas
Sem entrar muito em comparações, há diversas opções disponíveis, como gnome, plasma, lxde,  cinnamon, cosmic etc;

> Pesquise, veja videos no youtube por aí e escolha um

#### Vou seguir com o plasma como exemplo:
Agora que o Arch já está instalado, você precisa aprender a usar o pacman,  que é  o instalador padrão de pacotes do Arch.

**Para instalar um pacote:**
```
sudo pacman -S nomedopacote
```
**Para atualizar o sistema**:
```
sudo pacman -Syu
```
**Os ambientes gráficos, como o  plasma por exemplo, geralmente oferecem uma gama de aplicativos, como gerenciadores de arquivos, terminais, etc, porém  são opcionais, no caso do plasma, você pode instalar apenas o ambiente mínimo com  o pacote `plasma-desktop `, caso queira mais completo, com vários apps como explorador de arquivos, editor de texto, imagens etc, instale o `plasma`:
```
sudo pacman -S plasma OU sudo pacman -S plasma-desktop
```
> Reinicie o computador  após concluir a instalação do  ambiente gráfico, e (provavelmente) irá ligar automaticamente em uma interface gráfica de login 

Para instalar outros apps, como navegador por exemplo, use o pacman como mencionado anteriormente:
```
sudo pacman -S firefox
sudo pacman -S brave
sudo pacman -S kitty
```
Válido mencionar que é possível instalar  vários pacotes de uma vez, separando-os com um espaço:
```
sudo pacman -S firefox brave kitty vlc ffmpeg vscodium 
```
> [!WARNING]
> Atualize regularmente o sistema com `sudo pacman -Syu`

(🚧EM CONSTRUÇÃO🚧) atualizo em breve