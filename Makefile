#variable declaration

#name of the file
dotc=blink_3.c
doto=blink_3.o
dott=blink_3.out
doth=blink_3.hex
#name of the file
cc=avr-gcc
#name of the file
co=avr-objcopy
#seriel port
port=/dev/ttyUSB*
#microcontroller used
mc=atmega328p


#compiles+uplode the code
all: compile program


#compiles the code
compile:
	$(cc) -Os -DF_CPU=16000000UL -mmcu=$(mc) -c -o $(doto) $(dotc)
	$(cc) -mmcu=$(mc) $(doto) -o $(dott)
	$(co) -O ihex $(dott) $(doth)


#uploades the code
program:
	avrdude -V -F -c arduino -p $(mc) -b 57600 -P $(port) -U flash:w:$(doth)


#removes temp files
clean:
	rm -rf *.o *.out *.hex


