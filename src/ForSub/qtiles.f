      SUBROUTINE QTILES(N,X,Q,XQ1,XQ2)
         use iso_c_binding
         implicit none
         real(c_double) :: X,Q,XQ1,XQ2,W2,W1
         integer(c_int) :: N,NQ
         real(c_double),parameter :: ONE=1.0
         DIMENSION X(N)
         NQ=INT(Q*N)
c      PRINT*,'NQ,Q,N:',NQ,Q,N
         IF(NQ.EQ.0) STOP 'QTILES: N too small.'
         W2=Q*(N+1)-(NQ*ONE)
         W1=ONE-W2
         XQ1=W1*X(NQ)  +W2*X(NQ+1)
         XQ2=W1*X(N+1-NQ)+W2*X(N-NQ)
         RETURN
      END
