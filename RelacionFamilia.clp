; Datos de personas
(deftemplate Persona
(field Nombre)
(field Casado_con)
(field Sexo)
(multifield Hijos)
)
(deftemplate Pregunta
(field Nombre1)
(field Nombre2))
(deffacts VariosHechos
(Persona
(Nombre Paco)
(Casado_con Juani)
(Sexo V)
(Hijos Dani FranciscoJ))

(Persona
(Nombre Juani)
(Casado_con Paco)
(Sexo M)
(Hijos Dani FranciscoJ))

(Persona
(Nombre Dani)
(Casado_con Nadie)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre FranciscoJ)
(Casado_con Nadie)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre Montse)
(Casado_con Juande)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Juande)
(Casado_con Montse)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre Merci)
(Casado_con Antonio)
(Sexo M)
(Hijos Silvia Antonito))

(Persona
(Nombre Antonio)
(Casado_con Merci)
(Sexo V)
(Hijos Silvia Antonito))

(Persona
(Nombre Silvia)
(Casado_con Nadie)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Antonito)
(Casado_con Nadie)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre Mercedes)
(Casado_con Manolo)
(Sexo M)
(Hijos Merci Juani Montse Manolito))

(Persona
(Nombre Manolo)
(Casado_con Mercedes)
(Sexo V)
(Hijos Merci Juani Montse Manolito))

(Persona
(Nombre Manolito)
(Casado_con Conchi)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre Conchi)
(Casado_con Manolito)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Mari)
(Casado_con Nadie)
(Sexo M)
(Hijos Javi Estrella))

(Persona
(Nombre Javi)
(Casado_con Nadie)
(Sexo V)
(Hijos Ninguno))

(Persona
(Nombre Estrella)
(Casado_con Nadie)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Antonia)
(Casado_con Victor)
(Sexo M)
(Hijos Lidia Irene))

(Persona
(Nombre Victor)
(Casado_con Antonia)
(Sexo V)
(Hijos Lidia Irene))

(Persona
(Nombre Lidia)
(Casado_con Nadie)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Irene)
(Casado_con Nadie)
(Sexo M)
(Hijos Ninguno))

(Persona
(Nombre Francisco)
(Casado_con Nieves)
(Sexo V)
(Hijos Paco Antonia Mari))

(Persona
(Nombre Nieves)
(Casado_con Francisco)
(Sexo M)
(Hijos Paco Antonia Mari)))

;Reglas

(defrule MaridoyMujer
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N1 & ?N3))
(Persona
(Nombre ?N2 & ~?N1 & ?N4)
(Casado_con ?N1))
=>
(printout t ?N1 " esta casado con " ?N2 crlf))

(defrule Hermanos
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona  
(Nombre ?N1)
(Hijos $? ?N3 $? ?N4 $?)
(Casado_con ?N2))
=>
(printout t "Por lo tanto " ?N3 " es hermano de " ?N4 " sus padres son " ?N1 " y " ?N2 crlf))

(defrule Cunhado
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona  
(Nombre ?N1)
(Casado_con ?N3))
(Persona  
(Nombre ?N5)
(Hijos $? ?N1 $?))
(Persona 
(Nombre ?N5)
(Hijos $? ?N4 & ~?N1 $?))
=>
(printout t ?N3 " esta casado con " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N5 crlf)
(printout t ?N4 " es hij@ de " ?N5 crlf)
(printout t ?N1 " es herman@ de " ?N4 crlf)
(printout t "Por lo tanto " ?N3 " es cunhad@ de " ?N4 crlf))

(defrule Cunhado_
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona  
(Nombre ?N5)
(Hijos $? ?N4 $?))
(Persona 
(Nombre ?N5)
(Hijos $? ?N1 & ~?N4 $?))
(Persona  
(Nombre ?N1)
(Casado_con ?N3))
=>
(printout t ?N3 " esta casado con " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N5 crlf)
(printout t ?N4 " es hij@ de " ?N5 crlf)
(printout t ?N1 " es herman@ de " ?N4 crlf)
(printout t "Por lo tanto " ?N4 " es cunhad@ de " ?N3 crlf))

(defrule Cunhado_cas
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona  
(Nombre ?N4)
(Casado_con ?N1))
(Persona 
(Nombre ?N3)
(Casado_con ?N2))
(Persona  
(Nombre ?N5)
(Hijos $? ?N1 $?))
(Persona  
(Nombre ?N5)
(Hijos $? ?N2 $?))
=>
(printout t ?N4 " esta casado con " ?N1 crlf)
(printout t ?N3 " esta casado con " ?N2 crlf)
(printout t ?N1 " es hij@ de " ?N5 crlf)
(printout t ?N2 " es hij@ de " ?N5 crlf)
(printout t ?N1 " es herman@ de " ?N2 crlf)
(printout t "Por lo tanto " ?N4 " es cunhad@ de " ?N3 crlf))

(defrule sobrino
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N1)
(Hijos $? ?N3 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N1 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N4 & ~?N1 $?))
=>
(printout t ?N3 " es hij@ de " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N2 crlf)
(printout t ?N4 " es hij@ de " ?N2 crlf)
(printout t ?N4 " es herman@ de " ?N1 crlf)
(printout t "Por lo tanto " ?N3 " es sobrin@ de " ?N4 crlf))

(defrule Ti@_politico
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona
(Nombre ?N1)
(Hijos $? ?N3 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N1 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N5 & ~?N1 $?))
(Persona
(Nombre ?N5)
(Casado_con ?N4))
=>
(printout t ?N3 " es hij@ de " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N2 crlf)
(printout t ?N5 " es hij@ de " ?N2 crlf)
(printout t ?N5 " es herman@ de " ?N1 crlf)
(printout t ?N5 " esta casad@ con " ?N4 crlf)
(printout t "Por lo tanto " ?N4 " es ti@ politco de " ?N3 crlf))

(defrule Sobrin@_politico
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona
(Nombre ?N1)
(Hijos $? ?N4 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N1 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N5 & ~?N1 $?))
(Persona
(Nombre ?N5)
(Casado_con ?N3))
=>
(printout t ?N4 " es hij@ de " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N2 crlf)
(printout t ?N5 " es hij@ de " ?N2 crlf)
(printout t ?N2 " es herman@ de " ?N5 crlf)
(printout t ?N5 " esta casad@ de " ?N3 crlf)
(printout t "Por lo tanto " ?N4 " es sobrin@ politco de " ?N3 crlf))

(defrule Tio
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona
(Nombre ?N1)
(Hijos $? ?N3 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N1 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N4 & ~?N1 $?))
=>
(printout t ?N3 " es hij@ de " ?N1 crlf)
(printout t ?N1 " es hij@ de " ?N2 crlf)
(printout t ?N4 " es hij@ de " ?N2 crlf)
(printout t ?N4 " es herman@ de " ?N1 crlf)
(printout t "Por lo tanto " ?N4 " es ti@ de " ?N3 crlf))

(defrule Padre_Hijo
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N4)
(Hijos $? ?N3 ?))
=>
(printout t "Por lo tanto " ?N3 " es hij@ de " ?N4 crlf))

(defrule Hijo_Padre
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona
(Nombre ?N4)
(Sexo V)
(Hijos $? ?N3 ?))
=>
(printout t "Por lo tanto " ?N4 " es padre de " ?N3 crlf))

(defrule Hijo_Madre
(Pregunta
(Nombre1 ?N4)
(Nombre2 ?N3))
(Persona
(Nombre ?N4)
(Sexo M)
(Hijos $? ?N3 ?))
=>
(printout t "Por lo tanto " ?N4 " es madre de " ?N3 crlf))

(defrule Primos
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N1)
(Hijos $? ?N3 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N4 $?))
(Persona 
(Nombre ?N5)
(Hijos $? ?N2 $?))
(Persona 
(Nombre ?N5)
(Hijos $? ?N1 & ~?N2 $?))
=>
(printout t ?N3 " es hij@ de " ?N1 crlf)
(printout t ?N4 " es hij@ de " ?N2 crlf)
(printout t ?N2 " es hij@ de " ?N5 crlf)
(printout t ?N1 " es hij@ de " ?N5 crlf)
(printout t ?N1 " es herman@ de " ?N2 crlf)
(printout t "Por lo tanto " ?N3 " es prim@ de " ?N4 crlf))

(defrule Nieto
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N2)
(Hijos $? ?N3 $?))
(Persona
(Nombre ?N4)
(Hijos $? ?N2 $?))
=>
(printout t ?N3 " es hij@ de " ?N2 crlf)
(printout t ?N2 " es hij@ de " ?N4 crlf)
(printout t "Por lo tanto " ?N3 " es niet@ de " ?N4 crlf))

(defrule Abuelo
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N3)
(Hijos $? ?N2 $?))
(Persona
(Nombre ?N2)
(Hijos $? ?N4 $?))
=>
(printout t ?N2 " es hij@ de " ?N3 crlf)
(printout t ?N4 " es hij@ de " ?N2 crlf)
(printout t "Por lo tanto " ?N3 " es abuel@ de " ?N4 crlf))

(defrule Yerno
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N3)
(Sexo V)
(Casado_con ?N1))
(Persona
(Nombre ?N4)
(Hijos $? ?N1 $?))
=>
(printout t ?N3 " es varon y casado con " ?N1 crlf)
(printout t ?N1 " hij@ " ?N4 crlf)
(printout t "Por lo tanto " ?N3 " es yerno de " ?N4 crlf))

(defrule Nuera
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N3)
(Sexo M)
(Casado_con ?N1))
(Persona
(Nombre ?N4)
(Hijos $? ?N1 $?))
=>
(printout t ?N3 " es mujer y casado con " ?N1 crlf)
(printout t ?N1 " hij@ " ?N4 crlf)
(printout t "Por lo tanto " ?N3 " es nuera de " ?N4 crlf))

(defrule Suegro
(Pregunta
(Nombre1 ?N3)
(Nombre2 ?N4))
(Persona
(Nombre ?N3)
(Hijos $? ?N1 $?))
(Persona
(Nombre ?N4)
(Casado_con ?N1))
=>
(printout t ?N1 " hij@ " ?N3 crlf)
(printout t ?N4 " esta casad@ con " ?N1 crlf)
(printout t "Por lo tanto " ?N3 " es suegr@ de " ?N4 crlf))


(defrule IntroducirNombre
=>
(printout t "Introduzca su nombre" crlf)
(bind ?Respuesta1 (read))
(printout t "Introduzca su nombre" crlf)
(bind ?Respuesta2 (read))
(assert (Pregunta (Nombre1 ?Respuesta1)(Nombre2 ?Respuesta2))))