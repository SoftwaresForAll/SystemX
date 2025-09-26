SystemX - Simple Linux init (PID 1)

Overview
SystemX is a small init system written entirely in 64-bit assembly for Linux. It runs as PID 1, mounts basic filesystems, reads /etc/systemx.conf, starts services, supervises them, and handles shutdown and reload signals. If no services are configured, it starts a fallback shell to avoid boot lockout.

Build
Requirements: nasm and binutils (ld, strip)
Build command: make

Install
Install command: sudo make install
This installs the binary to /sbin/init
Optional staging: make DESTDIR=/path install

Configure
Configuration file path: /etc/systemx.conf
Each non-empty, non-comment line starts a service
Format: service_name: command_to_run_with_args
Example:
syslog:/sbin/syslogd -n
getty1:/sbin/agetty --noclear tty1 linux
sshd:/usr/sbin/sshd -D

Signals
SIGHUP to PID 1: reload configuration, terminate existing services, then start per new config
SIGTERM or SIGINT to PID 1: clean shutdown, send SIGTERM to services, sync disks, power off
SIGCHLD: handled internally; exited services are reaped and restarted automatically

Runtime behavior
Essential mounts: /proc, /sys, /dev, /run, /tmp
Services start in the order listed
Services are supervised and restarted if they exit
Fallback: if no services are configured, /bin/sh -l is started

Notes
The binary is linked statically without libc (ld -nostdlib -static)
Use PREFIX and DESTDIR in the Makefile to change install paths

Troubleshooting
Ensure /sbin/init is the SystemX binary
Ensure /etc/systemx.conf exists and has valid lines
Check kernel logs (dmesg) for messages
Confirm target service executables exist and are executable

the goal of this project is just a reliable stable and simple easy to use PID 1 for my personal needs. you are free to star . fork . talk about this project since the main goal isn't challenging feature rich or widly use complex PID's like systemd .
but thank you for taking time from your day to read . clone or even test this project. !

License
MIT License. See LICENSE
