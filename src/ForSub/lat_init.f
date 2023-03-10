      subroutine lat_init(ns,nd,ipf,ipb,nla,ix,nlink)
     &   bind(c,name="lat_init_")
         use iso_c_binding
         implicit none
         integer(c_int) :: ns,nd,ipf,ipb,nla,ix,nlink,nsfun,is

         dimension ipf(nd,ns),ipb(nd,ns),nla(nd),ix(nd)
         !C Initialize number of lattice sites and links. Initialize pointer arrays.
         ns=nsfun(nla,nd)
         nlink=nd*ns
         !C Initialize pointers:
         do is=1,ns
            call ipointer(ipf,ipb,nla,ix,ns,is,nd)
         end do
         return
      end

