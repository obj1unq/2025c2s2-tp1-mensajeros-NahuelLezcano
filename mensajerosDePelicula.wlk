// Personas empleadas para el envio del paquete

object jeanGrey {
    
    const property puedeLlamar = true

    const property peso = 65  
}


object neo {
    
    var property tieneCredito = true 

    const property peso = 0

    method puedeLlamar() = tieneCredito 
}


object saraConnor {

    const property puedeLlamar = false

    var property pesoPropio = 0     // varía con el tiempo (es configurable)

    var property vehiculo = moto    // Podría ser vehículo nulo

    method peso() = pesoPropio + vehiculo.peso()
}


// Vehículos

object moto {
   
    method peso() = 100 
}


object camion {
    
    var property cantidadAcoplados = 0 

    method pesoPropio() = 500 

    method pesoPorAcoplados() = 500 * cantidadAcoplados 

    method peso() = self.pesoPropio() + self.pesoPorAcoplados()
}


// Paquete

object paquete {
    
    var property estaPago = false   // El paquete al principio no está pago.

    method pagar() {
        estaPago = true
    }

    method puedeSerEnviado(persona, destino) = self.estaPago() and destino.dejaPasarA(persona) 
}


// Destinos

object puenteDeBrooklyn {
    // Deja pasar a todo lo que pese hasta una tonelada (1000 kilos).

    method dejaPasarA(persona) = persona.peso() <= 1000 
}


object matrix {
    // Deja entrar a quien pueda hacer una llamada.

    method dejaPasarA(persona) = persona.puedeLlamar()
}