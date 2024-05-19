#!/bin/bash
# Comment: This is a comment

echo "Iniciando..."

:<<'comment'
echo "This is a comment block"
Bloco para escrever comentários
com várias linhas
comment

funcaoBasico() {
    BOMDIA='credo' # Create variable
    echo $BOMDIA
    unset BOMDIA # Delete variable
    export BOMDIA='credo' # Create environment variable in this session
}

funcaoArrays() {
    ARRAY=("element0" "element1" "element2" "element3") # Create array
    echo ${ARRAY[0]} # Print element 1 of array
    echo ${ARRAY[@]} # Print all elements of array
    echo "O ARRAY possui ${#ARRAY[@]} elementos" # Print number of elements in array
    ARRAY[4]="element4" # Add element to array
    echo ${ARRAY[@]:1} # Print elements from 1 to end
    echo ${ARRAY[@]:1:2} # Print elements from 1 to 2
    unset ARRAY[0] # Delete element 1 of array
    echo ${ARRAY[@]} # Print all elements of array
    unset ARRAY # Delete array
}

umaFuncao() {
    VARIAVEL_GLOBAL="valor" # Create gobal variable
    local VARIAVEL_LOCAL="valor" # Create local variable
    echo "chamando função $1 $2 $VARIAVEL_LOCAL"
    return 0 # Return 0
} # Create function and pass parameters if put $@ in the function will pass all parameters

# umaFuncao $1 $2 # Call function and pass parameters ### UNCOMMENT TO TEST

readOnlyVar() {
    declare -r VARIAVEL_SO_LEITURA="valor" # Create read-only variable
    echo $VARIAVEL_SO_LEITURA
}

callSource(){
    source source.sh # Call script
    echo $READ_ONLY_VAR # Print read-only variable from source.sh
}

ls() {
    echo "~Executando função ls"
}

cd() {
    echo "~Executando função cd"
}

builtinFunction() {
    echo "Executando função builtin"
    cd teste/ # Call builtin function cd
    builtin cd teste/ # Call builtin function cd
    command ls # Call builtin function ls from bash to not use local ls if defined in script
    ls # Call function ls from script
}

testeFunction() {
    test 'hello' = 1 && echo 'True' || echo 'False' # Test if one is equal to one and print True or False
}

testeFuctionIfElseWithArguments() {
    if test $1 -eq 2 ; then
        echo "Igual a 2"
    elif test $1 -gt 2; then
        echo "Maior q 2"
    else
        echo "Menor q 2"
    fi
}

testeFuctionIfElseWithArgumentsDifferent() {
    if [ $1 -eq 2 ]; then
        echo "Igual a 2"
    elif [ $1 -gt 2 ]; then
        echo "Maior q 2"
    else
        echo "Menor q 2"
    fi
}

#testeFuctionIfElseWithArguments $1
# testeFuctionIfElseWithArgumentsDifferent $1 # Call function and pass parameters to test if is equal, greater or less than 2  ### UNCOMMENT TO TEST

testeCase() {
    case $1 in
        1) echo "Um";;
        2) echo "Dois";;
        3|4) echo "Três ou Quatro";;
        *) echo "Outro";;
    esac
}

# testeCase $1 # Call function and pass parameters to test case ### UNCOMMENT TO TEST

testeForMode1() {
    # in this case after in and before ; can be written like
    # 1 2 3 4 5 or {1..5} or {1,2,3,4,5} or $(seq 1 5)
    for i in $(seq 1 5) ; do
        echo $i
    done
}

testeForMode2() {
    for ((i=0; i<5; i++)); do
        echo $i
    done
}

testeWhile() {
    i=0
    while [ $i -lt 5 ]; do
        echo $i
        i=$((i+1)) # or i=`expr $i + 1` or let i=i+1 or ((i = i + 1))
    done
}

testeUntil() {
    i=0
    until [ $i -ge 5 ]; do
        echo $i
        i=$((i+1)) # or i=`expr $i + 1` or let i=i+1 or ((i = i + 1))
    done
}

testeWhileWithInput() {

    input_string="n"

    while [[ "$input_string" != "s" ]]; do
        echo "deseja sair? (s/n)"
        read input_string
        if [[ "$input_string" == "n" ]]; then
            echo "Continuando..."
        else
            echo "Não compreendi..."
        fi
    done
}

testeWriteFile() {
    echo "Escrevendo em arquivo, aguarde......" # Print in terminal
    echo "Escrevendo em arquivo" > teste/arquivo.txt # Write in file
    echo -e "Feijao\nBanana\nmaca\nmanga\nabacaxi" >> teste/arquivo.txt # Append in file
    cat teste/arquivo.txt # Print file
    cat teste/arquivo.txt | wc -l # Print number of lines in file
    cat teste/arquivo.txt | wc -w # Print number of words in file
    cat teste/arquivo.txt | wc -c # Print number of characters in file
    cat teste/arquivo.txt | wc -m # Print number of characters in file
    read -p "Pressione enter para continuar" # wait for enter to continue
    clear # Clear terminal
    cat teste/arquitvo.txt | sort
    sleep 3 # wait 3 seconds
}

testeCreateFileAndDelete() {
    touch teste/arquivo_para_apagar.txt # Create file
    read -p "Pressione enter para continuar" # wait for enter to continue
    find teste/ -name "arquivo_para_apagar.txt" -exec rm -rf {} \; # Delete file using -exec
}

testeShift() {
    echo "Parâmetros: $@"
    echo "Parâmetros: $1 $2 $3"
    shift; shift
    echo "Parâmetros: $1 $2 $3"
}

# testeShift $1 $2 $3 # Call function and pass parameters to test shift ### UNCOMMENT TO TEST

testeWithTrap() {
    trap "echo 'Você pressionou Ctrl+C!'" SIGINT # Trap signal SIGINT will capture Ctrl+C, to see all signals run trap -l or kill -l
    echo "Pressione Ctrl+C"
    sleep 10
}

testeMatematics() {
    echo "Soma: $((1+1))"
    echo "Subtração: $((1-1))"
    echo "Multiplicação: $((1*1))"
    echo "Divisão: $((1/2))"
    echo "Resto: $((1%1))"
    echo "Potência: $((1**1))"
    echo "Incremento: $((1++))"
    echo "Decremento: $((1--))"
}

testeScale() {
    echo "Divisão com escala: $(echo "scale=2; 1/3" | bc)" # Print division with scale
}

testeHereStrings() {
    echo "Here Strings: $(bc <<< "1+1")" # Send string to bc
}

testeCalcBinary() {
    echo "Binário: $((2#10))" # Convert binary to decimal
    echo "Decimal: $((10#2))" # Convert decimal to binary
    echo "obase=2; 10" | bc # Convert decimal to binary
    echo "ibase=2; 10" | bc # Convert binary to decimal
}

testeCountCaracteres(){
    palavra="palavra"
    expr length $

}
