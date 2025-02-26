from bcc import BPF

f = open("main.bpf.c", "r")
bpf_program = f.read()
f.close()
b = BPF(text=bpf_program)

b.attach_kprobe(event=b.get_syscall_fnname("clone"), fn_name="hello")
b.trace_print()
