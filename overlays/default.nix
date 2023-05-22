{self,inputs, lib, ...}:
let
  inherit (self.lib) importModulesWith;
in
{
  flake = {
    overlays = {
      default =
        (_final: prev:
        let
          system = prev.system;
        in
        {
          unstable = import inputs.unstable {
            inherit system;
            config.allowUnfree = true;
          };
          NUR = import inputs.NUR {
            inherit system;
            config.allowUnfree = true;
          };
        });
    };
  };
}
