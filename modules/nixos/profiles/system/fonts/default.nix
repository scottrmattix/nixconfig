{inputs,self}:
{config, lib, pkgs, ...}:{
	fonts.fonts = with pkgs; [
		noto-fonts
		noto-fonts-cjk
		noto-fonts-emoji
		jetbrains-mono
		(nerdfonts.override {fonts = [ "JetBrainsMono" ];})
	];
}
