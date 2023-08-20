!
!  An example of the HeapSort algorithm in FORTRAN-95
!
! $Id: heapsort3.f95,v 0.27 2023/08/20 16:18:40 kc4zvw Exp kc4zvw $
!
!  vim: nowrap: tabstop=4:

program Heapsort_Demo

    implicit none

    integer, parameter:: num = 50
    real:: array(num)
    character(len = 60):: title_str, footer
    character(len = 30):: header1, header2

    call random_seed
    call random_number(array)

    title_str = trim("A program to heapsort an array of real numbers.")
    header1 = trim("Unsorted array:")
    header2 = trim("Sorted array:")
    footer = trim("End of program.")

    print *
    print 100, title_str
    print *
    print 200, header1
    call display_numbers(array)
    call heapsort(array)
    print 200, header2
    call display_numbers(array)
    print 100, footer

100  format(A60)
200  format(A30/)

contains

subroutine heapsort(a)

    real, intent(in out):: a(0:)
    integer:: start, n, bottom
    real:: temp

    n = size(a)
    do start = (n - 2) / 2, 0, -1
        call siftdown(a, start, n);
    end do
   
    do bottom = n - 1, 1, -1
        temp = a(0)
        a(0) = a(bottom)
        a(bottom) = temp;
        call siftdown(a, 0, bottom)
    end do

end subroutine heapsort

subroutine siftdown(a, start, bottom)
  
    real, intent(in out):: a(0:)
    integer, intent(in):: start, bottom
    integer:: child, root
    real:: temp

    root = start
    do while (root * 2 + 1 < bottom)
        child = root * 2 + 1

        if (child + 1 < bottom) then
            if (a(child) < a(child + 1)) child = child + 1
        end if
    
        if (a(root) < a(child)) then
            temp = a(child)
            a(child) = a(root)
            a(root) = temp
            root = child
        else
            return
        end if  
    end do      
    
end subroutine siftdown

subroutine display_numbers(a)

    real, intent(in out) :: a(0:)
    integer :: start, n
    
    n = size(a)
    do start = 0, n - 1, 1
        write(*, 100, advance='no') a(start)
        if (mod(start, 5) == 4) write(*,*)
    end do
    write(*,*)

100  format(' ', F12.6)
110  format('/')

end subroutine display_numbers


end program Heapsort_Demo

! ***** End of File *****
