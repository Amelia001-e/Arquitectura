;------------ INFORMACI?N --------------
; Nombre   : Control de motor con 3 botones (Subir, Bajar, Parar)
; Autor    : Vivian Yesenia Carrillo Chicas
; Carnet    : 19.18975
; Curso    : Arquitectura de Computadora 1
; Micro    : PICAXE-20M2
; Entradas : C.3 (Subir), C.4 (Bajar), C.5 (Parar)
; Salidas  : C.0 (IN3), C.1 (IN4), C.2 (ENB)
; Funci?n  : Controlar un motor en dos direcciones o detenerlo
;----------------------------------------

;------------ INICIALIZACI?N -------------
symbol IN3 = C.0         ' Control de direcci?n: Subir
symbol IN4 = C.1         ' Control de direcci?n: Bajar
symbol ENB = C.2         ' Activaci?n del motor

symbol subir = C.3       ' Bot?n para subir
symbol bajar = C.4       ' Bot?n para bajar
symbol parar = C.5       ' Bot?n para detener

symbol estadoSubir = b0  ' Estado bot?n Subir
symbol estadoBajar = b1  ' Estado bot?n Bajar
symbol estadoParar = b2  ' Estado bot?n Parar

; Configurar pines
dirsC = %00000111    ' C.0, C.1, C.2 como salidas; C.3, C.4, C.5 como entradas

;------------ BUCLE PRINCIPAL -------------
main:
    ; Leer los estados de los botones
    estadoSubir = pinC.3
    estadoBajar = pinC.4
    estadoParar = pinC.5

    ; Verificar qu? bot?n est? presionado
    if estadoSubir = 1 then
        gosub motor_subir
    elseif estadoBajar = 1 then
        gosub motor_bajar
    elseif estadoParar = 0 then
        gosub motor_parar
    endif

    pause 100          ; Pausa para estabilizar lectura de botones
    goto main

;------------ SUBRUTINAS -----------------

; Subrutina para subir
motor_subir:
    high ENB           ' Encender motor
    high IN3           ' Direcci?n: Subir
    low IN4
    return

; Subrutina para bajar
motor_bajar:
    high ENB           ' Encender motor
    low IN3
    high IN4           ' Direcci?n: Bajar
    return

; Subrutina para parar
motor_parar:
    low ENB            ' Apagar motor
    return
