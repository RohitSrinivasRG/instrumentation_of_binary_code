CC      ?= $(CROSS_COMPILE)gcc
LD      ?= $(CROSS_COMPILE)ld
AR      ?= $(CROSS_COMPILE)ar
NM      ?= $(CROSS_COMPILE)nm
OBJCOPY ?= $(CROSS_COMPILE)objcopy
OBJDUMP ?= $(CROSS_COMPILE)objdump
READELF ?= $(CROSS_COMPILE)readelf

OBJS = main.o

CFLAGS += -Wall -I../ta/include -I$(TEEC_EXPORT)/include -I./include
#Add/link other required libraries here
LDADD += -lteec -L$(TEEC_EXPORT)/lib

BINARY = optee_example_hello_world

.PHONY: all
all: $(BINARY)

$(BINARY): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $< $(LDADD)

.PHONY: clean
clean:
	rm -f $(OBJS) $(BINARY)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

.PHONY: compile_mainS
compile_mainS:
	arm-linux-gnueabihf-gcc -S main.c -o main.s -I/media/rohit/HDD_Linux/Project/ARM_OPTEE/optee_qemu/optee_client/public/ -I../ta/include -marm

.PHONY: compile_kiss_fftS
compile_kiss_fftS:
	arm-linux-gnueabihf-gcc -S kiss_fft.c -o kiss_fft.s -I/media/rohit/HDD_Linux/Project/ARM_OPTEE/optee_qemu/optee_client/public/ -I../ta/include -marm

.PHONY: compile_executable
compile_executable:
	arm-linux-gnueabihf-gcc main.s kiss_fft.s -o output_executable -lm -L/media/rohit/HDD_Linux/Project/ARM_OPTEE/optee_qemu/optee_client/out/libteec -lteec -static -pthread -marm
