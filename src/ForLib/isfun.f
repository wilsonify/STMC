      function isfun(ix,nla,nd) bind(c,name="isfun_")
         !C Copyright, Bernd Berg, June 10, 1999.
         !c Input:   coordinates ix(nd), ix(id)=0,...,nla(id)-1.
         !c Output:  isfun = number of the site (function of ix,nd)
         use iso_c_binding
         implicit none
         integer(c_int) :: ix,nd,id,isfun,nla,nsa
         dimension ix(nd),nla(nd)
         isfun=1
         nsa=1
         do id=1,nd
            isfun=isfun+ix(id)*nsa
            nsa=nsa*nla(id)
         end do
         return
      end
