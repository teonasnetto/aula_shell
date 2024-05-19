#!/bin/bash

testeDialog() {
    dialog --title "Input box" --inputbox "Enter your name" 10 30 2> teste/input.txt
}

testYad() {
    yad --title "Input box" --text "Enter your name" --entry 2> teste/input.txt
}

exemploYadCompleto() {
    Saida=$(yad --form --image blog-min.png --image-on-top \
        --title "Formulário de exemplo" \
        --text "Preencha os campos abaixo<br>YAD<br><big>Terminal</big><br>" \
        --field Nome "Nome" \
        --field "Sexo":CB "Masculino!Feminino!Outro" \
        --field "Nascimento":DT 01/01/2020\
        --field "Senha":H \
        --field "Confirme a senha":H \
        --field "Há quanto tempo usa Linux?":NUM '1!0..20!1'\
        --field "Confirma que leu os termos?":CHK \
        --button "Cancelar":1 \
        --button "Salvar":0
    )

    echo $Saida # iniciar o yad
    IFS=',' read Nome <<< "$Saida" # para pegar o primeiro campo e imprimir
    echo $Saida | tr '|' ',' >> saida.csv # para salvar em um arquivo csv
}

exemploYadCompleto