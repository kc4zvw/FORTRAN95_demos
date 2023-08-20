!
! Heapsort and display real numbers
!
!
! $Id:$

program Print_Array

  integer, parameter :: num = 20
  real :: array(num)
    
  call random_seed
  call random_number(array)

  write(*,*) "Unsorted array:-"
  call display_array(array)

  write(*,*) "Sorted array:-"
  call display_array(array)

  write(*,*) "Finished."

contains

subroutine display_array(a)

  real, intent(in out) :: a(0:)
  integer :: start, n, bottom
  real :: temp

  n = size(a)
  do start = 0, n - 1, 1
    write(*, 100, advance='no') a(start)
    if (mod(start, 5) == 4) write(*,*)
  end do
  write(*,*)

100 format (' ', F9.6)

end subroutine display_array


end program Print_Array

! ***** End of File *****
