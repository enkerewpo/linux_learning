// example.bpf.c
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

SEC("tracepoint/syscalls/sys_enter_openat")
int handle_openat(struct trace_event_raw_sys_enter *ctx) {
  bpf_printk("Openat syscall detected!\n");
  return 0;
}

char LICENSE[] SEC("license") = "GPL";
