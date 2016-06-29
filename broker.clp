(defrule openCartera
        (declare (salience 120))
        =>
        (open "Cartera.txt" cartera)
        (assert (SeguirLeyendoCartera))
)


(defrule LeerCartera
        (declare (salience 110))
        ?f <- (SeguirLeyendoCartera)
        =>
        (bind ?empresa1 (read cartera))
        (bind ?acciones1 (read cartera))
        (bind ?inversion1 (read cartera))
        (retract ?f)
        (if (neq ?empresa1 EOF) then
                (assert
                        (Acciones
                                (empresa ?empresa1)
                                (n_acciones ?acciones1)
                                (coste ?inversion1)
                        )

                )
                (assert (SeguirLeyendoCartera))
        )
)


(defrule closeCartera
        (declare (salience 100))
        =>
        (close cartera)
)

(defrule openNoticias
        (declare (salience 120))
        =>
        (open "Noticias.txt" noticia)
        (assert (SeguirLeyendoNoticia))
)


(defrule LeerNoticias
        (declare (salience 110))
        ?f <- (SeguirLeyendoNoticia)
        =>
        (bind ?Sobre1 (read noticia))
        (bind ?Tipo1 (read noticia))
        (bind ?Antiguedad1 (read noticia))
        (bind ?Fecha1 (read noticia))
        (retract ?f)
        (if (neq ?Sobre1 EOF) then
                (assert
                        (Noticia
                                (Sobre ?Sobre1)
                                (Tipo ?Tipo1)
                                (Antiguedad ?Antiguedad1)
                                (Fecha ?Fecha1)
                        )

                )
                (assert (SeguirLeyendoNoticia))
        )
)


(defrule closeNoticias
        (declare (salience 100))
        =>
        (close noticia)
)







(defrule openfile
(declare (salience 60))
=>
(open "Analisis.txt" mydata)
(assert (SeguirLeyendo))
 )

 (defrule LeerValoresCierreFromFile
        (declare (salience 50))
        ?f <- (SeguirLeyendo)
        => (bind ?Nombre1 (read mydata))
         (bind ?Precio1 (read mydata))
         (bind ?Var_dia1 (read mydata))
         (bind ?Capitalizacion1 (read mydata))
         (bind ?PER1 (read mydata))
         (bind ?RPD1 (read mydata))
         (bind ?Tamano1 (read mydata))
         (bind ?Ibex1 (read mydata))
         (bind ?Etiq_PER1 (read mydata))
         (bind ?Etiq_RPD1 (read mydata))
         (bind ?Sector1 (read mydata))
         (bind ?Var_5dias1 (read mydata))
         (bind ?Perd3consec1 (read mydata))
         (bind ?Perd5consec1 (read mydata))
         (bind ?Var_Sector_5dias1 (read mydata))
         (bind ?VRS5-51 (read mydata))
         (bind ?VarMen1 (read mydata))
         (bind ?VarTri1 (read mydata))
         (bind ?VarSem1 (read mydata))
         (bind ?Var12mes1 (read mydata))
         (retract ?f)
         (if (neq ?Nombre1 EOF) then
         (assert (Analisis 
                (Nombre ?Nombre1)
                (Precio ?Precio1)
                (Var_dia ?Var_dia1)
                (Capitalizacion ?Capitalizacion1)
                (PER ?PER1)
                (RPD ?RPD1)
                (Tamano ?Tamano1)
                (Ibex ?Ibex1)
                (Etiq_PER ?Etiq_PER1)
                (Etiq_RPD ?Etiq_RPD1)
                (Sector ?Sector1)
                (Var_5dias ?Var_5dias1)
                (Perd3consec ?Perd3consec1)
                (Perd5consec ?Perd5consec1)
                (Var_Sector_5dias ?Var_Sector_5dias1)
                (VRS5_5 ?VRS5-51)
                (VarMen ?VarMen1)
                (VarTri ?VarTri1)
                (VarSem ?VarSem1)
                (Var12mes ?Var12mes1)
                ))
         (assert (SeguirLeyendo))))



(defrule closefile
(declare (salience 40))
=>
(close mydata)
 )


(defrule openAnalisisSector
        (declare (salience 30))
        =>
        (open "AnalisisSectores.txt" mydata1)
        (assert (SeguirLeyendoAnalisisSector))
 )

(defrule leerSector
        (declare (salience 20))
        ?f <- (SeguirLeyendoAnalisisSector)
        =>
        (bind ?Nombre1 (read mydata1))
        (bind ?Var_dia1 (read mydata1))
        (bind ?Capitalizacion1 (read mydata1))
        (bind ?PER1 (read mydata1))
        (bind ?RPD1 (read mydata1))
        (bind ?Ibex1 (read mydata1))
        (bind ?Var_5dias1 (read mydata1))
        (bind ?Perd3consec1 (read mydata1))
        (bind ?Perd5consec1 (read mydata1))
        (bind ?VarMen1 (read mydata1))
        (bind ?VarTri1 (read mydata1))
        (bind ?VarSem1 (read mydata1))
        (bind ?Var12mes1 (read mydata1))
        (retract ?f)
        (if (neq ?Nombre1 EOF) then
                (assert (Analisis_Sector
                        (Nombre ?Nombre1)
                        (Var_dia ?Var_dia1)
                        (Capitalizacion ?Capitalizacion1)
                        (PER ?PER1)
                        (RPD ?RPD1)
                        (Ibex ?Ibex1)
                        (Var_5dias ?Var_5dias1)
                        (Perd3consec ?Perd3consec1)
                        (Perd5consec ?Perd5consec1)
                        (VarMen ?VarMen1)
                        (VarTri ?VarTri1)
                        (VarSem ?VarSem1)
                        (Var12mes ?Var12mes1))
                )
                (assert (SeguirLeyendoAnalisisSector))
        )
)

 

(defrule closefilesector
(declare (salience 10))
=>
(close mydata1)
(assert (ACTUALIZADOR))
 )
;;ACTUALIZADOR DE CARTERA
(defrule actualizador_cartera
    (ACTUALIZADOR)
    ?f<-(Acciones (empresa ?empresa)(n_acciones ?acciones)(actualizado ~Y))
    (Analisis (Nombre ?empresa)(Precio ?coste))
    =>
    (assert (Acciones (empresa ?empresa)(n_acciones ?acciones)(coste (* ?coste ?acciones))(actualizado Y)))
    (retract ?f))


(defrule paso_modulo
    (declare (salience -10000))
    ?f<-(ACTUALIZADOR)
    =>
    (retract ?f)
    (assert (modulo_inestable))
    )

;;;;;;Valores inestables
(defrule Economia_Mala
        (modulo_inestable)
        (Noticia
                (Sobre Economia)
                (Tipo Mala)
                (Antiguedad ?N1)
        )
        (test (< ?N1 2))
        (Analisis
                (Nombre ?N2)
        )
        =>
        (assert (Inestable
               (empresa ?N2)
        )))


(defrule Valores_inestable_const
         (modulo_inestable)
        (Analisis
            (Nombre ?N1)
            (Sector  Construccion)
        )
        =>
        (assert (Inestable
               (empresa ?N1)
                )))

(defrule Valores_inestable_serv
        (modulo_inestable)
        (Analisis_Sector
                (Nombre Ibex)
                (Perd3consec true)
                )
        (Analisis
            (Nombre ?N1)
            (Sector  Servicios)
        )
        =>
        (assert (Inestable
               (empresa ?N1)
                )))

(defrule Valor_estable_noticia_sector
        (modulo_inestable)
        (Noticia
                (Sobre ?N2)
                (Tipo Buena)
                (Antiguedad ?N1)
        )
        (test (< ?N1 2))
        
        (Analisis
                (Nombre ?N3)
                (Sector ?N2)
        )
        ?inestable <- (Inestable(empresa ?N3))
        =>
        (retract ?inestable))



(defrule Valor_estable_noticia_empresa
        (modulo_inestable)
        (Noticia
                (Sobre ?N2)
                (Tipo Buena)
                (Antiguedad ?N1)
        )
        (test (< ?N1 2))
        
        (Analisis
                (Nombre ?N2)
        )
        ?inestable <- (Inestable(empresa ?N2))
        =>
        (retract ?inestable))

(defrule Valor_inestable_noticia_sector
        (modulo_inestable)
        (Noticia
                (Sobre ?N2)
                (Tipo Mala)
                (Antiguedad ?N1)
        )
        (test (< ?N1 2))
        
        (Analisis
                (Nombre ?N3)
                (Sector ?N2)
        )
        =>
        (assert (Inestable
               (empresa ?N3)
        )))



(defrule Valor_inestable_noticia_empresa
        (modulo_inestable)
        (Noticia
                (Sobre ?N2)
                (Tipo Mala)
                (Antiguedad ?N1)
        )
        (test (< ?N1 2))
        
        (Analisis
                (Nombre ?N2)
        )
        =>
        (assert (Inestable
               (empresa ?N2)
        )))

(defrule paso_modulo_peligrosos
    (declare (salience -10000))
    ?f<-(modulo_inestable)
    =>
    (retract ?f)
    (assert (modulo_peligroso))
    )

;;Detector de valores peligroso
(defrule Valor_peligroso_3dias
        (modulo_peligroso)
        (Acciones 
                (empresa ?empresa))
        (Analisis
                (Nombre ?empresa)
                (Perd3consec true)
        )

        =>
        (assert (Peligroso
               (empresa ?empresa)
        ))
)

(defrule Valor_peligroso_5dias
        (modulo_peligroso)
        (Acciones 
                (empresa ?empresa))
        (Analisis
                (Nombre ?empresa)
                (Perd5consec true)
                (VRS5_5 true);;
        )

        =>
        (assert (Peligroso
               (empresa ?empresa)
        ))
)


(defrule paso_modulo_sobrevalorados
    (declare (salience -10000))
    ?f<-(modulo_peligroso)
    =>
    (retract ?f)
    (assert (modulo_sobrevalorados))
    )

;;Detector de valores sobrevalorados

(defrule Valor_sobrevalorado
        (modulo_sobrevalorados)
        (Analisis
                (Nombre ?empresa)
                (Etiq_PER Alto)
                (Etiq_RPD Bajo)
        )

        =>
        (assert (Sobrevalorado
               (empresa ?empresa)
        ))
)

(defrule Valor_sobrevalorado_pequeña
        (modulo_sobrevalorados)
        (Analisis
                (Nombre ?empresa)
                (Tamano PEQUENIA)
                (Etiq_PER Alto)
        )

        =>
        (assert (Sobrevalorado
               (empresa ?empresa)
        ))
)

(defrule Valor_sobrevalorado_pequeña_2
        (modulo_sobrevalorados)
        (Analisis
                (Nombre ?empresa)
                (Tamano PEQUENIA)
                (Etiq_PER Medio)
                (Etiq_RPD Bajo)
        )

        =>
        (assert (Sobrevalorado
               (empresa ?empresa)
        ))
)

(defrule Valor_sobrevalorado_grande
        (modulo_sobrevalorados)
        (Analisis
                (Nombre ?empresa)
                (Tamano GRANDE)
                (Etiq_PER Medio|Alto)
                (Etiq_RPD Bajo)
        )
        =>
        (assert (Sobrevalorado
               (empresa ?empresa)
        ))
)

(defrule Valor_sobrevalorado_grande2
        (modulo_sobrevalorados)
        (Analisis
                (Nombre ?empresa)
                (Tamano GRANDE)
                (Etiq_PER Alto)
                (Etiq_RPD Medio)
        )
        =>
        (assert (Sobrevalorado
               (empresa ?empresa)
        ))
    )

(defrule paso_modulo_infravalorados
    (declare (salience -10000))
    ?f<-(modulo_sobrevalorados)
    =>
    (retract ?f)
    (assert (modulo_infravalorados))
    )


;Detector de valores infravalorados

(defrule Valor_infravalorado
        (modulo_infravalorados)
        (Analisis
                (Nombre ?empresa)
                (Etiq_PER Bajo)
                (Etiq_RPD Alto)
        )
        =>
        (assert (Infravalorada
               (empresa ?empresa)
        )))

(defrule Valor_infravalorado_caida
        (modulo_infravalorados)
        (Analisis
                (Nombre ?empresa)
                (VarMen ?mes)
                (VarTri ?tri)
                (VarSem ?sem)
                (Var12mes ?anio)
                (Etiq_PER Bajo)
        )
        (test (> ?mes 0))
        (test (< ?mes 10))
        (or
                (test (< ?tri -30))
                (test (< ?sem -30))
                (test (< ?anio -30)))
        =>
        (assert (Infravalorada
               (empresa ?empresa)
        ))
        )

(defrule Valor_infravalorado_grande
        (modulo_infravalorados)
        (Analisis
                (Nombre ?empresa)
                (Tamano GRANDE)
                (Sector ?sector)
                (Etiq_PER Medio)
                (Etiq_RPD Alto)
                (Var_dia ?dia)
        )
        (test (> ?dia 0))
        (Analisis_Sector
                (Nombre ?sector)
                (Var_dia ?diasector)
                )
        (test (< ?dia ?diasector))
        =>
        (assert (Infravalorada
               (empresa ?empresa)
        ))
        )

(defrule paso_modulo_propuestas
    (declare (salience -10000))
    ?f<-(modulo_infravalorados)
    =>
    (retract ?f)
    (assert (modulo_propuestas))
    )


;;Modulo 4.1 : Obtencion de posibles propuestas:

(defrule Vender_peligrosos
        (modulo_propuestas)
        (Acciones
                (empresa ?empresa)
                )
        (Peligroso 
                (empresa ?empresa))
        (Analisis
                (Nombre ?empresa)
                (VarMen ?mes)
                (Sector ?sector)
                (RPD ?RPD)
                
                )
        (Analisis_Sector
                (Nombre ?sector)
                (VarMen ?mesS)
                )
        
        (test (< ?mes 0))
        (test (< ?mes (- ?mesS 3)))
        =>
        (assert (Posibles_acciones
               (empresa1 ?empresa)
               (RE (- 20 (* ?RPD 100 )))
               (accion VENDER)
        ))
        )


;;Modulo 4.1 : Invertir en empresas infravaloradas

(defrule Invertir_infravaloradas
        (modulo_propuestas)
        (Infravalorada 
                (empresa ?empresa))
        (Analisis
                (Nombre ?empresa)
                (Precio ?Precio)
                (Sector ?sector)
                (RPD ?RPD)
                (PER ?PER)
                )
        (Analisis_Sector
                (Nombre ?sector)
                (PER ?PERm)
                )

        (Acciones
                (empresa DISPONIBLE)
                (n_acciones ?dinero)
                )
        (test (neq ?PER 0))
        (test (> ?dinero ?Precio))
        =>
        (assert (Posibles_acciones
               (empresa1 ?empresa)
               (RE (+(/(*(- ?PERm ?PER)100 )(* 5 ?PER))?RPD));;?¿
               (accion INVERTIR)
               
        ))
        )


(defrule Vender_sobrevaloradas
        (modulo_propuestas)
        (Acciones
                (empresa ?empresa)
                )
        (Sobrevalorado 
                (empresa ?empresa))
        (Analisis
                (Nombre ?empresa)
                (Precio ?Precio)
                (Var12mes ?anio)
                (PER ?PER)
                (Sector ?sector)
                (RPD ?RPD)
                
                )
        (Analisis_Sector
                (Nombre ?sector)
                (PER ?PERm)
                )

        (test (< ?anio (+ ?Precio 5)))
        =>
        (assert (Posibles_acciones
               (empresa1 ?empresa)
               (RE (+(* ?RPD -1)(/ (- ?PER ?PERm)(* 5 ?PER))))
               (accion VENDER)
               
        ))
        )

;;Modulo 4.1 : Proponer inversion a valores mas rentables

(defrule Invertir_valores_rentables
        (modulo_propuestas)
        (Acciones
                (empresa ?empresa2)
                )
        (not (Sobrevalorado(empresa ?empresa1)))
        (not (Infravalorada(empresa ?empresa2)))
        (Analisis
                (Nombre ?empresa2)
                (Var12mes ?anio)
                (RPD ?RPD2)
                )
        (Analisis
                (Nombre ?empresa1)
                (RPD ?RPD1)
                
                )
        (test (> ?RPD1 ?RPD2))
        =>
        (assert (Posibles_acciones
               (empresa1 ?empresa1)
               (empresa2 ?empresa2)
               (RE (- ?RPD1 (+ ?anio ?RPD2)))
               (accion CAMBIO)
               
        ))
        )

;;Modulo 4.2 :propuestas al usuario

(defrule paso_modulo_ordenacion
    (declare (salience -10000))
    ?f<-(modulo_propuestas)
    =>
    (retract ?f)
    (assert (modulo_ordenacion))
    )


(defrule Busqueda_mayor_1
        (declare (salience -80))
        (modulo_ordenacion)
        (Posibles_acciones (RE ?n1))
        ?coste <- (Coste_m ?n2)
        (test (> ?n1 ?n2))
        =>
        (assert (Coste_m ?n1))
        (retract ?coste)
)


(defrule Eleccion_mayor_1
        (declare (salience -90))
        (modulo_ordenacion)
        ?coste <- (Coste_m ?re)
        ?d<- (cont ?cont)
        (test(< ?cont 5))
        ?mayor <-(Posibles_acciones 
                (RE ?re )
                (empresa1 ?empresa1)
                (empresa2 ?empresa2)
                (accion ?accion))
        =>
        (assert (Propuesta 
                (RE ?re )
                (empresa1 ?empresa1)
                (empresa2 ?empresa2)
                (accion ?accion))
                )
        (retract ?coste)
        (retract ?mayor)
        (retract ?d)
        (assert (Coste_m 0))
        (assert (cont (+ ?cont 1)))
        )




(defrule paso_modulo_usuario
    (declare (salience -10000))
    (cont ?cont)
    (test(>= ?cont 5))
    ?f<-(modulo_ordenacion)
    =>
    (retract ?f)
    (assert (modulo_usuario))
    )
    


(defrule Menu_vender
    (modulo_usuario)
    (Propuesta (accion VENDER)
                (empresa1 ?empresa1)
                (RE ?re)
    )
    =>
    (printout t "Puede realizar la accion VENDER de : " ?empresa1 " con RE = " ?re crlf)


    )
(defrule Menu_invertir
    (modulo_usuario)
    (Propuesta (accion INVERTIR)
                (empresa1 ?empresa1)
                (RE ?re)
        )
        =>
        (printout t "Puede realizar la accion INVERTIR de : " ?empresa1 " con RE = " ?re crlf)

    )

(defrule Menu_cambio_inversion
    (modulo_usuario)
    (Propuesta (accion CAMBIO)
                (empresa1 ?empresa1)
                (empresa2 ?empresa2)
                (RE ?re)
    )
    =>
    (printout t "Puede realizar la accion de CAMBIO de las acciones de : " ?empresa2 " por la empresa "  ?empresa1 " con RE = " ?re crlf)
    )


(defrule paso_modulo_interaccion
    (declare (salience -10000))
    ?f<-(modulo_usuario)
    =>
    (retract ?f)
    (printout t "Introduzca la accion que quiere realizar" crlf)
    (bind ?Respuesta1 (read))
    (printout t "Introduzca la empresa" crlf)
    (bind ?Respuesta2 (read))
    (printout t "Usted va a realizar la accion " ?Respuesta1 " en la empresa " ?Respuesta2 crlf)
    (printout t "Ha cuantas acciones de la empresa " ?Respuesta2 "quiere realizar la accion de " ?Respuesta1 crlf)
    (bind ?Respuesta3 (read))
    (assert (Pregunta (accion (upcase ?Respuesta1))(empresa(upcase ?Respuesta2))(n_acciones ?Respuesta3)))
    (assert (modulo_interaccion))
    )



(defrule accion_usuario_error
    (modulo_interaccion)
    ?f<-(Pregunta (accion ?R1)
               (empresa ?R2)
               (n_acciones ?R3))
    (or (not (Propuesta (empresa1 ?R2)
                    (accion ?R1)))
        (test(< ?R3 0))
        )
    =>
    (printout t "Introduzca la accion que quiere realizar" crlf)
    (bind ?Respuesta1 (read))
    (printout t "Introduzca la empresa" crlf)
    (bind ?Respuesta2 (read))   
    (printout t "Usted va a realizar la accion " ?Respuesta1 " en la empresa " ?Respuesta2 crlf)
    (printout t "Ha cuantas acciones de la empresa " ?Respuesta2 " quiere realizar la accion de " ?Respuesta1 crlf)
    (retract ?f)
    (bind ?Respuesta3 (read))
    (assert (Pregunta (accion (upcase ?Respuesta1))(empresa(upcase ?Respuesta2))(n_acciones ?Respuesta3))))


(defrule accion_compra
    ?h<-(modulo_interaccion)
    ?a<-(Pregunta (accion INVERTIR)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (not (Acciones (empresa ?R2)))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (>= ?dinero (* ?R3 ?coste)))
    (test (> ?R3 0))
    =>
    (printout t "Usted ha realizado la compra de " ?R3 " acciones de la empresa " ?R2 crlf)
    (modify ?f (n_acciones (- ?dinero (* ?R3 ?coste))))
    (assert (Acciones(empresa ?R2)(n_acciones ?R3)(coste (* ?R3 ?coste))))
    (retract ?a)
    (retract ?h)
    (assert (vuelta_atras))
    )
(defrule accion_compra_accion
    ?h<-(modulo_interaccion)
    ?a<-(Pregunta (accion INVERTIR)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    ?e<-(Acciones
        (empresa ?R2)
        (n_acciones ?n))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (>= ?dinero (* ?R3 ?coste)))
    (test (> ?R3 0))
    =>
    (printout t "Usted ha realizado la compra de " ?R3 " acciones de la empresa " ?R2 crlf)
    (modify ?f (n_acciones (- ?dinero (* ?R3 ?coste))))
    (modify ?e (n_acciones (+ ?R3 ?n))(coste (* (+ ?R3 ?n) ?coste)))
    (retract ?a)
    (retract ?h)
    (assert (vuelta_atras))
    )

(defrule accion_compra_error
    (modulo_interaccion)
    ?a<-(Pregunta (accion INVERTIR)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (< ?dinero (* ?R3 ?coste)))
    (test (> ?R3 0))
    =>
    (printout t "Usted no ha podifo realizado la compra de " ?R3 " acciones de la empresa " ?R2" , porque no tiene suficiente dinero para su compra" crlf)
    (printout t "Usted puede comprar " (/ ?dinero ?coste) crlf)
    (printout t "Diga cuantas acciones quiere comprar : " crlf)
    (bind ?Respuesta1 (read))
    (modify ?a (n_acciones ?Respuesta1))
    )


    ;;FALTA TRATA DE ERROR POR SI NO PUEDE COMPRAR

(defrule accion_venta
    ?c<-(modulo_interaccion)
    ?a<-(Pregunta (accion VENDER)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa ?R2)
        (n_acciones ?acciones))
    ?h<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (> ?R3 0))
    (test (>= ?acciones ?R3))
    =>
    (printout t "Usted ha realizado la venta de " ?R3 " acciones de la empresa " ?R2 crlf)
    (modify ?h (n_acciones (+ ?dinero (* ?R3 ?coste))))
    (modify ?f (n_acciones (- ?acciones ?R3))(coste (* (- ?acciones ?R3) ?coste)))
    (retract ?a)
    (assert (vuelta_atras))
    (retract ?c)
    )

    (defrule accion_venta_error
    (modulo_interaccion)
    ?a<-(Pregunta (accion VENDER)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa ?R2)
        (n_acciones ?acciones))
    ?h<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (> ?R3 0))
    (test (< ?acciones ?R3))
    =>
    (printout t "Usted no ha podifo realizado la venta de " ?R3 " acciones de la empresa " ?R2" , porque no tiene suficiente acciones" crlf)
    (printout t "Usted puede vender " ?acciones crlf)
    (printout t "Diga cuantas acciones quiere vender : " crlf)
    (bind ?Respuesta1 (read))
    (modify ?a (n_acciones ?Respuesta1))
    )




;;FALTA TRATA DE ERROR POR SI NO PUEDE vender

;;Preguntar si debo vender las acciones y luego con el dinero comprar las acciones de la 2º empresa
(defrule accion_cambio
    ?c<-(modulo_interaccion)
    ?a<-(Pregunta (accion CAMBIO)
               (empresa ?R2)
               (n_acciones ?R3))
    (Propuesta 
        (empresa1 ?R2)
        (empresa2 ?empresa2))
    ?f<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    ?d<-(Acciones
        (empresa ?R2)
        (n_acciones ?acciones1)
        )
    (Analisis 
        (Nombre ?empresa2)
        (Precio ?coste2))
    (test(<= ?R3 ?acciones1))
    =>
    (printout t "Usted ha realizado la compra de " ?R3 " acciones de la empresa " ?R2 crlf)
    (modify ?d (n_acciones (- ?acciones1 ?R3)))
    (modify ?f (n_acciones (- ?dinero (* (/(* ?R3 ?coste)?coste2) ?coste2))))
    (assert (Acciones(empresa ?empresa2)(n_acciones (/(* ?R3 ?coste)?coste2))(coste (* (/(* ?R3 ?coste)?coste2) ?coste2))))
    (retract ?c)
    (assert (vuelta_atras))
    )

    (defrule accion_cambio_error
    (modulo_interaccion)
    ?a<-(Pregunta (accion CAMBIO)
               (empresa ?R2)
               (n_acciones ?R3))
    ?f<-(Acciones 
        (empresa ?R2)
        (n_acciones ?acciones))
    ?h<-(Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?dinero))
    (Analisis 
        (Nombre ?R2)
        (Precio ?coste))
    (test (> ?R3 0))
    (test (< ?acciones ?R3))
    =>
    (printout t "Usted no ha podifo realizado el cambio de " ?R3 " acciones de la empresa " ?R2" , porque no tiene suficiente acciones" crlf)
    (printout t "Usted puede cambiar " ?acciones crlf)
    (printout t "Diga cuantas acciones quiere cambiar : " crlf)
    (bind ?Respuesta1 (read))
    (modify ?a (n_acciones ?Respuesta1))
    )




(defrule limpieza_propuesta
    (vuelta_atras)
    ?d<-(Propuesta)
    =>
    (retract ?d)
    )

(defrule limpieza_opciones
    (vuelta_atras)
    ?d<-(Posibles_acciones)
    =>
    (retract ?d)
    )


(defrule limpieza_pregunta
    (vuelta_atras)
    ?d<-(Pregunta)
    =>
    (retract ?d)
    )


(defrule Menu_Salir
    (vuelta_atras)
    =>
    (printout t "Escriba SALIR para terminar" crlf)
    (bind ?Respuesta1 (read))
    (assert (Pregunta1 (accion (upcase ?Respuesta1))))
    )


(defrule Salida
    ?d<-(vuelta_atras)
    (Pregunta1 (accion SALIR))
    =>
    (retract ?d)
    (assert (Actualizar_cartera))
    )



(defrule Actualizar_coste_cartera
    (Actualizar_cartera)
    ?h<-(Acciones 
        (empresa DISPONIBLE)
        (coste ?c))
    ?f<-(Acciones 
        (empresa ?a & ~DISPONIBLE)
        (coste ?e))
        (actualizado N|Y)
    =>
    (modify ?h(coste (+ ?c ?e)))
    (modify ?f(actualizado F))
    )

(defrule apertura_cartera
    (declare(salience -10))
    (Actualizar_cartera)
    =>
    (open "Cartera.txt" Cartera2 "w")
    )
(defrule escritura_dinero
    (declare(salience -30))
    (Actualizar_cartera)
    (Acciones 
        (empresa DISPONIBLE)
        (n_acciones ?a)
        (coste ?c))
    =>
    (printout Cartera2 "DISPONIBLE" " " ?a " " ?c crlf)
    )
(defrule escritura_acciones
    (declare(salience -40))
    (Actualizar_cartera)
    (Acciones 
        (empresa ?a & ~DISPONIBLE)
        (n_acciones ?b)
        (coste ?c))
    =>
    (printout Cartera2 ?a " " ?b " " ?c crlf)
    )

(defrule cierre_cartera
    (declare(salience -1000))
    ?d<-(Actualizar_cartera)
    =>
    (retract ?d)
    )


(defrule volver_atras
    (declare (salience -10000))
    ?d<-(vuelta_atras)
    ?h<-(cont ?n)
    =>
    (retract ?h)
    (retract ?d)
    (assert (modulo_propuestas))
    (assert (cont 0))
    )