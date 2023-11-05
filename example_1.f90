!
! program: demo a hello world example
!
!  $Id: example_1.f95,v 0.3 2023/08/20 09:51:04 kc4zvw Exp kc4zvw $
!
! vim: nowrap: tabstop=3:


program greetings
   implicit none

   character(len=10):: time
   character(len=20):: str, blank0
   character(len=30) :: date_str
   character(len=5):: zone
   character(len=8):: date
   integer(8) :: j
   integer, dimension(8):: values
   integer:: i, step = 1, total = 20
   real:: x, sin_x, cos_x, tan_x

   str = trim("Hello World!")
   blank0 = trim(" ")

   print *, blank0
   print 100, str
   print *

   print 200, "Count", "Var x", "sin(x)", "cos(x)", "tan(x)"

   do i = 1, total, step
      x = float(i) / 50.0
      sin_x = sin(x)
      cos_x = cos(x)
      tan_x = tan(x)
      print 300, i, x, sin_x, cos_x, tan_x
   enddo

   ! using keyword arguments
   call date_and_time(date, time, zone, values)

   print *
   print 400, date, time, zone

   ! Do something, print a formatted date
   j = time8()
   call ctime(j, date_str)

   print *
   print 600, date_str
   print *
   print 700

100  format(A20)
200  format(A10,A12,A12,A12,A12)
300  format(I10,4F12.3)
400  format('Date: ',A,2X,'Time: ',A,2X,'Zone: ',A)
500  format(8I5)
600  format('Program was started on ', A)
700  format('Finished.')

end program greetings

!
! %%%%% End of File %%%%%
