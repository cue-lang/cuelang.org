package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-embed": {
						page: {
							cache: {
								multi_step: {
									hash:       "6J984NL2B7DK7869N1FG1NN4F179PKSLGRK8NHOVJTDFNO0QSQ0G===="
									scriptHash: "EAT16O1DPTV95KDL0LCL6FQSTHVCGJTJ4QKGIJ7O5HUU1OMHES0G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-alpha.2.0.20250328144635-721ca5db06fc:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help embed"
										exitCode: 0
										output: """
												The @embed attribute can be used to load files as part of CUE evaluation.
												Embedding must be enabled by a file-level @extern(embed) attribute.

												Embed a single file as follows, which must exist when evaluating:

												\t@extern(embed)

												\tpackage foo

												\ta: _ @embed(file=foo.json)

												Embed many files of the same type with a glob pattern,
												which inserts one field per file matched:

												\tb: _ @embed(glob=images/*.*, type=binary)
												\tb: [string]: bytes

												Note that "**" glob patterns are not supported at this time.

												If the file extension in "file" or "glob" does not imply a file type,
												it must be specified with the "type" encoding as shown above.
												See the "filetypes" help topic for more.

												Files containing multiple documents cannot be embedded directly.
												For NDJSON or multi-document YAML files, embed as type=text
												and use APIs like yaml.Extract to decode as a list.

												Note that embedding CUE files is not supported at this time.

												For the time being, embedding support can still be disabled via
												CUE_EXPERIMENT=embed=0.

												For more details and discussion, see the proposal linked from
												https://cuelang.org/discussion/3264.


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
