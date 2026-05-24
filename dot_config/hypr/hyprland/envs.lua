hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- According to: https://wiki.hypr.land/Nvidia/#environment-variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- See https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
hl.env("XMODIFIERS", "@im-fcitx")

-- Fix the input keyboard symbolic error.
-- See https://wiki.archlinux.org/title/Uniform_look_for_Qt_and_GTK_applications
hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
hl.env("QT_WAYLAND_DECORATION", "adwaita")
