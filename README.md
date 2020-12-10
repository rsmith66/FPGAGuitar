# FPGAGuitar
Project Name: Mux it Up

Team Members: Will Krska, Ammar Hussain, Ryan Smith, Alex Zhou

Link to project video: https://youtu.be/iEcKXGjjsaE

Overview of the project: For our project, we created a guitar on the FPGA by incorporating switches, buttons, VGA output, and sound output. We used the sixteen switches to represent the frets on a guitar neck and four of the buttons to represent our strings. We then would display on the VGA the held fret and the strummed string while also outputting the corresponding tone to that fret and string combination.

How to run the project: To actually use our fpga guitar, the user would only need to work with the switches and the buttons on the FPGA. Four of the buttons are used as the strings, so pressing a button would result in the strumming of that corresponding string. The fifth button (left button) is the reset button. The sixteen switches are used as frets, so as the user strums the string using the buttons, he or she can also flip a switch to play a fret, causing a change in tune. The certain combinations of frets and strings will play unique tunes that are sent through the sound output, and on the VGA, the user can see the string being played vibrate as well as the fret being held turning green.

Overview of code structure: The overall structure of our code can be separated into three categories—User input, logic, and output. The User input is composed of both switches and buttons. The user can flip the switches to represent holding a fret and press a button which emulates the strumming of a guitar string. Those user inputs are then taken through the logic, starting with the decoder. The decoder utilizes a casex statement to find the index of the lowest switch, or fret, that was flipped. That value is then passed to the tuner which will take that lowest fret along with the button pressed and computes the frequency that the string and fret combination produces. That gets passed to the sound output on the FPGA by connecting a speaker to the FPGA. We also created a VGA controller file that would show the neck of a guitar to the VGA display, illuminating the frets the user chooses and vibrating the string played. Finally, the guitar.v file combines and runs everything in the decoder, tuner, and vga controller together to produce the VGA display and sound outputs. 

