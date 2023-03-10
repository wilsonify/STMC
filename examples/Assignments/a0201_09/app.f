      PROGRAM GAU_DIF
C
C BERG, JUNE 14, 1999. COMPARISION OF TWO MEANS: 
C INPUT:   TWO GAUSSIAN DATA POINTS, MEAN VALUES AND ERROR BARS.
C OUTPUT:  PROBABILITY THAT THE DISCREPANCY IS DUE TO CHANCE.
C
      include '../../ForLib/implicit.sta'
c      include '../../ForLib/implicit.sta'
C
      PRINT*,'DIFFERENCE TEST: COMPARISION OF TWO MEANS.'
      PRINT*,'INPUT:   TWO MEANS VALUES, THEIR ERROR BARS 
     & (NOT VARIANCES!)'
      PRINT*,'LIKELIHOOD FOR THE OBSERVED DISCREPANCE TO BE 
     & DUE TO CHANCE' 
      PRINT*,'          '
1     CONTINUE
      PRINT*,'ENTER 1. MEAN VALUE (DATA POINT):'
      READ(5,*) XM1
      PRINT*,'ENTER ERROR BAR OF 1. DATA POINT:'
      READ(5,*) EB1
      PRINT*,'ENTER 2. MEAN VALUE (DATA POINT):'
      READ(5,*) XM2
      PRINT*,'ENTER ERROR BAR OF 2. DATA POINT:'
      READ(5,*) EB2
C
C VARIANCE OF THE DIFFERENCE: 
C
      CALL GAUDIF(XM1,EB1,XM2,EB2,Q)
C
      PRINT*,'Q = ',Q
      PRINT*,'OR EQUIVALENTLY:'
      Q=100.D00*Q
      PRINT 101,Q
101   FORMAT(1X,'   ',1F6.2,'%')
C
      STOP
      END

      include '../../ForLib/gaudif.f'
      include '../../ForLib/error_f.f'
      include '../../ForLib/gamma_p.f'
      include '../../ForLib/gamma_ln.f'
