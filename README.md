# pimp-my-arch

Tool to automate Arch Linux setup and configuration. After running it, you should have a fully functional Arch Linux system with all the tools you (arguably) need.

## Motivation

While Arch gives you a ton of flexiblity, some times it feels too much. Once I settled on a particular setup, I just wanted to be productive and stop tinkering. To get to that setup, for me at least, it was quite the effort.

Then I wanted to replicate everything on a new machine. I had to go through the same process again.

This is the tool to automate that process.

## Usage

1. Boot into the ArchLinux live environment
2. `pacman -Sy archinstall git`
3. Run `archinstall`. I preffer the following:
   1. Bootloader: **Grub**
   2. Filesystem: **BTRFS**
      - It supports snapshots, and as Arch is a rolling release, it is a good idea to have them. `snap-pac` will automatically create snapshots before and after a package upgrade.
      - `grub-btrfs` can be used to add menu with snapshots to choose at boot, in case of system breakage.
   3. Profile: **Minimal**
   4. **No swap**. I normaly use plenty of RAM on my machines. I would have programs OOM Killed than have the system slow down.
4. **Do not reboot**, chroot immediately after the installation is finished
5. Clone this repo: `git clone https://github.com/thedataflows/pimp-my-arch.git && cd pimp-my-arch`

   - Show all the tasks: `./pma.sh`
   - First: configure base system: `./pma.sh system`. This must run as `root`. It assumes that user id `1000` is the default superuser.
   - Second: setup Arch Linux: `./pma.sh arch`. Run as regular user with sudo privileges (most probably user id 1000).

   Individual tasks can be run as well, if needed.

## Why yaml and taskfile.dev?

Just using shell scripts works, but I have always found it cumbersome to maintain.

I believe that using taskfile (a better Makefile alternative) helps with the structure, readability and composability.

Yaml is easier to parse and filter with [yq](https://mikefarah.gitbook.io/yq), and human readable when compared to json.

## License

[MIT](LICENSE)
