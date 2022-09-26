{
  config,
  lib,
  ...
}: {
  nix = {
    settings.substituters = [
      "https://tnargy.cachix.org"
    ];
    settings.trusted-public-keys = [
      "tnargy.cachix.org-1:mmQnR9w39W10ozUtbzGhksrUHTg8SY9vCiwWX8kO9w4="
    ];
  };
}
