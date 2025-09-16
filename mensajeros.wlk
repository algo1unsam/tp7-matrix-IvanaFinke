//Mensajeros:
//Mensajero Morfeo object
object morfeo
{
    var property transporte = monopatin
    var property peso = 90
    var property cantidadDinero = 0


//Metodo que devuelve la suma del peso de morfeo y el vehiculo que use
    method pesoConTransporte()
    {
        const pesoConTransporte = self.peso() + transporte.peso()
        self.peso(pesoConTransporte)
        return pesoConTransporte
    }

    method llamar() = cantidadDinero > 0

}

//Mensajera Trinity object:
object trinity
{
    var property peso = 900 
    var property dedoMeniqueBoca = true
    var property pulgarOido = true
    var property cantidadDinero = 0
 //Hace una llamada 
    method llamar() = dedoMeniqueBoca and pulgarOido
}

//Mensajero Neo:
object neo
{
    var property peso = 0 
    //saldo en el celular:
    var property cantidadSaldo = 0
    var property transporte = vuelo 
    var property cantidadDinero = 0

    method llamar() = cantidadSaldo > 0
}

//Medios de transporte:
object vuelo {
    var property volar = "Volar" 
  
}

object camion
{
    var property pesoBasePorAcoplado = 500
    var property acoplados = 1 

    method peso() = self.pesoBasePorAcoplado() * self.acoplados()
}

object monopatin
{
    var property peso = 1
}

//Destinos:
object puente
{
    method dejarPasar(usuario)
    {
        return usuario.peso() <= 1000
    }
}

object  matrix 
{
    var llamada = false

    method dejarPasar(usuario) = (usuario.llamar() == true)
}

//Paquete original:
object paquete
{
    var property costoPagoPaquete = 50
    var property pagado = false 
    var property destino = puente


//Comprueba si la cantidad puesta de dinero cubre el costo del paquete
    method pago(usuario)
    {   
        if(usuario.cantidadDinero() >= self.costoPagoPaquete())
        {
           self.pagado(true)
        }
         return pagado
    }
    
//Comprueba si el proceso de pago en pago(usuario) se hizo bien
    method estaPago(usuario) = pagado

//Metodo para pagar el paquete 
    method pagar(valor) {pagado = valor return pagado}
  
//Metodo para ver por quien puede ser entregado
    method puedeSerEntregadoPor(usuario)
    {
        return pagado and (destino.dejarPasar(usuario))
    }
}

//Object Paquetito
object paquetito
{
    var property costoPagoPaquete = 0
    var property pagado = true

//Cualquier mensajero lo puede entregar
     method puedeSerEntregadoPor(usuario) = true
    
}

//Object Paqueton
object paqueton
{
    var property costoPagoPaquete = 100
    var property pagado = false 
    var property destino = [matrix,puente]

//Se puede pagar todo o parcialmente
    method pagar(usuario)
    {   
        if(costoPagoPaquete <= usuario.cantidadDinero())
        {
            costoPagoPaquete = 0
           self.pagado(true)
        }
        else
        {
            costoPagoPaquete -= usuario.cantidadDinero()
        }
    }

//Debe de estar pago totalmente para ser enviado y el
//entregador debe poder pasar por el destino
     method puedeSerEntregadoPor(usuario)
    {
        return pagado and (destino.all({lugar => lugar.dejarPasar(usuario)}))
    }
}

