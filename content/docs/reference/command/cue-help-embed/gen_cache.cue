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
									hash:       "FPEURJSBUPIG9GMN0JSCRLUD38LVL2S2BEG7OLUEPN36D6AFKDJ0===="
									scriptHash: "RGRK2G70JC0AFIF7GANV2ERPE0U7K9SHH0PT7FJNH7IU9JBQ76Q0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.16.0:$PATH"
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

												By default, a glob pattern that matches no files results in an error.
												To allow empty results, use the "allowEmptyGlob" option:

												\tc: _ @embed(glob=optional/*.json, allowEmptyGlob)
												\tc: [string]: {...}

												If the file extension in "file" or "glob" does not imply a file type,
												it must be specified with the "type" encoding as shown above.
												See the "filetypes" help topic for more.

												Files containing multiple documents cannot be embedded directly.
												For NDJSON or multi-document YAML files, embed as type=text
												and use APIs like yaml.Extract to decode as a list.

												Only files in the same module containing the CUE file can be embedded.
												Embedding is forbidden when outside a module, and parent directory
												references are not allowed.

												Note that embedding CUE files is not supported at this time.

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
