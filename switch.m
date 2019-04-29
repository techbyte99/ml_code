grade = input("Enter your Grade: ");
printf("Entered grade is  %c\n", grade );

switch(grade)
  case 'A+'
    printf("Excellent!\n" );
  case 'A'
    pritnf("Very Good\n");
  case 'B'
    printf("Good\n" );
  case 'C'
    printf("Average\n" );
  case 'F'
    printf("Failed\n" );
  otherwise
    printf("unknown grade system\n");
endswitch