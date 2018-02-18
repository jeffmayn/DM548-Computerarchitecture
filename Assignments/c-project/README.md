# C-project

Vilmundur Porsteinsson - vipor16

Christian Bülow Skovborg - chsko16

Anton Nørgaard  - antno16

Bjarke Holst Kreiberg - bjkre16

Jeff Gyldenbrand - jegyl16



Test files and description:

Test_1:
Large text file, making sure that the program handles memory allocation as it should without errors



Test_2:
Tests that numbers don't get sorted by mathematical size, but alphabetical size,
meaning that "1000000" should be sorted before "9".



Test_3:
The danish alphabet including numbers.
Every letter gets sorted nicely except from the special characters "æøåÆØÅ", since they are not taken account for in the function "strcasecmp",
they gets sorted by there unicode values.


Test_4:
The file is for testing special characters, to insure correct sorting by unicode values.



Test_5:
Simple test to check that it sorts correctly when adding spaces between characters.