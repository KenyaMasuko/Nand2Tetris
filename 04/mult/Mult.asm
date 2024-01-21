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

// Replace this comment with your code.

// R2レジスタを初期化
@R2
M=0
// ループ変数を定義
@i
M=1
// ループ用のシンボルを定義
(LOOP)
// Dレジスタに1を格納
@i
D=M
// DレジスタにD-R1の値を格納
@R1
D=D-M
// ループが終了するか判定
@END
D;JGT
// DレジスタにR0の値を格納
@R0
D=M
// R2レジスタにDレジスタの値とR2の値を格納
@R2
M=D+M
// ループ変数をインクリメント
@i
M=M+1
// ループの先頭に戻って繰り返し
@LOOP
0;JMP
// 無限ループで処理を終了
(END)
@END
0;JMP
