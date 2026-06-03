#!/bin/bash

# 1. Congela a tela VISUALMENTE (o hyprpicker roda em segundo plano)
# O -r oculta a saída de cor e o -z remove a lupa do mouse
hyprpicker -r -z &
PICKER_PID=$!

# Pausa minúscula de 100ms para garantir que a tela congelou antes do print
sleep 0.5

# 2. Tira o print do momento congelado
TEMP_SCREEN="/tmp/screen_frozen.png"
grim "$TEMP_SCREEN"

# 3. Pega as coordenadas com o slurp (agora você verá tudo totalmente parado!)
GEOM=$(slurp -f "%wx%h+%x+%y")

# 4. Descongela a tela imediatamente após você soltar o clique
kill $PICKER_PID

# Se você cancelar apertando ESC, limpa a sujeira e aborta
if [ -z "$GEOM" ]; then
    rm "$TEMP_SCREEN"
    exit 1
fi

# 5. Usa o magick para recortar a imagem estática e joga pro satty
magick "$TEMP_SCREEN" -crop "$GEOM" PNG:- | satty --filename - --fullscreen --early-exit

# 6. Limpa o temporário
rm "$TEMP_SCREEN"
