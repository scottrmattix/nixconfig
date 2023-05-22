lib: {
  collectOptions = out:
    lib.mapAttrsToList (name: value: value) out;
}
