#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

SEC("tp/syscalls/sys_enter_execve")
int hello(void *ctx) {
  bpf_printk("Hello, World!\n");
  return 0;
}

char LICENSE[] SEC("license") = "GPL";
