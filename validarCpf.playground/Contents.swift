import UIKit

//var cpf:String = "408652948"
 
func validarCPF(cpf1:String){
    var cpf:String = cpf1

cpf.removeLast(2)
var cpfArray = Array(cpf)
print(cpfArray)


// MARK: - Calculo do primeiro digito
var resultadoFinal = 0

// Index
// INDEX.offset = Indice de cada elemento dentro do array
// Elemento = Cada elemento que contem dentro do array

for index in cpfArray.enumerated() {
    let numero = Int(String(index.element))!
    print(index)
    
    let menos = 10 - index.offset
//    print(numero * menos)
    resultadoFinal += numero * menos
}

print(resultadoFinal)


    var primeiroDigito = 0
if resultadoFinal % 11 < 2 {
    primeiroDigito = 0

}else if resultadoFinal % 11 >= 2{
    primeiroDigito = 11 - resultadoFinal%11
    
}
    print(primeiroDigito)
    
    let digito1 = "\(primeiroDigito)"

    
// Adicionadno primeiro digito no array para calculo do segundo digito
    cpfArray += digito1
print(cpfArray)

// MARK: - Iniciando calculo do segundo digito verificador

var segundoDigito = 0
var resultadoSomaDigito2 = 0

for index in cpfArray.enumerated(){
    let numero = Int(String(index.element))!
    let menos = 11 - index.offset
//    print(numero * menos)
resultadoSomaDigito2 += numero * menos
    
    
}
print(resultadoSomaDigito2)

if resultadoSomaDigito2 % 11 < 2 {
    segundoDigito = 0
}else if resultadoSomaDigito2 % 11 >= 2{
    segundoDigito = 11 - (resultadoSomaDigito2%11)
    
}
    print(segundoDigito)
    let digito2:String = "\(segundoDigito)"

// Adicionando segundo digito verificado dentro do array
    cpfArray += digito2
print(cpfArray)
    
    

 
    
   
    
}


validarCPF(cpf1: "40865294836")
