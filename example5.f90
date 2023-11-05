!
!
!
!
!

program example5

   use datetime_module, only:datetime

   implicit none

   type(datetime) :: a

   a = datetime(2023, 08, 10, 13, 5, 0)

   ! Without arguments:
   print *, a % isoformat() ! Prints 1984-12-10T13:05:00.000

   ! With a specified separator:
   print *, a % isoformat(' ') ! Prints 1984-12-10 13:05:00.000

end program example5
