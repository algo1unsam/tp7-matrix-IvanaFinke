object morfeo
{
    var property transporte = 0
    var property pesoMorfeo = 0
    var property cantidadDinero = 200

//Metodo que devuelve la suma del peso de morfeo y el vehiculo que use
    method peso() = self.pesoMorfeo() + transporte.peso()

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

object puente
{
    method dejarPasar(transporte)
    {
        return transporte.peso() <= 1000
    }
}

object trinity
{
    var property peso = 900 
 
 //Hace una llamada si el usuario tiene suficiente dinero
    method llamar(usuario) = (usuario.cantidadDinero() > 0) || (usuario.cantidadSaldo() > 0)
}

object neo
{
    var property peso = 0 
    //saldo en el celular:
    var property cantidadSaldo = 0
}
object paquete
{
    var property costoPagoPaquete = 100
    var property pagado = false 

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
    method estaPago(morfeo) = pagado
    
}