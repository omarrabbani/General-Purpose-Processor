# General-Purpose-Processor

The ultimate objective of this lab was to generate a simple General Purpose Processor (GPP) by applying the knowledge of both combinational and sequential circuits. The control unit houses both the Finite State Machine as well as a 4x16 Decoder, which outputs the current state from 0-8 as a 4-bit signal for the FSM, while the decoder selects 1 of 16-bits of microcode output respectively. The latch stores 8-bit inputs and follow by passing this data onto a clock cycle. The ALU operates as a direct result from the inputs of the latches as well as the selected microcode input, producing an 8-bit outcome in the form of two 4-bit numbers. To view the results of the above operations, the seven segment display was utilized to observe the resulting hexadecimal output. Fundamentally, this GPP executes different operations on two 8-bit inputs depending on the FSM's current state and the decoder's 16-bit input.

https://github.com/user-attachments/assets/621a2b71-7df4-4716-b497-b80bb158a18f

Latches: The purpose of the latch is that it acts as a storage element for the General Purpose Processor. It can store 8-bits of input and feed this data into the Arithmetic Logic Unit. Two latches are used to realize two sets of 8-bit input data, named A and B.

ALU: The objective of the Arithmetic Logic Unit is to calculate boolean functions based on two sets of 8-bit inputs, A and B. Depending on the microcode input received from the 4x16 decoder, the ALU performs one of the 9 assigned functions. Since it is known that the 4x16 decoder outputs a certain microcode based on input received from the FSM’s current state output, each state of the FSM can be transitioned from one to the next when the positive edge of the clock is established.

4x16 Decoder: The 4x16 decoder has been created in a way where it gets fed a 4-bit input from the Finite State Machine output, and produces a 16-bit microcode, all while the enable signal is set to active high. Cycling through each state of the FSM causes the microcode output to be cycled as well, which results in the ALU also changing from one of its functions to the next.

FSM: The FSM is used to establish the process of an up counter in this lab. When a rising edge of the clock cycle is encountered, as long as the conditions of the enable being set to active high as well as the data_in being set to 1 are met, the FSM will count up starting from 0-8. These digits are representative of the states of the FSM, hence they can be sent to the 4x16 decoder as a 4-bit signal, while another 4-bit signal is sent to a seven segment display. 

Seven Segment Display: This 7-segment display converts binary input from the ALU to usable programming for the seven-segment display. SSD's were utilized to observe the resulting hexadecimal output (0-15), as well as a negative bit instance of the seven segment in case of negative output when subtraction is performed.

![Func](https://github.com/user-attachments/assets/f975b406-7c4c-4428-9f90-dfe746145fb7)
Table of all 9 ALU functions used, with their corresponding outputs shown in hexadecimal output.
