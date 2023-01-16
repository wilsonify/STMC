      SUBROUTINE RMAGAU(XG,YG)
         !C Copyright, Bernd Berg, Sep 21, 2000.
         !C  GENERATES INDEPNDENT RANDOM NUMBERS XG,YG WITH NORMAL DISTRIBUTION
         !C  P(X)=SQRT(AN/PI)*EXP(-X**2/SQRT(2)), I.E. VARIANCE 1.
         use iso_c_binding
         implicit none

         CALL RANMAR(XR)
         R=SQRT(-TWO*LOG(ONE-XR)) ! XR can be zero but not one.
         CALL RANMAR(XR)
         RCOS=COS(TPI*XR)
         XG=R*RCOS
         RSIN=SIN(TPI*XR)
         YG=R*RSIN
         RETURN
      END
