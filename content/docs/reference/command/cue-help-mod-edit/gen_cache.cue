package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-mod-edit": {
						page: {
							cache: {
								multi_step: {
									hash:       "5SK97S3LTGE8J03L83EQSQL77SVH71KT30DD5AGGAVC30R5QMFBG===="
									scriptHash: "10PNN2A9M5L5GF781G2T8F79BKHO90COMTUKE6QLV74V20U8DLT0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help mod edit"
										exitCode: 0
										output: """
												Edit provides a command-line interface for editing cue.mod/module.cue.
												It reads only that file; it does not look up information about the modules
												involved.

												The editing flags specify a sequence of editing operations.

												The -require=path@version and -drop-require=path@majorversion flags add
												and drop a requirement on the given module path and version. Note that
												-require overrides any existing requirements on path. These flags are
												mainly for tools that understand the module graph. Users should prefer
												'cue mod get path@version' which makes other cue.mod adjustments as
												needed to satisfy constraints imposed by other modules.

												The --module flag changes the module's path (the module.cue file's module field).
												The --source flag changes the module's declared source.
												The --drop-source flag removes the source field.

												Note that this command is not yet stable and may be changed.

												Usage:
												  cue mod edit [flags]

												Flags:
												      --drop-require string       remove a requirement
												      --drop-source               remove the source field
												      --language-version string   set language.version ('current' means current language version)
												      --module string             set the module path
												      --require string            add a required module@version
												      --source string             set the source field

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output
												      --trace        trace computation
												  -v, --verbose      print information about progress

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
