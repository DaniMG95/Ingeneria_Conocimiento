; Datos de articulos
(deftemplate articulo
(field Nombre)
(field Tipo)
)
(deffacts VariosHechos
(articulo
(Nombre gafas)
(Tipo natacion))

(articulo
(Nombre chanclas)
(Tipo natacion))

(articulo
(Nombre gorros)
(Tipo natacion))

(articulo
(Nombre galletas)
(Tipo comida))

(articulo
(Nombre chorizo)
(Tipo comida))

(articulo
(Nombre pan)
(Tipo comida))

(articulo
(Nombre magdalenas)
(Tipo comida))

(articulo
(Nombre lentejas)
(Tipo comida))

(articulo
(Nombre zapatillas)
(Tipo running))

(articulo
(Nombre camiseta)
(Tipo running))

(articulo
(Nombre pantalones)
(Tipo running))

(articulo
(Nombre reloj)
(Tipo running))

(articulo
(Nombre pulsometro)
(Tipo running))

(articulo
(Nombre cama)
(Tipo muebles))

(articulo
(Nombre sofa)
(Tipo muebles))

(articulo
(Nombre mesa)
(Tipo muebles))

(articulo
(Nombre silla)
(Tipo muebles))

(articulo
(Nombre armario)
(Tipo muebles))

(articulo
(Nombre pepsi)
(Tipo bebida))

(articulo
(Nombre fanta)
(Tipo bebida))

(articulo
(Nombre agua)
(Tipo bebida))

(articulo
(Nombre zumo)
(Tipo bebida))

(articulo
(Nombre energeticas)
(Tipo bebida))
)
(deftemplate Pregunta
(field Nombre1))

(defrule IntroducirNombre
=>
(printout t "Introduzca el tipo" crlf)
(bind ?Respuesta1 (read))
(assert (Pregunta (Nombre1 (lowcase ?Respuesta1)))))

(defrule TipoElegido
(Pregunta
(Nombre1 ?N3))
(articulo
(Tipo ?N3)
(Nombre ?N1))
=>
(printout t " articulo de tipo : " ?N3 " su nombre es :  " ?N1 crlf))

(defrule Error
(Pregunta
(Nombre1 ?N3))
(not(articulo (Tipo ?N3 )))
=>
(printout t "Ha introducido mal el nombre, vuelva a introducirlo" crlf)
(bind ?Respuesta1 (read))
(assert (Pregunta (Nombre1 (lowcase ?Respuesta1)))))

