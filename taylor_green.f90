program taylor_green

implicit none

real, parameter :: St=0.1, deltat=0.01, Pi = 3.1415927
integer, parameter :: N=100, P=100
double precision, dimension(N,P) :: X,Y,U,V
double precision :: Ug, Vg
integer :: i,j

open (unit=11, file='output_X.txt')
open (unit=12, file='output_Y.txt')
open (unit=13, file='output_U.txt')
open (unit=14, file='output_V.txt')

call random_number( X(1,:) )
call random_number( Y(1,:) )
U(1,:) = 0
V(1,:) = 0

write (11, *) X(1,:)
write (12, *) Y(1,:)
write (13, *) U(1,:)
write (14, *) V(1,:)

do i=1,N-1,1
    do j=1,P,1
        Ug = -dsin(2*Pi*X(i,j)) * dcos(2*Pi*Y(i,j))
        Vg = dcos(2*Pi*X(i,j)) * dsin(2*Pi*Y(i,j))
        
        X(i+1,j) = X(i,j) + deltat*U(i,j)
        Y(i+1,j) = Y(i,j) + deltat*V(i,j)
        U(i+1,j) = U(i,j) + deltat*(Ug-U(i,j)) / St;
        V(i+1,j) = V(i,j) + deltat*(Vg-V(i,j)) / St;
    enddo
    
    write (11, *) X(i,:)
    write (12, *) Y(i,:)
    write (13, *) U(i,:)
    write (14, *) V(i,:)
enddo

end program

