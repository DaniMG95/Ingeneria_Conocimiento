(deftemplate Analisis
(field Nombre)
(field Precio)
(field Var_dia)
(field Capitalizacion)
(field PER)
(field RPD)
(field Tamano)
(field Ibex)
(field Etiq_PER)
(field Etiq_RPD)
(field Sector)
(field Var_5dias)
(field Perd3consec)
(field Perd5consec)
(field Var_Sector_5dias)
(field VRS5_5)
(field VarMen)
(field VarTri)
(field VarSem)
(field Var12mes)
)
(deftemplate Analisis_Sector
(field Nombre)
(field Var_dia)
(field Capitalizacion)
(field PER)
(field RPD)
(field Ibex)
(field Var_5dias)
(field Perd3consec)
(field Perd5consec)
(field VarMen)
(field VarTri)
(field VarSem)
(field Var12mes)
)

(deftemplate Acciones
(field empresa)
(field n_acciones)
(field coste)
(field actualizado)
)

(deftemplate Noticia
(field Sobre)
(field Tipo)
(field Antiguedad)
(field Fecha)
)


(deftemplate Inestable
        (field empresa))
(deftemplate Peligroso
        (field empresa))
(deftemplate Sobrevalorado
        (field empresa))
(deftemplate Infravalorada
        (field empresa))


(deftemplate Propuesta
        (field empresa1)
        (field empresa2)
        (field RE)
        (field accion))



(deftemplate Posibles_acciones
        (field empresa1)
        (field empresa2)
        (field RE)
        (field accion))

(deffacts mayor
        (Coste_m 0)
)

(deffacts contador
        (cont 0)
)

(deftemplate Pregunta
(field accion)
(field empresa)
(field n_acciones ))

(deftemplate Pregunta1
(field accion))