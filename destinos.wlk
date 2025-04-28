object puenteDeBrooklyn {
    method dejarPasar(mensajero){
      return mensajero.peso() <= 1000
    }
}

object laMatrix {
  method dejarPasar(mensajero){
    return mensajero.puedeLlamar()
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

  method sePuedeEntregar(mensajero,lugar){
    return self.estaPago() && lugar.dejarPasar(mensajero)
  }
}

object paquetito{
  method precio() = 0
  method estaPago() = true
  method sePuedeEntregar(mensajero,lugar){
    return self.estaPago() && lugar.dejarPasar(mensajero)
  }
}

object paquetonViajero{
  const destinos = #{}
  var estaPago = false
  var saldoPendiente = 100 * destinos.size()


  method saldoPendiente() = saldoPendiente

  method estaPago() = estaPago

  method precio() = 100 * destinos.size()

  method agregarDestinos(nuevoDestino){
    destinos.add(nuevoDestino)
  }

  method pagar(cantAPagar){
    saldoPendiente -= cantAPagar
    if(saldoPendiente <= 0){
      estaPago = true
    }
  }
  method sePuedeEntregar(mensajero,lugar){
      self.estaPago() && destinos.all({
        destino => destino.dejarPasar(mensajero)
      })
  }
}