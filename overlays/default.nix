{inputs,...}:
{
	nur-overlay = final: prev: {
		nur = inputs.nur.legacyPackages.${prev.system};
	};
	unstable-overlay = final: prev: {
		unstable = inputs.unstable.legacyPackages.${prev.system};
	};
}
