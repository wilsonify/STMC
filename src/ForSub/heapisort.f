      SUBROUTINE HEAPISORT(N,IX) bind(c,name="heapisort_")
         !C COPYRIGHT, BERND BERG, FEB 14, 2003.
         use iso_c_binding
         implicit none
         integer(c_int) :: N,IX,M,NHALF,ITEMP,I1,I2,I

         DIMENSION IX(N)

         !C BUILDING THE HEAP:
         !C ==================
         NHALF=N/2
         DO M=NHALF,1,-1
            ITEMP=IX(M)
            I1=M
            I2=M+M
    1       CONTINUE
            !C INDEX THE LARGER OF IX(I2) AND IX(I2+1) AS I2:
            IF(I2.LT.N .AND. IX(I2+1).GT.IX(I2)) I2=I2+1
            IF(IX(I2).GT.ITEMP) THEN
               IX(I1)=IX(I2)
               I1=I2
               I2=I1+I1
            ELSE
               I2=N+1
            ENDIF
            IF(I2.LE.N) GO TO 1
            IX(I1)=ITEMP ! FINAL POSITION FOR ITEMP=IX(M).
         END DO

         !C SORTING THE HEAP:
         !C =================
         DO I=N,3,-1 ! I IS THE NUMBER OF STILL COMPETING ELEMENTS.
            ITEMP=IX(I)
            IX(I)=IX(1) ! STORE TOP OF THE HEAP.
            I1=1
            I2=2
    2       CONTINUE
            !C INDEX THE LARGER OF IX(I2) AND IX(I2+1) AS I2:
            IF((I2+1).LT.I .AND. IX(I2+1).GT.IX(I2)) I2=I2+1
            IF(IX(I2).GT.ITEMP) THEN
               IX(I1)=IX(I2)
               I1=I2
               I2=I1+I1
            ELSE
               I2=I
            ENDIF
            IF(I2.LT.I) GO TO 2
            IX(I1)=ITEMP ! FINAL POSITION FOR ITEMP=IX(I).
         END DO
         ITEMP=IX(2)
         IX(2)=IX(1)
         IX(1)=ITEMP
         RETURN
      END
