{...}: {
  fileSystems."/" =
    { device = "/dev/disk/by-uuid/288c6720-f583-4756-b74d-27eabf496d09";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CBDD-1148";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/ccdd234e-b58a-440b-b951-4fef68c3812c"; }
    ];
}
