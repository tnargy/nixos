inputs: {
  "profiles" = import ./profiles inputs;
  "profiles/base" = import ./profiles/base inputs;
  "profiles/browsing" = import ./profiles/browsing inputs;
  "profiles/laptop" = import ./profiles/laptop inputs;

  "programs/nixpkgs" = import ./programs/nixpkgs inputs;

  "misc/awesome" = import ./misc/awesome inputs;
  "misc/home" = import ./misc/home inputs;
}
