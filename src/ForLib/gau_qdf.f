      FUNCTION GAU_QDF(X) bind(c,name="gau_qdf_")
         !C GAUSSIAN, PEAKED DISTRIBUTION FUNCTION. BERG, JUN 1 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: GAU_QDF,X,XX,ERROR_F
         real(c_double),parameter :: TWO=2.0,HALF=0.5,ONE=1.0
         XX=X/SQRT(TWO)
         GAU_QDF=HALF+HALF*ERROR_F(XX)
         IF(GAU_QDF.GT.HALF) GAU_QDF=ONE-GAU_QDF
         RETURN
      END
