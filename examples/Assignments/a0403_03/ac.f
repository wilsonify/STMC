      PROGRAM AC
C
C Copyright, Bernd Berg, Sep 27, 2002.
C - AUTOCORRELATION FUNCTIN AND INTEGRATED AUTOCORRELATION TIME: 
C   TESTED FOR GAUSSIAN DATA GENERATED BY METROPOLIS MC.
C
      include '../../ForLib/implicit.sta'
      include '../../ForLib/constants.par'
      PARAMETER(IUO=6,IUD0=10,ISEED1=1,ISEED2=0)
      PARAMETER(K=17,NDAT=2**K,NBINS=32,LMEAN=.FALSE.,A=THREE,NT=09)
      CHARACTER CBIN*2
      DIMENSION DATA(NDAT),ACORJ(0:NBINS,0:NT)
      DIMENSION ACM(0:NT),ACE(0:NT),WORK(NBINS)
C
      LTEST=.false.
      LTEST=.true.
C
      WRITE(IUO,*) ' '
      WRITE(IUO,*) 'NDAT  =  ',NDAT
      WRITE(IUO,*) 'NBINS =  ',NBINS
      WRITE(IUO,*) 'RANGE A = ',A
C
C Generation of Gaussian Metropolis data:
C
      CALL RMASET(IUO,IUD0,ISEED1,ISEED2,'ranmar.d')
      CALL GAU_METRO(A,NDAT,DATA,XAM)
      WRITE(IUO,*) 'METROPOLIS FOR GAUSSIAN RANDOM NUMBERS: '
      WRITE(IUO,*) 'ACCEPTANCE RATE: ',XAM
      CALL STEB0(NDAT,DATA,DM,DV,DE)
      WRITE(IUO,*) "DM,DV,DE:",DM,DV,DE
C
      OPEN(IUD0,FILE='acor.d',FORM='formatted',STATUS='unknown')
      WRITE(IUO,*) ' '
      DO IT=0,NT
        ACORJ(0,IT)=AUTCORF(IT,NDAT,DATA,LMEAN)
        CALL AUTCORJ(IT,NDAT,NBINS,DATA,WORK,ACORJ(1,IT),LMEAN)
        DO IBIN=1,NBINS
          IF(ACORJ(IBIN,IT).LE.ZERO) STOP "AC: ACORJ.LE.ZERO."
        END DO
        CALL STEBJ0(NBINS,ACORJ(1,IT),ACM(IT),ACV,ACE(IT))
        BIAS=ABS(ACORJ(0,IT)-ACM(IT))/ABS(ACORJ(0,IT)) 
        WRITE(IUD0,'(1I6,4F14.8)') IT,ACORJ(0,IT),ACM(IT),ACE(IT),BIAS
      END DO
      CLOSE(IUD0)

      DO IBIN=0,NBINS
        WRITE(CBIN,'(I2.2)') IBIN
        OPEN(IUD0,FILE="datj"//Cbin//".d",FORM='FORMATTED',
     &           STATUS='UNKNOWN')
        IF(IBIN.EQ.0) WRITE(IUD0,'(2I10,2F10.4)') NBINS,(NT+1),ONE,ONE
        DO IT=0,NT
          WRITE(IUD0,'(F10.0,2F14.8)') (IT*ONE),ACORJ(IBIN,IT),ACE(IT)
        END DO
        CLOSE(IUD0)
      END DO

      IF(LTEST) STOP "AC: LTEST."
C
      STOP
      END

      INCLUDE '../../ForLib/ac_int.f'
      INCLUDE '../../ForLib/ac_intj.f'
      INCLUDE '../../ForLib/autcorf.f'
      INCLUDE '../../ForLib/autcorj.f'
      INCLUDE '../../ForLib/bias.f'
      INCLUDE '../../ForLib/bining.f'
      INCLUDE '../../ForLib/datjack.f'
      INCLUDE '../../ForLib/gau_metro.f'
      INCLUDE '../../ForLib/ranmar.f'
      INCLUDE '../../ForLib/rmaset.f'
      INCLUDE '../../ForLib/steb0.f'
      INCLUDE '../../ForLib/stebj0.f'
      INCLUDE '../../ForLib/stmean.f'
