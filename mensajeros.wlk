//Mensajeros:
//Mensajero Morfeo object
object morfeo
{
    var property transporte = 0
    var property pesoMorfeo = 90
    var property cantidadDinero = 0

//Metodo que devuelve la suma del peso de morfeo y el vehiculo que use
    method peso() = self.pesoMorfeo() + transporte.peso()

    method llamar() = cantidadDinero > 0

}

//Mensajera Trinity object:
object trinity
{
    var property peso = 900 
    var property dedoMeñiqueBoca = true
    var property pulgarOido = true
 //Hace una llamada si el usuario tiene suficiente dinero
    method llamar() = dedoMeñiqueBoca and pulgarOido
}

//Mensajero Neo:
object neo
{
    var property peso = 0 
    //saldo en el celular:
    var property cantidadSaldo = 0

    method llamar() = cantidadSaldo > 0
}

//Medios de transporte:
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
    method dejarPasar(transporte)
    {
        return transporte.peso() <= 1000
    }
}

object  matrix 
{
    var llamada = false

    const property listaEmpleados = []

    method dejarPasar(valor) {llamada = valor return llamada}  

    method contratarUnEmpleado(empleado) = listaEmpleados.add(empleado)

    method despedirUnEmpleado(empleado) = listaEmpleados.remove(empleado)

    method despedirATodos() = listaEmpleados.forEach({empleado => listaEmpleados.remove(empleado)})

//Si la mensajeria tiene mas de dos empleados
    method mensajeriaEsGrande() = listaEmpleados.size() > 2
    
}

//Paquete:
object paquete
{
    var property costoPagoPaquete = 100
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
        return pagado and (destino.dejarPasar(usuario.transporte()))
    }
}


