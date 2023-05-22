{inputs,self}:
{lib, config, pkgs,...}:
{
  profiles.tools = {
    rust.enable = true;
    c.enable = true;
  };
}
