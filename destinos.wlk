object puenteDeBrooklyn {
    method dejarPasar(mensajero,paquete){
      return paquete.estaPago() && mensajero.peso() <= 1000
    }
}

object laMatrix {
  method dejarPasar(mensajero,paquete){
    return paquete.estaPago() && mensajero.puedeLlamar()
  }
}

object paqueteOriginal{
  var estaPago = false

  method precio() = 50

  method pagar(cantAPagar){
    if(cantAPagar >= self.precio()){
      estaPago = true
    }else{
      estaPago = false
    }
    
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
  var saldoPendiente = 100 * cantDeDestinos


  method saldoPendiente() = saldoPendiente

  method estaPago() = estaPago

  method precio() = 100 * cantDeDestinos

  method cambiarCantDeDestinos(nuevaCantDeDestinos){
    cantDeDestinos = nuevaCantDeDestinos
  }

  method pagar(cantAPagar){
    saldoPendiente -= cantAPagar
    if(saldoPendiente <= 0){
      estaPago = true
    }
  }
}