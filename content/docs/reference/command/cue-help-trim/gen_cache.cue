package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-trim": {
						page: {
							cache: {
								multi_step: {
									hash:       "9BCGSIIEQ2PVJDG9TCFAQSJFHNCERF8R2KABLEF3O6LVC1SNK6G0===="
									scriptHash: "NPFQ45ALO8P7AA2FAU5T0DF2VCNOEUJVU395Q9J31G0NV9S1VUCG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help trim"
										exitCode: 0
										output: """
												trim removes fields from structs that can be inferred from constraints

												A field, struct, or list is removed if it is implied by a constraint, such
												as from an optional field matching a required field, a list type value,
												a comprehension or any other implied content. It will modify the files in place.


												Limitations

												Removal is on a best effort basis. Some caveats:
												- Fields in implied content may refer to fields within the struct in which
												  they are included, but are only resolved on a best-effort basis.
												- Disjunctions that contain structs in implied content cannot be used to
												  remove fields.
												- There is currently no verification step: manual verification is required.

												Examples:

												\t$ cat <<EOF > foo.cue
												\tlight: [string]: {
												\t\troom:          string
												\t\tbrightnessOff: *0.0 | >=0 & <=100.0
												\t\tbrightnessOn:  *100.0 | >=0 & <=100.0
												\t}

												\tlight: ceiling50: {
												\t\troom:          "MasterBedroom"
												\t\tbrightnessOff: 0.0    // this line
												\t\tbrightnessOn:  100.0  // and this line will be removed
												\t}
												\tEOF

												\t$ cue trim foo.cue
												\t$ cat foo.cue
												\tlight: [string]: {
												\t\troom:          string
												\t\tbrightnessOff: *0.0 | >=0 & <=100.0
												\t\tbrightnessOn:  *100.0 | >=0 & <=100.0
												\t}

												\tlight: ceiling50: {
												\t\troom: "MasterBedroom"
												\t}

												It is guaranteed that the resulting files give the same output as before the
												removal.

												Usage:
												  cue trim [flags]

												Flags:
												  -n, --dry-run          only run simulation
												  -f, --force            force overwriting existing files
												  -o, --outfile string   filename or - for stdout with optional file prefix (run 'cue help filetypes' for more info)

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
