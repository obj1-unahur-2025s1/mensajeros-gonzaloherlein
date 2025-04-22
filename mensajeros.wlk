//Mensajeros
object roberto{
  var vehiculo = null

  method puedeLlamar() = false

  method peso(){
    return 90 + vehiculo.peso()
  }

  method cambiarVehiculo(nuevoVehiculo){
    vehiculo = nuevoVehiculo
  }

}

object chuckNorris{
  method peso() = 80
  method puedeLlamar() = true
}

object neo{
  var tieneCredito = true
  method peso() = 0 
  method puedeLlamar() = tieneCredito
  method cambiarCredito(){
    tieneCredito = !tieneCredito
  }

}

//Vehiculos
object bicicleta{
  method peso() = 5
}

object camion{
  var cantDeAcoplados = 0

  method agregarAcoplado(){
    cantDeAcoplados += 1
  }

  method quitarAcoplado(){
    cantDeAcoplados -= 1
  }

  method peso() = 500 * cantDeAcoplados
}
