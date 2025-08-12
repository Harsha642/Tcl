# "" {} --> Grouping of more than one word dome by Double Quote "" or curly braces {} Double quotes allow substituion
puts {Hello World}
--> Hello World
puts "Hello World"
--> Hello World
puts "Hello \nWorld"
#\n --> Backslash Substitution
-->Hello
-->World
puts {Hello \nWorld}
--> Hello \nWorld
#-----------------------------------------------------------------------------------------------------------------------
# VARIABLE SUBSTITUTION --> In variable substitutions, $ is used before the variable name and this returns the contents of the variable.
set a 3
puts $a
--> 3 
#-----------------------------------------------------------------------------------------------------------------------
# [] --> Any command should be written in square bracket. so []Square bracket is used for COMMAND SUBSTITUTION
set a 4
set b 5
puts [expr $a + $b]
--> 9
#-----------------------------------------------------------------------------------------------------------------------
# TCL DATA TYPES
# Tcl’s primitive data type is a string, making it often called a “string-only” language. From strings, Tcl forms composite types like lists and associative arrays.
# 1) Simple objects (integers, booleans, floats, strings) don’t need declarations—variables are created and typed dynamically, with automatic conversion between types when needed. Variables must be assigned before use.
set myVariable 18
puts $myVariable
--> 18

# 2) In Tcl, a variable is stored as a string by default, but if used in arithmetic, it is automatically converted to an integer.
set myVariable 18
puts [expr $myVariable + 6 + 9]
--> 33

# 3) Strings: Unlike other languages single words need no quotes; multi-word strings can use double quotes or curly braces.
set myVariable hello
puts $myVariable
--> hello
set myVariable "hello world"
puts $myVariable
set myVariable {hello world}
puts $myVariable
--> hello world
--> hello world

# 4) Lists: Groups of elements, defined with quotes or braces, accessed with commands like lindex.
# SYNTAX: set listName { item1 item2 item3 .. itemn } or set listName [list item1 item2 item3] or set listName [split "items separated by a character" split_character]
set myVariable {red green blue}
puts [lindex $myVariable 2]
set myVariable "red green blue"
puts [lindex $myVariable 1]
--> blue
--> green

# 5) Associative arrays have an index (key) that is not necessarily an integer. It is generally a string that acts like key value pairs. SYNTAX: set ArrayName(Index) value
set  marks(english) 80
puts $marks(english)
set  marks(mathematics) 90
puts $marks(mathematics)
--> 80
--> 90
#-----------------------------------------------------------------------------------------------------------------------
# Tcl uses dynamic typing, automatically converting a variable’s value to the needed type—for example, changing a string "5" to a number during arithmetic.
set variableA "10"
puts $variableA
set sum [expr $variableA +20];
puts $sum
--> 10
--> 30
#-----------------------------------------------------------------------------------------------------------------------
# Procedure is simply equivaelnt to defining user function in C/C++/Python
# Procedure with Multiple Arguments a,b
proc add {a b} {
   return [expr $a+$b]
}
puts [add 10 30]
--> 40

# Procedures with Variable Arguments
proc avg {numbers} {
   set sum 0
   foreach number $numbers {
      set sum  [expr $sum + $number]
   }
   set average [expr $sum/[llength $numbers]]
   return $average
}
puts [avg {70 80 50 60}]
puts [avg {70 80 50 }]
--> 65
--> 66
#-----------------------------------------------------------------------------------------------------------------------
# TCL File I/O. Tcl supports file handling with the help of the built in commands open, read, puts, gets, and close.
# SYNTAX's --> Opening File: open fileName accessMode;  Closing a File: close fileName; Writing a File: puts $filename "text to write"; Reading a File: set file_data [read $fp]
set fp [open "input.txt" w+]
puts $fp "test"
close $fp
set fp [open "input.txt" r]
set file_data [read $fp]
puts $file_data
close $fp
--> test 
# In Tcl, opening a file creates a handle that gives access to it in a specified mode, such as "r" for reading, "w" for writing, or "a" for appending, but does not retrieve its contents. 
# Reading a file then uses that handle to actually load the data into the program.
#-----------------------------------------------------------------------------------------------------------------------
# Regular Expressions --> SYNTAX: regexp optionalSwitches patterns searchString fullMatch subMatch1 ... subMatchn
# pattern – the regex rules you want to match. # searchString – the text to search in.
# fullMatchVar – a variable to store the full matched text. # subMatch1..N – variables to store matches from capture groups (...).
# switches – optional flags to modify behavior (explained later).
regexp {([A-Za-z]*)} "Tcl Tutorial" a b 
puts "Full Match: $a"
puts "Sub Match1: $b"
--> Full Match: Tcl
--> Sub Match1: Tcl
# {([A-Za-z]*)} → matches any sequence of letters (0+ times).

# MULTIPLE PATTERNS
regexp {([A-Za-z]*).([A-Za-z]*)} "Tcl Tutorial" full sub1 sub2
puts "Full Match: $full"
puts "Sub Match1: $sub1"
puts "Sub Match2: $sub2"
--> Full Match: Tcl Tutorial
--> Sub Match1: Tcl
--> Sub Match2: Tutorial
# . → Matches any single character (the space in this case).

# SWITCHES for regexp such as -nocase, -indicies, -line, -start index ...
regexp -nocase {([A-Z]*.([A-Z]*))} "Tcl Tutorial" full sub1 sub2
puts "Full Match: $full"
puts "Sub Match1: $sub1"
puts "Sub Match2: $sub2"
--> Full Match: Tcl Tutorial
--> Sub Match1: Tcl Tutorial
--> Sub Match2: Tutorial
#-----------------------------------------------------------------------------------------------------------------------
