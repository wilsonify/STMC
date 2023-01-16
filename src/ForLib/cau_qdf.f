      FUNCTION CAU_QDF(X) bind(c,name="cau_qdf_")
         !C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.
         use iso_c_binding
         implicit none
         real(c_double) :: CAU_QDF,X,GAU_QDF
         real(c_double),parameter :: ONE=1.0,HALF=0.5,PI=3.14159
         CAU_QDF=HALF+ATAN(X)/PI
         IF(CAU_QDF.GT.HALF) GAU_QDF=ONE-GAU_QDF
         RETURN
      END
