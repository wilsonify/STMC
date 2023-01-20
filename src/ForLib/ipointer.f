      subroutine ipointer(ipf,ipb,nla,ix,ns,is,nd) 
     &    bind(c,name="ipointer_")
         !C Input:   is = number of lattice site
         !C Output:  ipf,ipb: forward and backward pointer (lattice
         !C                   site numbers in those directions).
         use iso_c_binding
         implicit none
         integer(c_int) :: ipf,ipb,nla,ix,ns,is,nd,id,isfun

         dimension ipf(nd,ns),ipb(nd,ns),nla(nd),ix(nd)

         do id=1,nd
            call ixcor(ix,nla,is,nd)
            !C Forward (backward) step with periodic bounday conditions:
            ix(id)=mod(ix(id)+1,nla(id))
            ipf(id,is)=isfun(ix,nla,nd)
         end do

         do id=1,nd
            call ixcor(ix,nla,is,nd)
            !C Backward pointer (notice periodic boundary conditions):
            ix(id)=mod(ix(id)-1+nla(id),nla(id))
            ipb(id,is)=isfun(ix,nla,nd)
         end do

         return
      end
