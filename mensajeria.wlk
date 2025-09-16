import mensajeros.*

object mensajeria
{
    const property listaEmpleados = []
    const property paquetesPendientes = []
    var property enviado = false

    method contratarUnEmpleado(empleado) = listaEmpleados.add(empleado)

    method despedirUnEmpleado(empleado) = listaEmpleados.remove(empleado)

    method despedirATodos() = listaEmpleados.forEach({empleado => listaEmpleados.remove(empleado)})

//Si la mensajeria tiene mas de dos empleados
    method mensajeriaEsGrande() = listaEmpleados.size() > 2

//Consulta si el paquete fue entregado por el primer empleado
    method retornaPrimerEmpleado()
    {
        var primerEmpleado = listaEmpleados.get(0)
        return primerEmpleado
    }

    method paqueteEntregadoPrimerEmpleado()
    {
        return paquete.puedeSerEntregadoPor(self.retornaPrimerEmpleado())
    }

//Saber el peso del ultimo empleado contratado
    method saberPeso()
    {
        var ultimoEmpleado = listaEmpleados.get(listaEmpleados.size()-1)
        return ultimoEmpleado.peso()
    }

//Saber si al menos un empleado puede entregar el paquete
    method almenosUnEmpleadoEntrega(encomienda)
    {
        return listaEmpleados.any({empleado => encomienda.puedeSerEntregadoPor(empleado)})
    }

//Obtener todos los mensajeros que pueden llevar un paquete dado.
    method mensajeroPuedeLLevarPaquete(encomienda)
    {
        return listaEmpleados.filter({empleado => encomienda.puedeSerEntregadoPor(empleado)})
    }

//Saber si una mensajería tiene sobrepeso (si el promedio de peso de sus mensajeros es superior a 500 kg).
    method promedioPeso()
    {
        const aux = listaEmpleados.sum({empleado => empleado.peso()})
        const promedio = aux / listaEmpleados.size()
        return promedio
    }

    method saberSiHaySobrepeso() = self.promedioPeso() > 500

//Hacer que la empresa envie un paquete
    method eligeEmpleadoRepartir(encomienda)
    {
        const aux = listaEmpleados.find({empleado => encomienda.puedeSerEntregadoPor(empleado)})
        if( aux != null)
        {
            enviado = true
        }
        else
        {
            paquetesPendientes.add(encomienda)
        }
        return enviado
    }

  
    
}
