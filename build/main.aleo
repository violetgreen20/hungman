program hung.aleo;

struct Word:
    ch1 as u8;
    ch2 as u8;
    ch3 as u8;
    ch4 as u8;
    ch5 as u8;

struct Guessed:
    ch1 as boolean;
    ch2 as boolean;
    ch3 as boolean;
    ch4 as boolean;
    ch5 as boolean;

record ActiveGame:
    owner as address.private;
    player as address.private;
    remaining_trials as u8.private;
    word as Word.private;
    guessed as Guessed.private;
    won as boolean.private;
    lost as boolean.private;


function create_game:
    input r0 as address.public;
    input r1 as Word.private;
    cast false false false false false into r2 as Guessed;
    cast self.caller r0 4u8 r1 r2 false false into r3 as ActiveGame.record;
    output r3 as ActiveGame.record;


function make_guess:
    input r0 as ActiveGame.record;
    input r1 as u8.private;
    is.eq r0.owner self.caller into r2;
    assert.eq r2 true;
    gt r0.remaining_trials 0u8 into r3;
    assert.eq r3 true;
    is.eq r0.lost false into r4;
    assert.eq r4 true;
    is.eq r1 r0.word.ch1 into r5;
    ternary r5 true r0.guessed.ch1 into r6;
    is.eq r1 r0.word.ch2 into r7;
    ternary r7 true r0.guessed.ch2 into r8;
    is.eq r1 r0.word.ch3 into r9;
    ternary r9 true r0.guessed.ch3 into r10;
    is.eq r1 r0.word.ch4 into r11;
    ternary r11 true r0.guessed.ch4 into r12;
    is.eq r1 r0.word.ch5 into r13;
    ternary r13 true r0.guessed.ch5 into r14;
    is.neq r1 r0.word.ch1 into r15;
    is.neq r1 r0.word.ch2 into r16;
    and r15 r16 into r17;
    is.neq r1 r0.word.ch3 into r18;
    and r17 r18 into r19;
    is.neq r1 r0.word.ch4 into r20;
    and r19 r20 into r21;
    is.neq r1 r0.word.ch5 into r22;
    and r21 r22 into r23;
    sub r0.remaining_trials 1u8 into r24;
    is.eq r24 0u8 into r25;
    ternary r25 true false into r26;
    ternary r23 r24 r0.remaining_trials into r27;
    ternary r23 r26 false into r28;
    and r6 r8 into r29;
    and r29 r10 into r30;
    and r30 r12 into r31;
    and r31 r14 into r32;
    ternary r32 true false into r33;
    cast r6 r8 r10 r12 r14 into r34 as Guessed;
    cast self.caller r0.player r27 r0.word r34 r33 r28 into r35 as ActiveGame.record;
    output r35 as ActiveGame.record;
