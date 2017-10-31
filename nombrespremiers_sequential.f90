program nombrespremiers_sequential

!$ use omp_lib
implicit none

integer n,i,j,k
integer test
integer,allocatable ::OUTPUT(:)


n=20000

allocate(OUTPUT(n))

test=0
j=0;

write(*,*)'Temps de calcul',OMP_GET_WTIME()
!$OMP PARALLEL DO private(i,test,j)
do k=1,n
    test=0
    i=1
    do while ((test==0).and.(i<k-1))
        i=i+1
        if ( mod(k,i)==0 ) then
             test=1
        endif

    end do
    if ( test==0 ) then
        j=j+1
        OUTPUT(j)=k
    endif
end do
!$OMP END PARALLEL DO

write(99,*)OUTPUT

end program nombrespremiers_sequential
