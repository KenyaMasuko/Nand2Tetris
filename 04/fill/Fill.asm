// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// TODO: 後でこっちの実装に直す
// Replace this comment with your code.
// @131072
// D=A
// @number_of_pixcel
// M=D

// @16384
// D=A
// @SCREEN
// M=D

// @24576
// D=A
// @KBD
// M=D

// @8192
// D=A
// @number_of_pixcel
// M=D

// @R0
// M=0

// (LOOP)
// @KBD
// D=M
// @KEY_PUSHED
// D;JNE

// (KEY_NOT_PUSHED)
// @R1
// M=0
// @CHECK_STATE_CHANGE
// 0;JMP

// (KEY_PUSHED)
// @R1
// M=1

// (CHECK_STATE_CHANGE)
// @R0
// D=M
// @R1
// D=D-M
// @LOOP
// D;JEQ
// @i
// M=0
// @R1
// D=M
// @R0
// M=D
// @EMPTY_SCREEEN_LOOP
// D;JEQ

// (FILL_SCREEN_LOOP)
// @i
// D=M
// @SCREEN
// D=A+D
// M=-1
// @i
// M=M+1
// @number_of_pixcel
// D=M-D
// @FILL_SCREEN_LOOP
// D;JGT

// @LOOP
// 0;JMP

// (EMPTY_SCREEN_LOOP)
// @i
// D=M
// @SCREEN
// D=A+D
// M=0
// @i
// M=M+1
// @number_of_pixcel
// D=M-D
// @EMPTY_SCREEN_LOOP
// D;JGT

// @LOOP
// 0;JMP

        @R0
        M=0
        @R1
        M=0
(LOOP)
        @KBD
        D=M
        @COLORBLACK
        D;JEQ
        @R0    //color
        M=0
        @PAINT
        0;JMP
(COLORBLACK)
        @R0    //color
        M=-1
        @PAINT
        0;JMP
(PAINT)
        @SCREEN
        D=A
        @8191
        D=D+A
        @R1  // Address
        M=D
(FILL)
        @R0  // color
        D=M
        @R1
        A=M
        M=D
        @R1
        MD=M-1
        @SCREEN
        D=D-A
        @FILL
        D;JGE
        @LOOP
        0;JMP
(END)
        @END
        0;JMP
