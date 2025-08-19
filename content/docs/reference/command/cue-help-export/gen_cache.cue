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
									hash:       "FKJR3VK0HPKHB1G9HR2OOJ12VDAQMSF9OQ4KDUC6QPF853PEI3K0===="
									scriptHash: "HU4A9M4PCRFH0PLB41TNPSF74ESODJ10E13H4700K66PCL7ET070===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.1:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help export"
										exitCode: 0
										output: """
												export evaluates the configuration found in the current
												directory and prints the emit value to stdout.

												Examples:
												Evaluated and emit

												\t# a single file
												\tcue export config.cue

												\t# multiple files: these are combined at the top-level. Order doesn't matter.
												\tcue export file1.cue foo/file2.cue

												\t# all files within the "cloud" package, including all files in the
												\t# current directory and its ancestor directories that are marked with the
												\t# same package, up to the root of the containing module.
												\tcue export .:cloud

												\t# the package name can be omitted if the directory only contains files for
												\t# the "cloud" package.
												\tcue export

												Emit value:
												For CUE files, the generated configuration is derived from the top-level
												single expression, the emit value. For example, the file

												\t// config.cue
												\targ1: 1
												\targ2: "my string"

												\t{
												\t\ta: arg1
												\t\tb: arg2
												\t}

												yields the following JSON:

												\t{
												\t\t"arg1": 1,
												\t\t"a": 1,
												\t\t"arg2": "my string",
												\t\t"b": "my string"
												\t}

												In absence of arguments, the current directory is loaded as a package instance.
												A package instance for a directory contains all files in the directory and its
												ancestor directories, up to the module root, belonging to the same package. If
												a single package is not uniquely defined by the files in the current directory
												then the package name must be specified as an explicit argument using
												".:<package-name>" syntax.


												Formats

												The following formats are recognized:

												    cue  output as CUE
												              Outputs any CUE value.

												   json  output as JSON
												              Outputs any CUE value.

												   yaml  output as YAML
												              Outputs any CUE value.

												   text  output as raw text
												              The evaluated value must be of type string.

												 binary  output as raw binary
												              The evaluated value must be of type string or bytes.

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
