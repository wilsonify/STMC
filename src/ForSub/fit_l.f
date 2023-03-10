      SUBROUTINE FIT_L(NDAT,X,Y,SGY,A,SGA,CHI2,Q,COV) bind(c,name="fit_l_")
         !C
         !C Copyright, Bernd Berg, November 1, 2000.
         !C  GIVEN IS A SET OF NDAT POINTS X(I), Y(I) WITH STANDARD DEVIATIONS
         !C  SGY(I). MINIMIZING CHI^2 THEY ARE FITTED TO A STRAIGHT LINE.
         !C
         !C  RETURNED ARE A(1), A(2) AND THEIR ERROR BARS SGA(1), SGA(2).
         !C  FOR N.GE.3: ALSO THE CHI-SQUARE CHI2, AND THE GOODNES OF FIT Q.
         use iso_c_binding
         implicit none
         real(c_double) :: X,Y,SGY,A,SGA,CHI2,Q,COV
         real(c_double) :: SX,SY,STT,S,T,WT,SXOS,GAMMA_P
         real(c_double),parameter :: ZERO=0.0,ONE=1.0,HALF=0.5

         integer(c_int) :: NDAT,I


         DIMENSION A(2),SGA(2),X(NDAT),Y(NDAT),SGY(NDAT)
         SX=ZERO
         SY=ZERO
         STT=ZERO
         A(2)=ZERO
         S=ZERO
         DO I=1,NDAT
            WT=ONE/SGY(I)**2
            S=S+WT
            SX=SX+X(I)*WT
            SY=SY+Y(I)*WT
         END DO
         SXOS=SX/S
         DO I=1,NDAT
            T=(X(I)-SXOS)/SGY(I)
            STT=STT+T*T
            A(2)=A(2)+T*Y(I)/SGY(I)
         END DO
         A(2)=A(2)/STT
         A(1)=(SY-SX*A(2))/S
         SGA(1)=SQRT((ONE+SX*SX/(S*STT))/S)
         SGA(2)=SQRT(ONE/STT)
         COV=-SX/(S*STT)
         CHI2=ZERO
         DO I=1,NDAT
            CHI2=CHI2+((Y(I)-A(1)-A(2)*X(I))/SGY(I))**2
         END DO
         IF (NDAT.GT.2) Q=ONE-GAMMA_P(HALF*(NDAT-2),HALF*CHI2)
         RETURN
      END
