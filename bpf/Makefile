CLANG ?= clang
LLC ?= llc
LLVM_STRIP ?= llvm-strip

ARCH ?= $(shell uname -m)
TARGET ?= bpf
CFLAGS := -O2 -g -target $(TARGET) -D__TARGET_ARCH_$(ARCH) -Wall -Werror

BPF_SRCS := $(wildcard *.bpf.c)
BPF_OBJS := $(BPF_SRCS:.bpf.c=.bpf.o)

.PHONY: all clean

all: vmlinux.h $(BPF_OBJS) disasm

%.bpf.o: %.bpf.c
	$(CLANG) $(CFLAGS) -c $< -o $@
	$(LLVM_STRIP) -g $@

vmlinux.h:
	bpftool btf dump file /sys/kernel/btf/vmlinux format c > vmlinux.h

disasm: $(BPF_OBJS)
	$(foreach obj, $(BPF_OBJS), llvm-objdump -S -d $(obj) > $(obj).disasm;)

clean:
	rm -f $(BPF_OBJS)