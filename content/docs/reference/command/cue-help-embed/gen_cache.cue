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
									hash:       "9R5TUBMMVJ4JAQL294DJAV808JF0IPHI2A1AVMF11AMQQLAVR2KG===="
									scriptHash: "44GNGDAPS9QM1GQBR3816KBAIA92J8J3HIE49DK2QNIG8MOUOC50===="
									steps: [{
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

												Note that embedding cue files is not supported at this time.

												Note: support for embed is experimental, and is enabled via
												CUE_EXPERIMENT=embed.

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
