package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-mirror": {
						page: {
							cache: {
								multi_step: {
									hash:       "OOE7HPK5VGUCJ1LFE55OG0R3LGSHOUMKD589FV6OEGS4LRIL6HTG===="
									scriptHash: "RVD84RCTNEAAR1QJLN35L43LCJA7J4AIHC9R5UF7H7PPT8F7RTI0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.18.0-rc.3:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod mirror"
										exitCode: 0
										output: """
												This commmand ensures that a set of modules and their dependencies
												are available ("mirrored") in a registry.

												For each module specified on the command line, it ensures that the module and
												all the modules it depends on are present in both the "from" registry and the
												"to" registry, and that the contents are the same in each. If --no-deps is
												specified then the module will be mirrored without its dependencies.

												A module may be specified as <module>@<version>, in which case the
												specified version will be mirrored. If the version is canonical (for example v1.2.3), then
												exactly that version will be mirrored, otherwise (for example v1) the latest
												corresponding version will be mirrored (or all corresponding versions if --all-versions
												is specified).

												For example:

												\t# Copy from $CUE_REGISTRY (usually the Central Registry) to my.registry.example
												\tcue mod mirror --to my.registry.example foo.com/m1@v1.2.3 bar.org@v2

												will copy the exact module foo.com/m1@v1.2.3 but the latest version
												of bar.org@2, or all v2.x.y versions if --all-versions is given.
												If no major version is specified, the latest major version will be chosen.

												By default the latest version is chosen by consulting the source registry,
												unless the --mod flag is specified, in which case the current module's
												dependencies will be used. When --mod is given and no modules
												are specified on the command line, all the current module's dependencies will
												be mirrored.

												Usage:
												  cue mod mirror [module...] [flags]

												Flags:
												  -a, --all-versions[=true|false]   copy all available versions of the specified modules
												  -n, --dry-run[=true|false]        only run simulation
												      --from string                 source registry (defaults to $CUE_REGISTRY)
												  -m, --mod[=true|false]            mirror the current main module's dependency modules by default
												      --no-deps[=true|false]        do not copy module dependencies
												      --to string                   destination registry (defaults to $CUE_REGISTRY)

												Global Flags:
												  -E, --all-errors[=true|false]   print all available errors
												  -C, --chdir string              change working directory before running command (must be the first flag)
												  -i, --ignore[=true|false]       proceed in the presence of errors

												"""
									}]
								}
							}
						}
					}
				}
			}
		}
	}
}
