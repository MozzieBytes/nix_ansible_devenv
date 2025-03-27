{
  projectRootFile = "flake.nix";

  programs.nixfmt.enable = true;
  programs.yamlfmt.enable = true;
  settings.global.excludes = [ ".envrc" ];
}
