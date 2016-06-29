; Datos de coste
(deftemplate precio
(slot Coste))
(deffacts VariosHechos
(precio
(Coste 5))
(precio
(Coste 1))
(precio
(Coste 3))
(precio
(Coste 8))
(precio
(Coste 15))
(precio
(Coste 35))
(precio
(Coste 25))
(precio
(Coste 98))
(precio
(Coste 64))
(precio
(Coste 63))
(precio
(Coste 43))
(precio
(Coste 21))
)

(deffacts Menor
	(Coste_m 1000000000000000)
)

(defrule Buscar_minimo
	(precio (Coste ?n1))
	?coste <- (Coste_m ?n2)
	(test (< ?n1 ?n2))
	=>
	(assert (Coste_m ?n1))
	(retract ?coste)
)

(defrule Eliminar_minimo
	?coste <- (Coste_m ?n2)
	?menor <-(precio (Coste ?n2))
	=>
	(retract ?coste)
	(retract ?menor)
)
	
