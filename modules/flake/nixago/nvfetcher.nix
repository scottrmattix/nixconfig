{pkgs, ...}: let
  nvfetcherEngine = opts: request: let
    inherit (request) data output;

    name = builtins.baseNameOf output;

    value = data;
  in
    (pkgs.formats.nvfetcherToml opts).generate name value;

  nvfetcherFiles = [
  ];
in
  map (f: {
    data = import ../../${f};
    output = "${builtins.dirOf f}/nvfetcher.toml";
    engine = nvfetcherEngine {};
  })
  nvfetcherFiles
