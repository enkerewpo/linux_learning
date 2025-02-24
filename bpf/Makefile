CLANG ?= clang
LLC ?= llc
LLVM_STRIP ?= llvm-strip

ARCH ?= $(shell uname -m)
TARGET ?= bpf
CFLAGS := -O2 -g -target $(TARGET) -D__TARGET_ARCH_$(ARCH) -Wall -Werror

BPF_SRCS := $(wildcard *.bpf.c)
BPF_OBJS := $(BPF_SRCS:.bpf.c=.bpf.o)

.PHONY: all clean

all: vmlinux.h $(BPF_OBJS) disasm ir

%.bpf.o: %.bpf.c
	$(CLANG) $(CFLAGS) -c $< -o $@
	$(LLVM_STRIP) -g $@

vmlinux.h:
	bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

disasm: $(BPF_OBJS)
	$(foreach obj, $(BPF_OBJS), llvm-objdump -S -D $(obj) > $(obj).disasm;)

ir:
	$(foreach src, $(BPF_SRCS), $(CLANG) $(CFLAGS) -S -emit-llvm $(src) -o $(src).ll;)

clean:
	rm -f $(BPF_OBJS)

run:
	sudo rm -rf /sys/fs/bpf/main
	sudo bpftool prog load main.bpf.o /sys/fs/bpf/main

monitor:
# if /sys/kernel/debug/ is not mounted, mount it here
#	sudo mount -t debugfs nodev /sys/kernel/debug
	sudo cat /sys/kernel/debug/tracing/trace_pipe