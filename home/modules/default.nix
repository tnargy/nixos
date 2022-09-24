inputs: {
  "profiles" = import ./profiles inputs;
  "profiles/base" = import ./profiles/base inputs;
  "profiles/browsing" = import ./profiles/browsing inputs;
  "profiles/development" = import ./profiles/development inputs;

  "programs/advcp" = import ./programs/advcp inputs;
  "programs/nixpkgs" = import ./programs/nixpkgs inputs;
  "programs/exa" = import ./programs/exa inputs;

  "services/keyleds" = import ./services/keyleds inputs;
  "services/insync" = import ./services/insync inputs;
  "services/restic" = import ./services/restic inputs;

  "misc/awesome" = import ./misc/awesome inputs;
  "misc/home" = import ./misc/home inputs;
}
