# BeanCal

This is a simple NixOS configuration for a smart calendar appliance. I built this for a few purposes: first, I wanted to get familiar with Nix and NixOS with a relativley simple project; and second, I had an old underpowered Windows tablet that I wasn't using, so I wanted to turn it into a smart calendar appliance thing to display the weather and my personal calendar (synced from my Nextcloud).

## Components

- GNOME Calendar
- GNOME Online accounts
- Sway WM
- GreetD

## Weird things

- My specific tablet model has a 32-bit UEFI and a 64-bit CPU. This use case on NixOS is documented [here](https://nixos.wiki/wiki/Bootloader#Installing_x86_64_NixOS_on_IA-32_UEFI) thankfully, but unfortunately GRUB 2.12 has a bug where it just doesn't work (as of April 2024). Because of those 2 things, there is some weird configuration to force i686 for GRUB and use an older version of the Nixpkgs repository.
- This is designed for a tablet to be mostly a read-only/kiosk sort of device. As such, there is no software keyboard included.
- The volume keys are mapped to changing the desktop. Also there's no audio enabled. Don't need it.
- There is no setup menu. If you do, for some reason, want to use this configuration as a base to make your own smart calendar appliance thing, you'll have to open gnome-control-center to connect to your cloud calendar provider. You could also technically click "Online Accounts" from the gnome-calendar hamburger menu.
- I hope you have an adapter to plug in a keyboard for the last step (or for troubleshooting) because there's no bluetooth support. Don't need it.
- Use Winkey+c to open a dmenu application launcher

## Disclaimer

This is sloppy. Please don't use it. The odds of you finding this useful are very slim. The device isn't exceptionally user-friendly even when it's built. Maybe it can be useful as reference, at least!
