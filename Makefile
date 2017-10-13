# 如何命令行参数为CROOS=y使用交叉编译器
ifeq ($(CROSS),y)

KERNELDIR = /home/wming/src/linux-2.6.32-el6-8343e49/
PWD := $(shell pwd)
ARCH = mips
CROSS_COMPILE = /opt/gcc-4.4.7-7215-n64-loongson/usr/bin/mips64el-redhat-linux- 

# 注意obj-m := hello_world.o 不能与hello_world-objs := hello.o mymax.o
# 一样，否则会产生循环依赖的情况
obj-m := hello_world.o
hello_world-objs := hello.o mymax.o

all:
	make -C $(KERNELDIR) M=$(PWD) modules ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)

.PHONY : clean
clean:
	rm -f *.ko *.o *.cmd *.mod.o *.order *.symvers *.mod.c .*.cmd

else # 默认使用操作系统自带的编译器

# 注意obj-m := hello_world.o 不能与hello_world-objs := hello.o mymax.o
# 一样，否则会产生循环依赖的情况
obj-m := hello_world.o
hello_world-objs := hello.o mymax.o

PWD := $(shell pwd)
KERNELDIR = /lib/modules/$(shell uname -r)/build

all:
	make -C $(KERNELDIR) M=$(PWD) modules 

.PHONY : clean
clean:
	rm -f *.ko *.o *.cmd *.mod.o *.order *.symvers *.mod.c .*.cmd

endif

