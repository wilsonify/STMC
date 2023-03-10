      SUBROUTINE RWGHT_TS_ZLN(nmeas,beta,beta0,tsa,Zln,Aln,A2ln)
         !C BB, Nov 29 2003. Temperature re-weighting of an action time series.
         use iso_c_binding
         implicit none
         real(c_double) :: beta,beta0,tsa,Zln,Aln,A2ln
         real(c_double) :: Zln1,Aln1,A2ln1,addln
         integer(c_int) :: nmeas,imeas
         real(c_double),parameter :: TWO=2.0

         dimension tsa(nmeas)

         do imeas=1,nmeas
            if(imeas.eq.1) then
               Zln=(beta-beta0)*tsa(1)
               Aln=Zln+log(tsa(1))
               A2ln=Zln+two*log(tsa(1))
            else
               Zln1=(beta-beta0)*tsa(imeas)
               Aln1=Zln1+log(tsa(imeas))
               A2ln1=Zln1+two*log(tsa(imeas))
               Zln=addln(Zln,Zln1)
               Aln=addln(Aln,Aln1)
               A2ln=addln(A2ln,A2ln1)
            end if
         end do

         return
      end
