package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-export": {
						page: {
							cache: {
								multi_step: {
									hash:       "36FICQG8B71C6D6G17VKUEKS1453P07RFTPO8QK5U97VVOEGOCVG===="
									scriptHash: "8MCA85A1L2ES4UP2T4OG9E2M92Q40QCS8SRMKAKF3RCFMHQOSS1G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0-alpha.2.0.20260220153551-3dfa50a46189:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help export"
										exitCode: 0
										output: """
												The export command evaluates a configuration and emits the value of one or more
												expressions.

												## Inputs

												When invoked without any arguments the command evaluates the CUE package in the
												current directory. If more than one package is present in the current directory
												then an input argument must be provided.

												Input arguments can be CUE packages, CUE files, non-CUE files, or some
												combinations of those. See "cue help inputs" for more detail.

												## Output

												By default the top-level of the evaluation is emitted to standard output,
												encoded as JSON. A different destination can be specified using the
												--outfile/-o flag. An alternative encoding can be selected with the --out flag.
												One or more different expressions can be emitted using the --expression/-e flag.

												The command reports an error if the value of any expression to be emitted is
												incomplete - that is, if it contains any non-concrete values that cannot be
												represented in data-only encodings such as JSON.

												The following encodings are recognized by the --out flag:

												    cue        Output as CUE    (can encode any value)
												    json       Output as JSON   (can encode any value)
												    toml       Output as TOML   (can encode any value)
												    yaml       Output as YAML   (can encode any value)
												    text       Output as text   (can only encode values of type string)
												    binary     Output as binary (can only encode values of type string or bytes)

												See "cue help filetypes" for more information on values accepted by --out.

												## Examples

												- Export the contents of the only CUE package in the current directory as JSON:
												  $ cue export

												- Export the contents of an absolute package path as YAML:
												  $ cue export cue.example/foo/bar --out yaml

												- Unify the contents of the "example" package (which exists alongside other
												  package in the current directory) with a YAML file, emitting the value of the
												  "aKey" field as JSON:
												  $ cue export .:example path/to/data.yml --expression aKey

												- Export the contents of one of many CUE packages in a different, relative
												  directory as TOML:
												  $ cue export ./relative/path/to/directory:example --out toml

												- Export the unified contents of multiple CUE files as CUE:
												  $ cue export config.cue dir/extraData.cue --out cue

												- Unify the contents of a CUE package and a TOML file, emittting the values of
												  multiple expressions (rather than the top-level of the evaluation) as JSON:
												  $ cue export cue.example/some/package data.toml -e key1 -e key2

												## More help

												- An in-depth guide to the "cue export" command:
												    https://cuelang.org/docs/concept/using-the-cue-export-command/
												- The "cue help inputs" command:
												    https://cuelang.org/docs/reference/command/cue-help-inputs/
												- The "cue help filetypes" command:
												    https://cuelang.org/docs/reference/command/cue-help-filetypes/

												Usage:
												  cue export [flags]

												Flags:
												      --escape                   use HTML escaping
												  -e, --expression stringArray   export this expression only
												  -f, --force                    force overwriting existing files
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												  -n, --name string              regexp filter for non-CUE file names in directories
												      --out string               output format (run 'cue help filetypes' for more info)
												  -o, --outfile string           filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)
												  -p, --package string           package name for non-CUE files
												  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string        mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray   paths in which to search for imports
												  -d, --schema string            expression to select schema for evaluating values in non-CUE files
												      --with-context             import as object with contextual data

												Global Flags:
												  -E, --all-errors   print all available errors
												  -i, --ignore       proceed in the presence of errors
												  -s, --simplify     simplify output

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
