      subroutine icpointer(ns,nsc,nd,ias,iac,
     &   iasc,icpf,icpb,nla,ix,is) bind(c,name="icpointer_")
         !C Copyright, Bernd Berg, Sep 26 2003.
         !C Input:   is = number of lattice site
         !C Output:  icpf,icpb: forward and backward checkerboard pointers.
         use iso_c_binding
         implicit none
         integer(c_int) :: ns,nsc,nd,ias,iac,iasc,icpf,icpb,nla,ix,is
         integer(c_int) :: ic,isc,id,ipf,iscf,isfun,ipb,iscb

         dimension ias(2,nsc),iac(ns),iasc(ns)
         dimension icpf(nd,2,nsc),icpb(nd,2,nsc),nla(nd),ix(nd)

         ic=iac(is)
         isc=iasc(is)

         do id=1,nd
            call ixcor(ix,nla,is,nd)
            !C Forward pointer (periodic bounday conditions):
            ix(id)=mod(ix(id)+1,nla(id))
            ipf=isfun(ix,nla,nd)
            iscf=iasc(ipf)
            icpf(id,ic,isc)=iscf
         end do

         do id=1,nd
            call ixcor(ix,nla,is,nd)
            !C Backward pointer (periodic boundary conditions):
            ix(id)=mod(ix(id)-1+nla(id),nla(id))
            ipb=isfun(ix,nla,nd)
            iscb=iasc(ipb)
            icpb(id,ic,isc)=iscb
         end do
C
         return
      end
