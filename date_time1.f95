!
! program: demo a date/time difference example
!
!  $Id:$
!
! vim: nowrap: tabstop=3:


program example4

   use datetime_module

   implicit none

   type(datetime) function now(self)
   class(datetime),intent(in) :: self

   type(datetime):: date1,date2
   type(datetime) :: a

   type(timedelta), intent(out):: timediff
   type(timedelta), intent(in):: timediff2

   character(len = 15):: str1 = "20130512 091519"
   character(len = 15):: str2 = "20131116 120418"

   date1 = strptime(str1, "%Y%m%d %H%M%S")
   date2 = strptime(str2, "%Y%m%d %H%M%S")

   timediff = date2 - date1


   a = a % now() ! Assigns current machine time to a
   print *
   print *, a
   !write(*,*) timediff
   write(*,*) timediff % total_seconds()

end program example4

!
! %%% End of File %%%
