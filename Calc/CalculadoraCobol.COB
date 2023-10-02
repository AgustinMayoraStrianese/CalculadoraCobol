      ******************************************************************
      * Author:Agustin Mayora
      * Date: 30/9/2023
      * Purpose: Calculadora Simple
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Calculadora.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
           77 WS-NUM1 PIC S9(05)V99.
           77 WS-NUM2 PIC S9(05)V9(2).
           77 WS-RESULTADO PIC S9(10)V99.
           77 WS-OPCION PIC A(01).
           77 WS-ELECCION PIC 9(1).
           77 WS-RES-FORMAT PIC -ZZZZZZZZZ9.99.
           77 WS-RESIDUO PIC 9(04).


       PROCEDURE DIVISION.
       MAIN-SECTION SECTION.
       MAIN.
           PERFORM CALCULADORA UNTIL WS-ELECCION = 2.

           STOP RUN.


      *    RUTINAS

       CALCULADORA.
           DISPLAY "1-. USAR LA CALCULADORA, 2-. SALIR".
           ACCEPT WS-ELECCION.

           IF WS-ELECCION = 1
               PERFORM PEDIR-DATOS
               PERFORM LOGICA-OPERACIONES
           ELSE
           IF WS-ELECCION = 2
              MOVE 2 TO WS-ELECCION
           ELSE
               DISPLAY "OPCION INVALIDA".

       PEDIR-DATOS.
           DISPLAY "CALCULADORA".
           DISPLAY "INGRESE EL PRIMER NUMERO:".
           ACCEPT WS-NUM1.
           DISPLAY "INGRESE EL SEGUNDO NUMERO:".
           ACCEPT WS-NUM2.
           DISPLAY "INDICA LA OPERACION A REALIZAR: S = SUMA,"
           "R = RESTA, M = MULTIPLICACION, D = DIVISION, L = MODULO,"
           " P = POTENCIA, Z = RAIZ.".
           INITIALIZE WS-OPCION.
           ACCEPT WS-OPCION.


       LOGICA-OPERACIONES.
           IF WS-OPCION = "S"
               ADD WS-NUM1 TO WS-NUM2 GIVING WS-RESULTADO
           ELSE
           IF WS-OPCION = "R"
               SUBTRACT WS-NUM1 FROM WS-NUM2 GIVING WS-RESULTADO
           ELSE
           IF WS-OPCION = "M"
               MULTIPLY WS-NUM1 BY WS-NUM2 GIVING WS-RESULTADO
           ELSE
           IF WS-OPCION = "D" OR "L"
               DIVIDE WS-NUM1 INTO WS-NUM2 GIVING WS-RESULTADO
                                           REMAINDER WS-RESIDUO
           ELSE
           IF WS-OPCION = "P"
               COMPUTE WS-RESULTADO = WS-NUM1 ** WS-NUM2
           ELSE
           IF WS-OPCION = "Z"
               COMPUTE WS-RESULTADO = WS-NUM1 **(1/WS-NUM2)
           ELSE
               DISPLAY "OPERACION INVALIDA, VERIFIQUE".

           IF WS-OPCION = "S" OR "R" OR "M" OR "D" OR "P" OR "Z"
               MOVE WS-RESULTADO TO WS-RES-FORMAT
               DISPLAY WS-RES-FORMAT
           ELSE
           IF WS-OPCION = "L"
               DISPLAY WS-RESIDUO.



       END PROGRAM Calculadora.
