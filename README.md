#kernel-module

## 模块功能

创建一个字符设备，并为其创建：打开，读，写，关闭函数

## Steps to build a new kernel (题外话)

1. 设置核心内容和模块

`make menuconfig`

Note: 如果对.config熟悉了，可以直接拷贝一份.config, `make menuconfig`主要目的是创建.config文件

2. 核心的编译与安装

`make clean` #清楚旧版的*.o文件

`make` #编译内核 (该步骤包含: `make bzImage`, `make modules`)

`make bzImage` # 制作核心文件, 无`make`

`make modules` #制作相关模块, 无`make`

`make modules_install` #安装模块到/lib/modules/`uname -r`目录

`make install` #安装核心文件到/boot, 并更新grub

## How to compile a new module

1. Create Makefile
```
# cat Makefile
obj-m += chardev.o

PWD := $(shell pwd)

all:
	make -C /usr/src/kernels/`uname -r` M=$(PWD) modules

clean:
	@rm -rf *.o *~ core .*.cmd *.mod.c ./tmp_version modules.order Module.symvers chardev.ko
```

2. Compile

`# make`

3. Insert module

`insmod ./chardev.ko`
