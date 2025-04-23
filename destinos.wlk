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

  method precio() = 50
  
  method pagar(){
    estaPago = true
  }
  method deber(){
    estaPago = false
  }
  method estaPago() = estaPago
}

object paquetito{
  method estaPago() = true
}

object paquetonViajero{
  var cantDeDestinos = 1
  var estaPago = false

  method estaPago() = estaPago

  method precio() = 100 * cantDeDestinos

  method cambiarCantDeDestinos(nuevaCantDeDestinos){
    cantDeDestinos = nuevaCantDeDestinos
  }

  method pagar(cantAPagar){
    var precioActual = self.precio()
    if(cantAPagar >= precioActual){
      estaPago = true
    }else{
      precioActual = precioActual - cantAPagar
      estaPago = false
    }
  }
}