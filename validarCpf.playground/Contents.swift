import UIKit

let cpf:String = "408.652.948-36"

// retiranndo componenentes como pontos do cpf
var cpfSemCaracteres = cpf.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
print(cpfSemCaracteres)

// invertendo o cpf ( imprimindo ele do ultimo nomero para o primeiro)
var cpfInvetido = String(cpfSemCaracteres.reversed())
print(cpfInvetido)

// removendo os dois "primeiros" ultimos digitos do cpf
cpfInvetido.removeFirst()
print(cpfInvetido)
cpfInvetido.removeFirst()
print(cpfInvetido)

// variavel = o cpf invertido sem os digitos
var cpfSemDig = cpfInvetido

func calculoDeCpf(_ cpf:String) -> Int{
    var cpfSomado = 0
//   enumerated numerando cada caracter com seu devido indice e multiplicando cada elemento a partir do numero 2
    cpf.enumerated().map { (value, elemento) in
        let contadorDeMultiplicacao = 2
        if let numero = Int(String(elemento)){
            cpfSomado += numero * (value + contadorDeMultiplicacao)
        }
    }
    return cpfSomado
    
}

// Digito comeca com 0
// variavel result vai ser igual ao calculo feito acima, que seria a soma de todos os caracteres multiplicados em ordem crescente a partir de 2 divido o total por 11
// se o restante da divisao por 11 for menor que 2 digito é igual a 0. senao se o result for maior ou igual a 2 digito vai ser igual a 11 - o restante da divisao


var digito = 0
var result = calculoDeCpf(cpfInvetido)%11

if result < 2 {
    digito = 0
}else if result >= 2{
    digito = 11 - result
}


// variavel de apoio apenas para somar o primeiro digito ao cpf.

var captaDigito = String(cpfSemDig.reversed())
captaDigito += String(digito)
cpfInvetido = String(captaDigito.reversed())

let resultadoPrimeiro = digito

// fazendo a mesma verificacao para o digito 2
var result2 = calculoDeCpf(cpfInvetido)%11
digito = 0

if result2 < 2{
    digito = 0
}else if result2 >= 2 {
    digito = 11 - result2
}

// adicionando o segundo digito a variavel de apoio
captaDigito += String(digito)

// se o cpf limpo sem os pontos e sem o traco for igual a variavel de apoio que ja contem os dois digitos verificados o cpf é valido. se nao ele vai ser invalido.

if cpfSemCaracteres == captaDigito {
    print("\(captaDigito) - CPF Valido")
} else {
    print("\(captaDigito) - CPF invalido")
}


