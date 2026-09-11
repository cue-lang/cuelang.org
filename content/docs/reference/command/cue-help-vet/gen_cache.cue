package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-vet": {
						page: {
							cache: {
								multi_step: {
									hash:       "CH0CFEOQUAJ5RBSG9M3597ICBNN3BH3UQSG64OVTIQNGGGKTEET0===="
									scriptHash: "18RC69D9GOJ1BKP5T1PHBHQR9TODDP3N9C46VTUMRP9U6NS6VA6G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help vet"
										exitCode: 0
										output: """
												The vet command validates CUE and other data files.
												The command is silent when it succeeds; otherwise it reports any errors found.

												Input arguments can be CUE packages, CUE files, non-CUE files, or some
												combinations of those. See "cue help inputs" for more detail.

												By default, vet ensures that the result of validation is concrete
												by reporting an error if any resulting regular fields have non-concrete values.
												Use -c=false to not require concreteness, or -c to show these error messages.

												vet can also validate non-CUE files in these file formats:

												  Format       Extensions
												\tJSON       .json .jsonl .ndjson
												\tYAML       .yaml .yml
												\tTOML       .toml
												\tTEXT       .txt  (validate a single string value)

												Data files with multiple values, such as YAML with --- document separators,
												are validated one object at a time. Use --list to validate them as a list.

												By default, each file is checked against the root of the loaded CUE.
												Use the -d flag to select a schema at a particular expression instead.

												Examples:

												  # Check that a collection of CUE packages has no errors.
												  cue vet -c=false ./...

												  # Check against a schema at the root of a CUE file:
												  cue vet -c foo.cue foo.yaml

												  # Check against a schema from a registry:
												  cue vet -c -d '#Workflow' cue.dev/x/githubactions@latest workflow.yml

												The -d flag can be repeated to validate against multiple schemas at once.

												Usage:
												  cue vet [flags] [inputs]

												Flags:
												  -c, --concrete                 require the evaluation to be concrete, or set -c=false to allow incomplete values
												  -t, --inject stringArray       set the value of a tagged field
												  -T, --inject-vars              inject system variables in tags
												      --list                     concatenate multiple objects into a list
												      --merge                    merge non-CUE files (default true)
												  -n, --name string              regexp filter for non-CUE file names in directories
												  -p, --package string           package name for non-CUE files and CUE output
												  -l, --path stringArray         CUE expression for single path component (see 'cue help flags' for details)
												      --proto_enum string        mode for rendering enums (int|json) (default "int")
												  -I, --proto_path stringArray   paths in which to search for imports
												  -d, --schema stringArray       expression to select schema for evaluating values in non-CUE files
												      --with-context             import as object with contextual data (see 'cue help flags' for details)

												Global Flags:
												  -E, --all-errors     print all available errors
												  -C, --chdir string   change working directory before running command (must be the first flag)
												  -i, --ignore         proceed in the presence of errors
												  -s, --simplify       simplify output

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
