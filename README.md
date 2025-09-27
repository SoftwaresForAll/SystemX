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

Bootloader setup (required to boot with this init)
Use exactly one of the methods below. The safest path is the temporary one-boot test first.

Temporary one-boot test (GRUB)
1. Reboot and stop at the GRUB menu.
2. Select your Linux entry and press e to edit.
3. On the linux line, append: init=/sbin/init
4. Press Ctrl+X or F10 to boot. This tests SystemX without permanent changes.

Permanent GRUB setup
1. Ensure SystemX is installed:
   sudo make install
   sudo cp systemx.conf /etc/systemx.conf
2. Edit /etc/default/grub and add init=/sbin/init to GRUB_CMDLINE_LINUX, for example:
   GRUB_CMDLINE_LINUX="... init=/sbin/init"
3. Update GRUB (pick the command your distro uses):
   Debian/Ubuntu: sudo update-grub
   Arch/others (BIOS): sudo grub-mkconfig -o /boot/grub/grub.cfg
   UEFI common path:   sudo grub-mkconfig -o /boot/efi/EFI/<distro>/grub.cfg
4. Reboot.

Permanent systemd-boot setup
1. Ensure SystemX is installed:
   sudo make install
   sudo cp systemx.conf /etc/systemx.conf
2. Edit your loader entry, e.g. /boot/loader/entries/linux.conf, and append init=/sbin/init to the options line, for example:
   options root=... rw init=/sbin/init
3. Reboot.

Rollback (if you need to go back quickly)
1. At GRUB menu: press e, remove init=/sbin/init from the linux line, then boot.
2. Or set init=/bin/sh as a rescue to get a root shell, then fix config and reboot.
3. For permanent revert: remove init=/sbin/init from GRUB_CMDLINE_LINUX (or systemd-boot entry) and regenerate the config.

Pre-flight checklist for a smooth boot
1. /sbin/init exists and is executable (installed by sudo make install).
2. /etc/systemx.conf exists and contains valid lines: name: absolute_path_with_args
3. /bin/sh exists (required for executing commands via /bin/sh -c).
4. The service binaries you reference actually exist on your system (paths may differ by distro).
5. Kernel can mount /proc, /sys, /dev, /run, /tmp (SystemX requests these mounts early).

the goal of this project is just a reliable stable and simple easy to use PID 1 for my personal needs. you are free to star . fork . talk about this project since the main goal isn't challenging feature rich or widly use complex PID's like systemd .
but thank you for taking time from your day to read . clone or even test this project. !

License
MIT License. See LICENSE
