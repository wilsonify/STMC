      FUNCTION BBI_NK_DF_INV(Y,X1,X2) BIND(c,name="bbi_nk_df_inv_")
         USE ISO_C_BINDING
         IMPLICIT NONE
         REAL(C_DOUBLE) :: BBI_NK_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: BBI_NK_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = BBI_NK_DF(XX1)
         Y2 = BBI_NK_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = BBI_NK_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         BBI_NK_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION BBI1_NK_DF_INV(Y,X1,X2) BIND(c,name="bbi1_nk_df_inv_")
         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: Y, X1, X2
         REAL(C_DOUBLE) :: BBI1_NK_DF_INV,BBI1_NK_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = BBI1_NK_DF(XX1)
         Y2 = BBI1_NK_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = BBI1_NK_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         BBI1_NK_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION BINO_NK_DF_INV(Y,X1,X2) BIND(c,name="bino_nk_df_inv_")
         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: BINO_NK_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: BINO_NK_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = BINO_NK_DF(XX1)
         Y2 = BINO_NK_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = BINO_NK_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         BINO_NK_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION BINO1_NK_DF_INV(Y,X1,X2) BIND(c,name="bino1_nk_df_inv_")

         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: BINO1_NK_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: BINO1_NK_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = BINO1_NK_DF(XX1)
         Y2 = BINO1_NK_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = BINO1_NK_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         BINO1_NK_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION CHI2_DF_INV(Y,X1,X2) BIND(c,name="chi2_df_inv_")

         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: CHI2_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: CHI2_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = CHI2_DF(XX1)
         Y2 = CHI2_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = CHI2_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         CHI2_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION F_DF_INV(Y,X1,X2) BIND(c,name="f_df_inv_")

         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: F_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: F_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = F_DF(XX1)
         Y2 = F_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = F_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         F_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION GAU_DF_INV(Y,X1,X2) BIND(c,name="gau_df_inv_")

         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: GAU_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: GAU_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = GAU_DF(XX1)
         Y2 = GAU_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = GAU_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         GAU_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END

      FUNCTION STUD_DF_INV(Y,X1,X2) BIND(c,name="stud_df_inv_")

         USE ISO_C_BINDING
         IMPLICIT NONE

         REAL(C_DOUBLE) :: STUD_DF_INV, Y, X1, X2
         REAL(C_DOUBLE) :: STUD_DF
         REAL(C_DOUBLE) :: XX1, XX2, Y1, Y2, XX, FF
         INTEGER(C_INT) :: ITER, ITERMAX
         REAL(C_DOUBLE) :: EPS
         REAL(C_DOUBLE), PARAMETER :: ONE = 1.0, TEN = 10.0, HALF = 0.5

         EPS = ONE / TEN**8
         ITERMAX = 1000
         ITER = 0

         XX1 = X1
         XX2 = X2

         Y1 = STUD_DF(XX1)
         Y2 = STUD_DF(XX2)

         IF (Y1 > Y2) THEN
            XX1 = X2
            XX2 = X1
         END IF

         IF (Y <= Y1 .OR. Y >= Y2) THEN
            PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
            PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
            PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
            STOP 'FI1'
         END IF

         DO WHILE (ABS(XX2 - XX1) <= EPS)
            ITER = ITER + 1
            IF (ITER > ITERMAX) THEN
               PRINT*, 'FI1: NO CONVERGENCE OR Y OUT OF RANGE !'
               PRINT*, 'ITERMAX, EPS:', ITERMAX, EPS
               PRINT*, 'Y1, Y, Y2:    ', Y1, Y, Y2
               STOP 'FI1'
            END IF

            XX = HALF * (XX1 + XX2)
            FF = STUD_DF(XX)
            IF (FF <= Y) THEN
               XX1 = XX
            ELSE
               XX2 = XX
            END IF

         END DO
         STUD_DF_INV = HALF * (XX2 + XX1)
         RETURN
      END
