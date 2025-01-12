.section    .data

.globl      people, numpeople
numpeople:
    # Calculate the numer of people in array
    .quad (endpeople - people)/PERSON_RECORD_SIZE
people:
    # Array of people
    .quad   $gkcname, 200, 10, 2, 74, 20
    .quad   $jbname, 280, 12, 2, 72, 44  # me!
    .quad   $cslname, 150, 8, 1, 68, 30
    .quad   $tanme, 250, 14, 3, 75, 24
    .quad   $inname, 250, 10, 2, 70, 11
    .quad   $gmname, 180, 11, 5, 69, 65
endpeople:  # Marks the end of the array for calculation purposes

gkcname:
    .ascii  "Gilbert Keith Chester\0"
jbname:
    .ascii  "Jonathan Bartlett\0"
cslname:
    .ascii  "Clive Silver Lewis\0"
taname:
    .ascii  "Tommy Aquinas\0"
isname:
    .ascii  "Isaac Newn\0"
gmname:
    .ascii  "Gregory Mend\0"

# Describe the components of the struct
.globl  NAME_PTR_OFFSET, WEIGHT_OFFSET, SHOE_OFFSET
.globl  HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET
.equ    NAME_PTR_OFFSET, 0
.equ    WEIGHT_OFFSET, 8
.equ    SHOE_OFFSET, 16
.equ    HAIR_OFFSET, 24
.equ    HEIGHT_OFFSET, 32
.equ    AGE_OFFSET, 40

# Total size of the struct
.globl  PERSON_RECORD_SIZE
.equ    PERSON_RECORD_SIZE, 48

