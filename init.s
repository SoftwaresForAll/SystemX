BITS 64
SECTION .text
global _start

%define SYS_read 0
%define SYS_write 1
%define SYS_open 2
%define SYS_close 3
%define SYS_stat 4
%define SYS_fstat 5
%define SYS_lseek 8
%define SYS_mmap 9
%define SYS_mprotect 10
%define SYS_munmap 11
%define SYS_brk 12
%define SYS_rt_sigaction 13
%define SYS_rt_sigprocmask 14
%define SYS_ioctl 16
%define SYS_pread64 17
%define SYS_pwrite64 18
%define SYS_readv 19
%define SYS_writev 20
%define SYS_access 21
%define SYS_pipe 22
%define SYS_select 23
%define SYS_sched_yield 24
%define SYS_mremap 25
%define SYS_msync 26
%define SYS_mincore 27
%define SYS_madvise 28
%define SYS_shmget 29
%define SYS_shmat 30
%define SYS_shmctl 31
%define SYS_dup 32
%define SYS_dup2 33
%define SYS_pause 34
%define SYS_nanosleep 35
%define SYS_getitimer 36
%define SYS_alarm 37
%define SYS_setitimer 38
%define SYS_getpid 39
%define SYS_sendfile 40
%define SYS_socket 41
%define SYS_connect 42
%define SYS_accept 43
%define SYS_sendto 44
%define SYS_recvfrom 45
%define SYS_sendmsg 46
%define SYS_recvmsg 47
%define SYS_shutdown 48
%define SYS_bind 49
%define SYS_listen 50
%define SYS_getsockname 51
%define SYS_getpeername 52
%define SYS_socketpair 53
%define SYS_setsockopt 54
%define SYS_getsockopt 55
%define SYS_clone 56
%define SYS_fork 57
%define SYS_vfork 58
%define SYS_execve 59
%define SYS_exit 60
%define SYS_wait4 61
%define SYS_kill 62
%define SYS_uname 63
%define SYS_semget 64
%define SYS_semop 65
%define SYS_semctl 66
%define SYS_shmdt 67
%define SYS_msgget 68
%define SYS_msgsnd 69
%define SYS_msgrcv 70
%define SYS_msgctl 71
%define SYS_fcntl 72
%define SYS_flock 73
%define SYS_fsync 74
%define SYS_fdatasync 75
%define SYS_truncate 76
%define SYS_ftruncate 77
%define SYS_getdents 78
%define SYS_getcwd 79
%define SYS_chdir 80
%define SYS_fchdir 81
%define SYS_rename 82
%define SYS_mkdir 83
%define SYS_rmdir 84
%define SYS_creat 85
%define SYS_link 86
%define SYS_unlink 87
%define SYS_symlink 88
%define SYS_readlink 89
%define SYS_chmod 90
%define SYS_fchmod 91
%define SYS_chown 92
%define SYS_fchown 93
%define SYS_lchown 94
%define SYS_umask 95
%define SYS_gettimeofday 96
%define SYS_getrlimit 97
%define SYS_getrusage 98
%define SYS_sysinfo 99
%define SYS_times 100
%define SYS_ptrace 101
%define SYS_getuid 102
%define SYS_syslog 103
%define SYS_getgid 104
%define SYS_setuid 105
%define SYS_setgid 106
%define SYS_geteuid 107
%define SYS_getegid 108
%define SYS_setpgid 109
%define SYS_getppid 110
%define SYS_getpgrp 111
%define SYS_setsid 112
%define SYS_setreuid 113
%define SYS_setregid 114
%define SYS_getgroups 115
%define SYS_setgroups 116
%define SYS_setresuid 117
%define SYS_getresuid 118
%define SYS_setresgid 119
%define SYS_getresgid 120
%define SYS_getpgid 121
%define SYS_setfsuid 122
%define SYS_setfsgid 123
%define SYS_getsid 124
%define SYS_capget 125
%define SYS_capset 126
%define SYS_rt_sigpending 127
%define SYS_rt_sigtimedwait 128
%define SYS_rt_sigqueueinfo 129
%define SYS_rt_sigsuspend 130
%define SYS_sigaltstack 131
%define SYS_utime 132
%define SYS_mknod 133
%define SYS_uselib 134
%define SYS_personality 135
%define SYS_ustat 136
%define SYS_statfs 137
%define SYS_fstatfs 138
%define SYS_sysfs 139
%define SYS_getpriority 140
%define SYS_setpriority 141
%define SYS_sched_setparam 142
%define SYS_sched_getparam 143
%define SYS_sched_setscheduler 144
%define SYS_sched_getscheduler 145
%define SYS_sched_get_priority_max 146
%define SYS_sched_get_priority_min 147
%define SYS_sched_rr_get_interval 148
%define SYS_mlock 149
%define SYS_munlock 150
%define SYS_mlockall 151
%define SYS_munlockall 152
%define SYS_vhangup 153
%define SYS_modify_ldt 154
%define SYS_pivot_root 155
%define SYS__sysctl 156
%define SYS_prctl 157
%define SYS_arch_prctl 158
%define SYS_adjtimex 159
%define SYS_setrlimit 160
%define SYS_chroot 161
%define SYS_sync 162
%define SYS_acct 163
%define SYS_settimeofday 164
%define SYS_mount 165
%define SYS_umount2 166
%define SYS_swapon 167
%define SYS_swapoff 168
%define SYS_reboot 169
%define SYS_sethostname 170
%define SYS_setdomainname 171
%define SYS_iopl 172
%define SYS_ioperm 173
%define SYS_create_module 174
%define SYS_init_module 175
%define SYS_delete_module 176
%define SYS_get_kernel_syms 177
%define SYS_query_module 178
%define SYS_quotactl 179
%define SYS_nfsservctl 180
%define SYS_getpmsg 181
%define SYS_putpmsg 182
%define SYS_afs_syscall 183
%define SYS_tuxcall 184
%define SYS_security 185
%define SYS_gettid 186
%define SYS_readahead 187
%define SYS_setxattr 188
%define SYS_lsetxattr 189
%define SYS_fsetxattr 190
%define SYS_getxattr 191
%define SYS_lgetxattr 192
%define SYS_fgetxattr 193
%define SYS_listxattr 194
%define SYS_llistxattr 195
%define SYS_flistxattr 196
%define SYS_removexattr 197
%define SYS_lremovexattr 198
%define SYS_fremovexattr 199
%define SYS_tkill 200
%define SYS_time 201
%define SYS_futex 202
%define SYS_sched_setaffinity 203
%define SYS_sched_getaffinity 204
%define SYS_set_thread_area 205
%define SYS_io_setup 206
%define SYS_io_destroy 207
%define SYS_io_getevents 208
%define SYS_io_submit 209
%define SYS_io_cancel 210
%define SYS_get_thread_area 211
%define SYS_lookup_dcookie 212
%define SYS_epoll_create 213
%define SYS_epoll_ctl_old 214
%define SYS_epoll_wait_old 215
%define SYS_remap_file_pages 216
%define SYS_getdents64 217
%define SYS_set_tid_address 218
%define SYS_restart_syscall 219
%define SYS_semtimedop 220
%define SYS_fadvise64 221
%define SYS_timer_create 222
%define SYS_timer_settime 223
%define SYS_timer_gettime 224
%define SYS_timer_getoverrun 225
%define SYS_timer_delete 226
%define SYS_clock_settime 227
%define SYS_clock_gettime 228
%define SYS_clock_getres 229
%define SYS_clock_nanosleep 230
%define SYS_exit_group 231
%define SYS_epoll_wait 232
%define SYS_epoll_ctl 233
%define SYS_tgkill 234
%define SYS_utimes 235
%define SYS_vserver 236
%define SYS_mbind 237
%define SYS_set_mempolicy 238
%define SYS_get_mempolicy 239
%define SYS_mq_open 240
%define SYS_mq_unlink 241
%define SYS_mq_timedsend 242
%define SYS_mq_timedreceive 243
%define SYS_mq_notify 244
%define SYS_mq_getsetattr 245
%define SYS_kexec_load 246
%define SYS_waitid 247
%define SYS_add_key 248
%define SYS_request_key 249
%define SYS_keyctl 250
%define SYS_ioprio_set 251
%define SYS_ioprio_get 252
%define SYS_inotify_init 253
%define SYS_inotify_add_watch 254
%define SYS_inotify_rm_watch 255
%define SYS_migrate_pages 256
%define SYS_openat 257
%define SYS_mkdirat 258
%define SYS_mknodat 259
%define SYS_fchownat 260
%define SYS_futimesat 261
%define SYS_newfstatat 262
%define SYS_unlinkat 263
%define SYS_renameat 264
%define SYS_linkat 265
%define SYS_symlinkat 266
%define SYS_readlinkat 267
%define SYS_fchmodat 268
%define SYS_faccessat 269
%define SYS_pselect6 270
%define SYS_ppoll 271
%define SYS_unshare 272
%define SYS_set_robust_list 273
%define SYS_get_robust_list 274
%define SYS_splice 275
%define SYS_tee 276
%define SYS_sync_file_range 277
%define SYS_vmsplice 278
%define SYS_move_pages 279
%define SYS_utimensat 280
%define SYS_epoll_pwait 281
%define SYS_signalfd 282
%define SYS_timerfd_create 283
%define SYS_eventfd 284
%define SYS_fallocate 285
%define SYS_timerfd_settime 286
%define SYS_timerfd_gettime 287
%define SYS_accept4 288
%define SYS_signalfd4 289
%define SYS_eventfd2 290
%define SYS_epoll_create1 291
%define SYS_dup3 292
%define SYS_pipe2 293
%define SYS_inotify_init1 294
%define SYS_preadv 295
%define SYS_pwritev 296
%define SYS_rt_tgsigqueueinfo 297
%define SYS_perf_event_open 298
%define SYS_recvmmsg 299
%define SYS_fanotify_init 300
%define SYS_fanotify_mark 301
%define SYS_prlimit64 302
%define SYS_name_to_handle_at 303
%define SYS_open_by_handle_at 304
%define SYS_clock_adjtime 305
%define SYS_syncfs 306
%define SYS_sendmmsg 307
%define SYS_setns 308
%define SYS_getcpu 309
%define SYS_process_vm_readv 310
%define SYS_process_vm_writev 311
%define SYS_kcmp 312
%define SYS_finit_module 313
%define SYS_sched_setattr 314
%define SYS_sched_getattr 315
%define SYS_renameat2 316
%define SYS_seccomp 317
%define SYS_getrandom 318
%define SYS_memfd_create 319
%define SYS_kexec_file_load 320
%define SYS_bpf 321
%define SYS_execveat 322
%define SYS_userfaultfd 323
%define SYS_membarrier 324
%define SYS_mlock2 325
%define SYS_copy_file_range 326
%define SYS_preadv2 327
%define SYS_pwritev2 328
%define SYS_pkey_mprotect 329
%define SYS_pkey_alloc 330
%define SYS_pkey_free 331
%define SYS_statx 332
%define SYS_io_pgetevents 333
%define SYS_rseq 334
%define SYS_pidfd_send_signal 424
%define SYS_io_uring_setup 425
%define SYS_io_uring_enter 426
%define SYS_io_uring_register 427
%define SYS_open_tree 428
%define SYS_move_mount 429
%define SYS_fsopen 430
%define SYS_fsconfig 431
%define SYS_fsmount 432
%define SYS_fspick 433
%define SYS_pidfd_open 434
%define SYS_clone3 435
%define SYS_close_range 436
%define SYS_openat2 437
%define SYS_pidfd_getfd 438
%define SYS_faccessat2 439
%define SYS_process_madvise 440
%define SYS_epoll_pwait2 441
%define SYS_mount_setattr 442
%define SYS_quotactl_fd 443
%define SYS_landlock_create_ruleset 444
%define SYS_landlock_add_rule 445
%define SYS_landlock_restrict_self 446
%define SYS_memfd_secret 447
%define SYS_process_mrelease 448
%define SYS_futex_waitv 449
%define SYS_set_mempolicy_home_node 450
%define SYS_cachestat 451
%define SYS_fchmodat2 452
%define SYS_map_shadow_stack 453
%define SYS_futex_wake 454
%define SYS_futex_wait 455
%define SYS_futex_requeue 456
%define SYS_statmount 457
%define SYS_listmount 458
%define SYS_lsm_get_self_attr 459
%define SYS_lsm_set_self_attr 460
%define SYS_lsm_list_modules 461

%define O_RDONLY 0
%define O_WRONLY 1
%define O_RDWR 2
%define O_CREAT 64
%define O_EXCL 128
%define O_TRUNC 512
%define O_APPEND 1024

%define PROT_READ 1
%define PROT_WRITE 2
%define PROT_EXEC 4

%define MAP_SHARED 1
%define MAP_PRIVATE 2
%define MAP_ANONYMOUS 32

%define SIGCHLD 17
%define SIGTERM 15
%define SIGKILL 9
%define SIGHUP 1
%define SIGINT 2
%define SIGQUIT 3
%define SIGILL 4
%define SIGABRT 6
%define SIGFPE 8
%define SIGSEGV 11
%define SIGPIPE 13
%define SIGALRM 14
%define SIGUSR1 10
%define SIGUSR2 12

%define SA_RESTART 0x10000000
%define WNOHANG 1

%define LINUX_REBOOT_MAGIC1 0xfee1dead
%define LINUX_REBOOT_MAGIC2 0x28121969
%define LINUX_REBOOT_CMD_RESTART 0x1234567
%define LINUX_REBOOT_CMD_POWER_OFF 0x4321fedc

struc sigaction
    sa_handler resq 1
    sa_flags resq 1
    sa_restorer resq 1
    sa_mask resq 16
endstruc

struc timespec
    tv_sec resq 1
    tv_nsec resq 1
endstruc

struc stat
    st_dev resq 1
    st_ino resq 1
    st_nlink resq 1
    st_mode resq 1
    st_uid resq 1
    st_gid resq 1
    st_rdev resq 1
    st_size resq 1
    st_blksize resq 1
    st_blocks resq 1
    st_atim resq 2
    st_mtim resq 2
    st_ctim resq 2
endstruc

SECTION .data
config_path db '/etc/systemx.conf', 0
newline db 10
space db ' '
colon db ':'
null db 0
root_dir db '/', 0
msg_start db 'SystemX init starting...', 10, 0
msg_ready db 'SystemX init ready', 10, 0
msg_shutdown db 'SystemX init shutting down...', 10, 0
msg_reboot db 'SystemX init rebooting...', 10, 0
msg_halt db 'SystemX init halting...', 10, 0
dev_console db '/dev/console', 0
dev_null db '/dev/null', 0
sh_path db '/bin/sh', 0
sh_arg_c db '-c', 0
sh_login db '-l', 0
fallback_cmd db '/bin/sh', 0
proc_cmdline db '/proc/cmdline', 0
sys_fs_cgroup db 'cgroup', 0
sys_fs_proc db 'proc', 0
sys_fs_sysfs db 'sysfs', 0
sys_fs_devtmpfs db 'devtmpfs', 0
sys_fs_tmpfs db 'tmpfs', 0
mount_none db 'none', 0
mount_proc db '/proc', 0
mount_sys db '/sys', 0
mount_dev db '/dev', 0
mount_run db '/run', 0
mount_tmp db '/tmp', 0

SECTION .bss
config_buffer resb 4096
config_size resq 1
child_pids resq 256
child_count resq 1
service_cmd_ptrs resq 256
service_cmd_lens resq 256
sigaction_buffer resb 1024
pid_buffer resq 1
stat_buffer resb 1024
read_buffer resb 1024
mount_source resb 256
mount_target resb 256
mount_type resb 256
mount_options resb 256

SECTION .text

_start:
    mov rbp, rsp
    ; zero child_count
    xor rax, rax
    mov [child_count], rax

    ; ensure running as PID 1
    mov rax, SYS_getpid
    syscall
    cmp rax, 1
    jne not_pid1

    call setup_environment
    call mount_filesystems
    call parse_config
    call signal_handler_setup
    ; if no services started, start fallback shell
    mov rax, [child_count]
    cmp rax, 0
    jne .skip_fallback
    call start_fallback_shell
.skip_fallback:
    call main_loop

not_pid1:
    mov rax, SYS_exit
    mov rdi, 0
    syscall

setup_environment:
    mov rax, SYS_setsid
    syscall

    mov rax, SYS_chdir
    mov rdi, root_dir
    syscall

    mov rax, SYS_umask
    mov rdi, 0
    syscall

    mov rax, SYS_open
    mov rdi, dev_console
    mov rsi, O_RDWR
    syscall
    mov rbx, rax

    mov rax, SYS_dup2
    mov rdi, rbx
    mov rsi, 0
    syscall

    mov rax, SYS_dup2
    mov rdi, rbx
    mov rsi, 1
    syscall

    mov rax, SYS_dup2
    mov rdi, rbx
    mov rsi, 2
    syscall

    mov rax, SYS_close
    mov rdi, rbx
    syscall

    ret

mount_filesystems:
    mov rax, SYS_mount
    mov rdi, sys_fs_proc
    mov rsi, mount_proc
    mov rdx, mount_none
    mov r10, 0
    mov r8, 0
    syscall

    mov rax, SYS_mount
    mov rdi, sys_fs_sysfs
    mov rsi, mount_sys
    mov rdx, mount_none
    mov r10, 0
    mov r8, 0
    syscall

    mov rax, SYS_mount
    mov rdi, sys_fs_devtmpfs
    mov rsi, mount_dev
    mov rdx, mount_none
    mov r10, 0
    mov r8, 0
    syscall

    mov rax, SYS_mount
    mov rdi, sys_fs_tmpfs
    mov rsi, mount_run
    mov rdx, mount_none
    mov r10, 0
    mov r8, 0
    syscall

    mov rax, SYS_mount
    mov rdi, sys_fs_tmpfs
    mov rsi, mount_tmp
    mov rdx, mount_none
    mov r10, 0
    mov r8, 0
    syscall

    ret

parse_config:
    mov rax, SYS_open
    mov rdi, config_path
    mov rsi, O_RDONLY
    syscall
    cmp rax, 0
    jl parse_config_error
    mov rbx, rax

    mov rax, SYS_read
    mov rdi, rbx
    mov rsi, config_buffer
    mov rdx, 4096
    syscall
    mov [config_size], rax

    mov rax, SYS_close
    mov rdi, rbx
    syscall

    call parse_config_lines
    ret

parse_config_error:
    ret

parse_config_lines:
    mov rsi, config_buffer
    mov rcx, [config_size]
    xor rbx, rbx

parse_line:
    cmp rbx, rcx
    jge parse_done

    mov al, [rsi + rbx]
    cmp al, 10
    je next_line
    cmp al, '#'
    je skip_comment
    cmp al, ' '
    jle skip_whitespace
    cmp al, 0
    je parse_done

    call parse_service_line
    jmp next_line

skip_comment:
    inc rbx
    cmp rbx, rcx
    jge parse_done
    mov al, [rsi + rbx]
    cmp al, 10
    jne skip_comment
    jmp next_line

skip_whitespace:
    inc rbx
    jmp parse_line

next_line:
    inc rbx
    jmp parse_line

parse_done:
    ret

parse_service_line:
    mov r8, rsi
    add r8, rbx

    mov r9, r8
    mov r10, 0

find_service_name:
    mov al, [r9]
    cmp al, ':'
    je found_service_name
    cmp al, 10
    je parse_done
    cmp al, 0
    je parse_done
    inc r9
    inc r10
    jmp find_service_name

found_service_name:
    mov [service_name_ptr], r8
    mov [service_name_len], r10

    inc r9
    mov r8, r9
    mov r10, 0

find_command:
    mov al, [r9]
    cmp al, 10
    je found_command
    cmp al, 0
    je found_command
    inc r9
    inc r10
    jmp find_command

found_command:
    mov [service_cmd_ptr], r8
    mov [service_cmd_len], r10

    call start_service
    ret

start_service:
    mov rax, SYS_fork
    syscall
    cmp rax, 0
    je child_process
    jl service_fork_error

    mov rbx, [child_count]
    mov [child_pids + rbx * 8], rax
    ; store corresponding command pointer/len at same index
    mov rdx, [service_cmd_ptr]
    mov [service_cmd_ptrs + rbx * 8], rdx
    mov rdx, [service_cmd_len]
    mov [service_cmd_lens + rbx * 8], rdx
    inc rbx
    mov [child_count], rbx

    ret

child_process:
    ; Build argv for /bin/sh -c "command"
    mov r8, [service_cmd_ptr]
    mov r9, [service_cmd_len]
    mov byte [r8 + r9], 0
    ; argv: [sh_path, "-c", command, NULL]
    lea rdi, [rel sh_path]
    mov qword [sh_argv + 0], rdi
    lea rsi, [rel sh_arg_c]
    mov qword [sh_argv + 8], rsi
    mov qword [sh_argv + 16], r8
    xor rdx, rdx
    mov qword [sh_argv + 24], rdx
    ; execve(sh_path, argv, envp=NULL)
    mov rax, SYS_execve
    mov rdi, sh_path
    mov rsi, sh_argv
    xor rdx, rdx
    syscall
    mov rax, SYS_exit
    mov rdi, 1
    syscall

service_fork_error:
    ret

signal_handler_setup:
    ; install SIGCHLD handler
    mov qword [sigaction_buffer + sigaction.sa_handler], handle_sigchld
    mov qword [sigaction_buffer + sigaction.sa_flags], SA_RESTART
    xor rax, rax
    mov qword [sigaction_buffer + sigaction.sa_mask], rax
    mov qword [sigaction_buffer + sigaction.sa_mask + 8], rax
    mov rax, SYS_rt_sigaction
    mov rdi, SIGCHLD
    mov rsi, sigaction_buffer
    mov rdx, 0
    mov r10, 8
    syscall

    ; install SIGTERM handler
    mov qword [sigaction_buffer + sigaction.sa_handler], handle_sigterm
    mov qword [sigaction_buffer + sigaction.sa_flags], SA_RESTART
    mov rax, SYS_rt_sigaction
    mov rdi, SIGTERM
    mov rsi, sigaction_buffer
    mov rdx, 0
    mov r10, 8
    syscall

    ; install SIGINT handler (treat like SIGTERM)
    mov qword [sigaction_buffer + sigaction.sa_handler], handle_sigterm
    mov qword [sigaction_buffer + sigaction.sa_flags], SA_RESTART
    mov rax, SYS_rt_sigaction
    mov rdi, SIGINT
    mov rsi, sigaction_buffer
    mov rdx, 0
    mov r10, 8
    syscall

    ; install SIGHUP handler (reload)
    mov qword [sigaction_buffer + sigaction.sa_handler], handle_sighup
    mov qword [sigaction_buffer + sigaction.sa_flags], SA_RESTART
    mov rax, SYS_rt_sigaction
    mov rdi, SIGHUP
    mov rsi, sigaction_buffer
    mov rdx, 0
    mov r10, 8
    syscall

    ret

handle_sigchld:
    ; Reap all dead children without blocking
    .reap_loop:
        mov rax, SYS_wait4
        mov rdi, -1
        mov rsi, 0
        mov rdx, 0
        mov r10, WNOHANG
        syscall
        cmp rax, 0
        jle .done
        ; rax = pid
        mov rbx, 0
        mov rcx, [child_count]
    .search:
        cmp rbx, rcx
        jge .reap_loop
        mov rdx, [child_pids + rbx * 8]
        cmp rax, rdx
        jne .next
        ; found index rbx, restart using stored command
        mov rdi, [service_cmd_ptrs + rbx * 8]
        mov rsi, [service_cmd_lens + rbx * 8]
        mov [service_cmd_ptr], rdi
        mov [service_cmd_len], rsi
        call start_service
        jmp .reap_loop
    .next:
        inc rbx
        jmp .search
    .done:
    ret

handle_sigterm:
    call shutdown_services
    call do_shutdown
    ret

handle_sighup:
    ; Reload config and (re)start services:
    call shutdown_services
    xor rax, rax
    mov [child_count], rax
    call parse_config
    ret

main_loop:
    mov rax, SYS_pause
    syscall
    jmp main_loop

shutdown_services:
    mov rbx, 0
    mov rcx, [child_count]

kill_children:
    cmp rbx, rcx
    jge shutdown_done

    mov rax, [child_pids + rbx * 8]
    mov [pid_buffer], rax

    mov rax, SYS_kill
    mov rdi, [pid_buffer]
    mov rsi, SIGTERM
    syscall

    inc rbx
    jmp kill_children

shutdown_done:
    ret

do_shutdown:
    mov rax, SYS_sync
    syscall

    mov rax, SYS_reboot
    mov rdi, LINUX_REBOOT_MAGIC1
    mov rsi, LINUX_REBOOT_MAGIC2
    mov rdx, LINUX_REBOOT_CMD_POWER_OFF
    mov r10, 0
    syscall

    ret

start_fallback_shell:
    ; Fork and exec a login shell as a safety net
    mov rax, SYS_fork
    syscall
    cmp rax, 0
    je .child
    ret
.child:
    ; argv: [sh_path, "-l", NULL]
    lea rdi, [rel sh_path]
    mov qword [sh_argv + 0], rdi
    lea rsi, [rel sh_login]
    mov qword [sh_argv + 8], rsi
    xor rdx, rdx
    mov qword [sh_argv + 16], rdx
    mov rax, SYS_execve
    mov rdi, sh_path
    mov rsi, sh_argv
    xor rdx, rdx
    syscall
    mov rax, SYS_exit
    mov rdi, 1
    syscall

SECTION .data
service_name_ptr resq 1
service_name_len resq 1
service_cmd_ptr resq 1
service_cmd_len resq 1
SECTION .bss
sh_argv resq 4
