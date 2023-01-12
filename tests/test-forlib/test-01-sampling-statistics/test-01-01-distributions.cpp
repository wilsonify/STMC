
#include <gtest/gtest.h>
#include "gmock/gmock-matchers.h"
#include <vector>
#include "forlib.h"

TEST(test_RMAFUN, test_RMAFUN01)
{
  double result;
  result = RMAFUN();
  EXPECT_LE(result, 1.0);
  EXPECT_GE(result, 0.0);
}

TEST(test_addln, test_addln01)
{
  double result;
  result = ADDLN(0.5, 0.8);    
  EXPECT_LE(result, 1.0);
  EXPECT_GE(result, 0.0);
}

TEST(test_autocorf, test_autocorf01){
  double result;
  int IT = 2;
  std::vector<double> DATA = {1,1,1,0,2,3,4,5};
  int NDAT = DATA.size();
  bool LMEAN = true;
  result = AUTCORF(IT, NDAT, DATA, LMEAN);
  EXPECT_GE(result, 0.0);
}

/*
102 results - 88 files
src/ForLib/addln_cut.f:
  1:       FUNCTION ADDLN_CUT(ALN,BLN) bind(c)
  2        ! Copyright Bernd Berg, May 25 2001.
  3:       ! Given ln(A) and ln(B), the function returns ln(C) with C=A+B.
  4        ! include 'implicit.sta'

src/ForLib/addln.f:
  1:       FUNCTION ADDLN(ALN,BLN) bind(c)
  2  C Copyright Bernd Berg, Aug 19 2003.
  3: C Given ln(A) and ln(B), the function returns ln(C) with C=A+B.
  4        include 'implicit.sta'

src/ForLib/autcorf.f:
  1:       FUNCTION AUTCORF(IT,NDAT,DATA,LMEAN) bind(c)
  2  C Copyright, Bernd Berg, Feb 11 2001.
  3: C The function calculates the autocorrelation at IT from the input array
  4  C DATA of autocorrelations. Allowed values of IT are IT=0,1, ... < NDAT.

src/ForLib/bbi_df.f:
  1:       FUNCTION BBI_DF(N,K,P) bind(c)
  2  C Copyright, Berg, October 23 1998.

src/ForLib/bbi_nk_df.f:
  1:       FUNCTION BBI_NK_DF(P) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bbi_nk_xq.f:
  1:       FUNCTION BBI_NK_XQ(Q) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bbi_qdf.f:
  1:       FUNCTION BBI_QDF(N,K,P) bind(c)
  2  C Copyright, Berg, October 23 1999.

src/ForLib/bbi1_nk_df.f:
  1:       FUNCTION BBI1_NK_DF(P) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bbi1_nk_xq.f:
  1:       FUNCTION BBI1_NK_XQ(Q) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/beta_i.f:
  1:       FUNCTION BETA_I(X,A,B) bind(c)
  2  C INCOMPLETE BETA FUNCTION. Copyright, Bernd Berg, Apr 2 2000.

src/ForLib/beta.f:
  1:       FUNCTION BETA(A,B) bind(c)
  2  C INCOMPLETE BETA FUNCTION

src/ForLib/bino_cln.f:
  1:       FUNCTION BINO_CLN(N,K) bind(c)
  2  C Copyright, Bernd Berg, May 13 2002.

src/ForLib/bino_coef.f:
  1:       FUNCTION BINO_COEF(N,K) bind(c)
  2  C Copyright, Bernd Berg, May 5 2002.

src/ForLib/bino_df.f:
  1:       FUNCTION BINO_DF(N,K,P) bind(c)
  2  C Copyright, Berg, October 23 1998.

src/ForLib/bino_nk_df.f:
  1:       FUNCTION BINO_NK_DF(P) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bino_nk_xq.f:
  1:       FUNCTION BINO_NK_XQ(Q) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bino_pd.f:
  1:       FUNCTION BINO_PD(N,K,P) bind(c)
  2  C Copyright, Bernd Berg, May 5 2001.

src/ForLib/bino_qdf.f:
  1:       FUNCTION BINO_QDF(N,K,P) bind(c)
  2  C Copyright, Berg, October 23 1998.

src/ForLib/bino1_nk_df.f:
  1:       FUNCTION BINO1_NK_DF(P) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/bino1_nk_xq.f:
  1:       FUNCTION BINO1_NK_XQ(Q) bind(c)
  2  C Copyright, Berg, October 23 2000.

src/ForLib/cau_df.f:
  1:       FUNCTION CAU_DF(X) bind(c)
  2  C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.

src/ForLib/cau_qdf.f:
  1:       FUNCTION CAU_QDF(X) bind(c)
  2  C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.

src/ForLib/cau_xq.f:
  1:       FUNCTION CAU_XQ(Q) bind(c)
  2  C CAUCHY, CUMULATIVE DISTRIBUTIO FUNCTION. BERG, JUN 1, 1999.

src/ForLib/chi2_df.f:
  1:       FUNCTION CHI2_DF(CHI2) bind(c)
  2  C Copyright, Bernd Berg, July 1 1999.

src/ForLib/chi2_pd.f:
  1:       FUNCTION CHI2_PD(CHI2) bind(c)
  2  C Copyright, Bernd Berg, July 1 1999.

src/ForLib/chi2_qdf.f:
  1:       FUNCTION CHI2_QDF(CHI2) bind(c)
  2  C Copyright, Bernd Berg, July 2 1999.

src/ForLib/chi2_xq.f:
  1:       FUNCTION CHI2_XQ(Q) bind(c)
  2        include 'implicit.sta'

src/ForLib/chi2pdf_df.f:
  1:       FUNCTION CHI2PDF_DF(CHI2) bind(c)
  2        include 'implicit.sta'

src/ForLib/chi2pdf_pd.f:
  1:       FUNCTION CHI2PDF_PD(CHI2) bind(c)
  2        include 'implicit.sta'

src/ForLib/chi2pdf_qdf.f:
  1:       FUNCTION CHI2PDF_QDF(CHI2) bind(c)
  2  C Coyright, Bernd Berg, July 3 1999.

src/ForLib/chi2pdf_xq.f:
  1:       FUNCTION CHI2PDF_XQ(Q) bind(c)
  2        include 'implicit.sta'

src/ForLib/d.r:
  1  4c4
  2: < C Potts model, normalization of the partition function Z at beta0=0.
  3  ---
  4: > C Potts model, normalization of the partition function Z at beta=0.
  5  10,11c10

src/ForLib/error_f.f:
  1:       FUNCTION ERROR_F(X)
  2  C BERG MAY 30, 1999.
  3: C RETURNS THE ERROR FUNCTION ERF(X). THE LONG NOTATION ERROR_F IS USED
  4: C TO AVOID CONFLICTS WITH A POSSIBLY EXISTING INTRINSIC FUNCTION ERF.
  5        include 'implicit.sta'

src/ForLib/F_df.f:
  1:       FUNCTION F_DF(F)
  2  C VARIANCE RATIO DISTRIBUTION FUNCTION.

src/ForLib/f_interpol.f:
  1:       FUNCTION F_INTERPOL(N,F,X,XX)
  2  C Copyright, Bernd Berg, July 9 2001.
  3: C Interpolation of a function given by the function array F() and
  4  C the strictly monoton and ardered argument array X(), X(1)<...<X(N).

src/ForLib/F_pd.f:
  1:       FUNCTION F_PD(F)
  2  C Variance ratio probability density.

src/ForLib/F_qdf.f:
  1:       FUNCTION F_QDF(F)
  2  C VARIANCE RATIO DISTRIBUTION FUNCTION.

src/ForLib/F_xq.f:
  1:       FUNCTION F_XQ(Q)
  2  C

src/ForLib/fct_ln.f:
  1:       FUNCTION FCT_LN(K)
  2  C Calculates the Log of the factorial k!.

src/ForLib/fi1.f:
  1:       FUNCTION FI1(F,Y,X1,X2)
  2  C Copyright Bernd Berg, Sep 17, 2000.
  3: C INVERSE OF THE FUNCTION F.
  4  C RESULT:     FI1=X SUCH THAT Y=F(X).

src/ForLib/gamma_ln.f:
  1:       FUNCTION GAMMA_LN(X)
  2  C BERG, JUNE 23, 1999.
  3: C LN OF GAMMA FUNCTION ALA LANCZOS, SIAM Num. Anal. B1 (1964) 1.
  4        include 'implicit.sta'

src/ForLib/gamma_p.f:
  1:       FUNCTION GAMMA_P(A,X)
  2  C INCOMPLETE GAMMA FUNCTION. BERG JUNE 8, 1999.

src/ForLib/gau_df.f:
  1:       FUNCTION GAU_DF(X)
  2  C GAUSSIAN, CUMULATIVE DISTRIBUTION FUNCTION. BERG, JUN 1, 1999.

src/ForLib/gau_pd.f:
  1:       FUNCTION GAU_PD(X)
  2  C COPYRIGHT BERND BERG, JUN 1, 1999.

src/ForLib/gau_qdf.f:
  1:       FUNCTION GAU_QDF(X)
  2  C GAUSSIAN, PEAKED DISTRIBUTION FUNCTION. BERG, JUN 1 1999.

src/ForLib/gau_xq.f:
  1:       FUNCTION GAU_XQ(Q)
  2  C

src/ForLib/get_double.f:
  1:       real(c_double) function get_double() bind(c)
  2            use iso_c_binding

  8            get_double = x
  9:       end function get_double
  10

src/ForLib/isfun.f:
  1:       function isfun(ix,nla,nd)
  2  C Copyright, Bernd Berg, June 10, 1999.
  3  c Input:   coordinates ix(nd), ix(id)=0,...,nla(id)-1.
  4: c Output:  isfun = number of the site (function of ix,nd)
  5        dimension ix(nd),nla(nd)

src/ForLib/lpt_ex_ia.f:
  1:       FUNCTION LPT_EX_IA(BETA1,BETA2,IACT1,IACT2)
  2        include 'implicit.sta'

src/ForLib/nsfun.f:
  1:       function nsfun(nla,nd)
  2  C Copyright, Bernd Berg, June 10, 1999.

src/ForLib/nsum.f:
  1:       INTEGER FUNCTION NSUM(N1,N2,NA)
  2  C SUM of an integer array. Copyright Bernd Berg, Dec 15, 2001.

src/ForLib/p_ts_z0ln.f:
  2  C Copyright Bernd Berg, Jul 9 2002.
  3: C Potts model, time series partition function fraction at beta0=0.
  4        include 'implicit.sta'

src/ForLib/p_ts_z0lnj.f:
  2  C Copyright Bernd Berg, Jul 9 2000.  Potts model, jackknife
  3: C       time series partition function fractions at beta0=0.
  4        include 'implicit.sta'

src/ForLib/p_ts_zln.f:
  3  C Copyright Bernd Berg, Jul 10 2002. Potts model: ln of the partition
  4: C function Z and related variables from time series fragments.
  5        include 'implicit.sta'

src/ForLib/p_ts_zlnj.f:
  3  C Copyright Bernd Berg, Apr 9 2004.  Potts model, jackknife
  4: C       time series partition function fractions.
  5        include 'implicit.sta'

src/ForLib/p_ts_zlnj.f.bak:
  3  C Copyright Bernd Berg, Jul 9 2000.  Potts model, jackknife
  4: C       time series partition function fractions.
  5        include 'implicit.sta'

src/ForLib/potts_act_tab.f:
  2        dimension idel(0:nqm1,0:nqm1)
  3: C Initialize delta function table for Action per Link:
  4        do ip1=0,nqm1

src/ForLib/potts_actm.f:
  1:       FUNCTION potts_actm(nlink,ha)
  2  C Copyright, Bernd Berg, Dec 12 2000.

src/ForLib/potts_actm2.f:
  1:       FUNCTION potts_actm2(iamin,iamax,ha)
  2  C Copyright, Bernd Berg, Apr 17 2002.

src/ForLib/potts_z0ln.f:
  3  C Copyright Bernd Berg, May 10 2002.
  4: C Potts model, normalization of the partition function Z at beta0=0.
  5        include 'implicit.sta'

src/ForLib/potts_zln.f:
  3  C Copyright Bernd Berg, May 12 2002.
  4: C Potts model ln of the partition function Z and related variables.
  5        include 'implicit.sta'

src/ForLib/rmafun.f:
   1:       function RMAFUN() bind(c)
   2          !   use iso_c_binding

  23
  24:       end function RMAFUN

src/ForLib/stmean.f:
  1:       FUNCTION STMEAN(N,X)
  2  C COPYRIGHT BERND BERG, FEB 10 1990.

src/ForLib/stud_df.f:
  1:       FUNCTION STUD_DF(T)
  2        include 'implicit.sta'

src/ForLib/stud_pd.f:
  1:       FUNCTION STUD_PD(T)
  2        include 'implicit.sta'

src/ForLib/stud_qdf.f:
  1:       FUNCTION STUD_QDF(T)
  2        include 'implicit.sta'

src/ForLib/stud_xq.f:
  1:       FUNCTION STUD_XQ(Q)
  2  C

src/ForProg/AutoC/uncor_gau.f:
  3  C Copyright, Bernd Berg, Feb 11, 2001.
  4: C - CORRELATION FUNCTION AND INTEGRATED AUTOCORRELATION TIME:
  5  C   TESTED FOR UNCORRELATED GAUSSIAN RANDOM NUMBERS.

src/ForProg/chi2/chi2_tabs.f:
  54        WRITE(IUO,*)
  55:      & ' CHI2 per degree of freedom distribution function '
  56        WRITE(IUO,*) ' '

src/ForProg/Ferdinand/ferdinand.f:
  64  C   WE PUT IN A MULTIPLICATION FACTOR Z0 TO PREVENT THE PARTITION
  65: C   FUNCTION BLOW UP.
  66  C

src/ForProg/fit_g/subg_1ox.f:
  1        SUBROUTINE SUBG(X,A,YFIT,DYDA,MFTO)
  2: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1+A2/X.
  3        include '../../ForLib/implicit.sta'

src/ForProg/fit_g/subg_exp.f:
  2  C Copyright, Bernd Berg, Sep 26 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*EXP(A2*X).
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g/subg_exp2.f:
  2  C Copyright, Bernd Berg, Oct 4 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION
  4  C Y=A1*EXP(A2*X)+A3*EXP(A4*X).

src/ForProg/fit_g/subg_expc.f:
  2  C Bernd Berg, Apr 2004.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION
  4  C Y=A1+A2*EXP(A3*X).

src/ForProg/fit_g/subg_expc2.f:
  2  C Bernd Berg, Apr 30 2004.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION
  4  C Y=A1+A2*EXP(A3*X)+A4*EXP(A5*X).

src/ForProg/fit_g/subg_linear.f:
  2        SUBROUTINE SUBG(X,A,YFIT,DYDA,NFIT)
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1+A2*X (linear).
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g/subg_power.f:
  2  C Copyright, Bernd Berg, Feb 8 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*X**A2.
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g/subg_power2.f:
  2  C Copyright, Bernd Berg, Apr 21 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*X**A2+A3*X**A4.
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g/subg_powerc.f:
  2  C Bernd Berg, Apr 30 2004.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1+A2*X**A3.
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g_old/subg_1ox.f:
  1        SUBROUTINE SUBG(X,A,YFIT,DYDA,MFTO)
  2: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1+A2/X.
  3        include '../../ForLib/implicit.sta'

src/ForProg/fit_g_old/subg_exp.f:
  2  C Copyright, Bernd Berg, Sep 26 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*EXP(A2*X).
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g_old/subg_exp2.f:
  2  C Copyright, Bernd Berg, Oct 4 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION
  4  C Y=A1*EXP(A2*X)+A3*EXP(A4*X).

src/ForProg/fit_g_old/subg_linear.f:
  2        SUBROUTINE SUBG(X,A,YFIT,DYDA,NFIT)
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1+A2*X (linear).
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g_old/subg_power.f:
  2  C Copyright, Bernd Berg, Feb 8 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*X**A2.
  4        include '../../ForLib/implicit.sta'

src/ForProg/fit_g_old/subg_power2.f:
  2  C Copyright, Bernd Berg, Apr 21 2002.
  3: C USER PROVIDED SUBROUTINE FOR THE FIT FUNCTION Y=A1*X**A2+A3*X**A4.
  4        include '../../ForLib/implicit.sta'

src/ForProg/MC_Potts/ana_pmu_ts.f:
  127          write(iud4,'(4F12.6)') beta0,Cj(0),Cm,Ce
  128: C Partition function ln:
  129          call stebj0(nrpt,Zlnj(1),Zlnm,Zlnv,Zlne)

  230          write(iud4,'(4F12.6)') beta0,Cj(0),Cm,Ce
  231: C Partition function ln:
  232          call stebj0(nrpt,Zlnj(1),Zlnm,Zlnv,Zlne)

src/ForProg/MC_Potts/ana_pmu.f:
  118          write(iud4,'(4F12.6)') beta0,Cj(0),Cm,Ce
  119: C Partition function ln:
  120          call stebj0(nrpt,Zlnj(1),Zlnm,Zlnv,Zlne)

src/ForProg/MPI_Potts/lpt_ex_ia.f:
  1:       FUNCTION LPT_EX_IA(BETA1,BETA2,IACT1,IACT2)
  2  C Copyright, Bernd Berg, Jan 8 2002.


*/
