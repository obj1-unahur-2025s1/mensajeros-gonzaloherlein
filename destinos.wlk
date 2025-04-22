object puenteDeBrooklyn {
    method dejarPasar(mensajero){
      return paquete.estaPago() && mensajero.peso() <= 1000
    }
}

object laMatrix {
  method dejarPasar(mensajero){
    return paquete.estaPago() && mensajero.puedeLlamar()
  }
}

object paquete{
  var estaPago = false
  method pagar(){
    estaPago = true
  }
  method deber(){
    estaPago = false
  }
  method estaPago() = estaPago
}