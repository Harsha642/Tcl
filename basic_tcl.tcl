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
set myVariable {red green blue}
puts [lindex $myVariable 2]
set myVariable "red green blue"
puts [lindex $myVariable 1]
--> blue
--> green
# 5) Associative arrays have an index (key) that is not necessarily an integer. It is generally a string that acts like key value pairs.
set  marks(english) 80
puts $marks(english)
set  marks(mathematics) 90
puts $marks(mathematics)
--> 80
--> 90
