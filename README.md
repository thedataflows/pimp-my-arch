# pimp-my-arch

Tool to automate vanilla Arch Linux setup and configuration, minimally.

After running it, you should have a fully functional Arch Linux system with KDE Plasma and all the tools and customization that I preffer :).

## Deprecated

Since I have switched to CachyOS, this repo is deprecated in favor of <https://github.com/thedataflows/pimp-my-cachyos>

## Motivation

While Arch gives you a ton of flexibility, some times it feels too much. Once I settled on a particular setup, I just wanted to be productive and stop tinkering. To get to that setup, for me at least, it was quite the effort.

Then I wanted to replicate everything on a new machine. I had to go through the same process again.

## Usage

1. Boot into the ArchLinux live environment
2. `pacman -Sy archinstall git`
3. Run `archinstall`. I preffer the following:
   1. Bootloader: **Grub**
   2. Filesystem: **BTRFS**
      - It supports snapshots, and as Arch is a rolling release, it is a good idea to have them. `snap-pac` will automatically create snapshots before and after a package upgrade.
      - `grub-btrfs` can be used to add menu with snapshots to choose at boot, in case of system breakage.
   3. Profile: **Minimal**
   4. **No swap**. I normally use plenty of RAM on my machines. I would have programs OOM Killed than have the system slow down.
4. **Do not reboot**, chroot immediately after the installation is finished
5. Clone this repo: `git clone https://github.com/thedataflows/pimp-my-arch.git && cd pimp-my-arch`

   - Show all the tasks: `./pma.sh`
   - First: configure base system: `./pma.sh system`. This must run as `root`. It assumes that user id `1000` is the default superuser.
   - Second: setup Arch Linux: `./pma.sh arch`. Run as regular user with sudo privileges (most probably user id 1000).

   Individual tasks can be run as well, if needed.

## Desktop Experience

### Budgie

Is Gnome based, but I really enjoyed the simple look and feel. It is quite light and fast.

Unfortunately, is also lagging behind, not very polished and riddled with issues (like the annoying bug in the lockscreen that is also a security risk).

### Gnome

I used Gnome for some time, but it felt sluggish, laggy and most gnome apps are oversimplified so I ended up replacing them.

Customization is limited, can be achieved with some extensions that are stable most of the time, but it feels like an afterthought. Finally, software updates are not that often, and when they happen, stuff breaks (like it happened after upgrade from Gnome 46 to 47).

Discouraged by some crashes and freezes.

### Tiling Window Managers

Gave Hyprland a go, but having a HiDPI display did not help because of scaling. Liked the simplicity and speed, but it not yet for me.

### KDE Plasma (default)

I liked the look and feel of modern Gnome, but I wanted more control over the desktop. Also, some of the most used apps are QT (KDE is built with QT) and had to do some customization specifically for them.

So I decided to give KDE Plasma a go. I was surprised by how smooth it runs and how easy it was to customize the desktop the way I wanted it:

- Hidden top panels and bottom bar because I use OLED screen.
- Catppuccin global theme with Bibata Modern Amber cursor.
- Tray icons out of the box
- Better HiDPI support with fractional scaling (much needed when using a 4K screen)
- Kvantum theme for GTK apps

Wanted to go with the lightest install possible, but still ended up installing `plasma-desktop`.

If you want a more polished experience OOTB with KDE Plasma and do not mind the additional bloatware, perhaps try:

- [CachyOS](https://cachyos.org/)
- [EndeavourOS](https://endeavouros.com/)
- [Manjaro](https://manjaro.org/) (has it own repos). Comparison to EndeavourOS: <https://www.youtube.com/watch?v=jv9VSh5zIGw>
- [Garuda](https://garudalinux.org/)

## Why yaml and taskfile.dev?

Just using shell scripts works, but I have always found it cumbersome to maintain.

I believe that using taskfile (a better Makefile alternative) helps with the structure, readability and composability.

Yaml is easier to parse and filter with [yq](https://mikefarah.gitbook.io/yq), and human readable when compared to json.

## License

[MIT](LICENSE)
