obj-m += chardev.o

PWD := $(shell pwd)

all:
	make -C /usr/src/kernels/`uname -r` M=$(PWD) modules
clean:
	@rm -rf *.o *~ core .*.cmd *.mod.c ./tmp_version modules.order Module.symvers chardev.ko
