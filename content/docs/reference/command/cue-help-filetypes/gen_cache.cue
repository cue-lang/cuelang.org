package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-filetypes": {
						page: {
							cache: {
								multi_step: {
									hash:       "KO8N52691OODNTGFKJEP1C3SNDLT7JO2NCEVETLOEG2530VTSRHG===="
									scriptHash: "U151RFETTCA6DDO2KIACQGNQFDNCTPMBI63DBNT9O7R2QU7BCJRG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.2:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help filetypes"
										exitCode: 0
										output: """
												The cue tool supports the following file types:

												    Tag         Extensions      Description
												    cue         .cue            CUE source files.
												    json        .json           JSON files.
												    yaml        .yaml/.yml      YAML files.
												    toml        .toml           TOML files
												    jsonl       .jsonl/.ndjson  Line-separated JSON values.
												    jsonschema                  JSON Schema.
												    openapi                     OpenAPI schema.
												\tpb                          Use Protobuf mappings (e.g. json+pb)
												    textproto    .textproto     Text-based protocol buffers.
												    proto        .proto         Protocol Buffer definitions.
												    go           .go            Go source files.
												    text         .txt           Raw text file; the evaluated value
												                                must be of type string.
												    binary                      Raw binary file; the evaluated value
												                                must be of type string or bytes.

												OpenAPI, JSON Schema and Protocol Buffer definitions are
												always interpreted as schema. YAML and JSON are always
												interpreted as data. CUE and Go are interpreted as schema by
												default, but may be selected to operate in data mode.

												The cue tool will infer a file's type from its extension by
												default. The user may override this behavior by using qualifiers.
												A qualifier takes the form

												    <tag>{'+'<tag>}':'

												For instance,

												\tcue eval json: foo.data

												specifies that 'foo.data' should be read as a JSON file. File
												formats that do not have a default extension may be represented
												in any data format using the same notation:

												   cue def jsonschema: bar.cue foo.yaml openapi+yaml: baz.def

												interprets the files bar.cue and foo.yaml as data in the
												respective formats encoding an JSON Schema, while 'baz.def' is
												defined to be a YAML file which contents encode OpenAPI
												definitions.

												A qualifier applies to all files following it on the command line
												until the next qualifier. The cue tool does not allow a ':' in
												filenames.

												The following tags can be used in qualifiers to further
												influence input or output. For input these act as
												restrictions, validating the input. For output these act
												as filters, showing only the requested data and picking
												defaults as requested.

												    Tag         Description
												    data        Require concrete input and output that does
												                not require any evaluation.
												    graph       Like data, but allow references.
												    schema      Export data and definitions.

												The following tags are only valid in combination with other tags,
												and influence the functioning of the codec. The tag they are
												valid with is mentioned in parentheses at the end.

												    strictFeatures\treport errors for lossy mappings. (jsonschema)
												    strictKeywords\treport errors for unknown keywords (jsonschema)
												    strict\t\t\treport errors for either of the above (jsonschema)

												Many commands also support the --out and --outfile/-o flags.
												The --out flag specifies the output type using a qualifier
												(without the ':'). The -o flag specifies an output file
												possibly prefixed with a qualifier.

												Examples:

												# Interpret bar.cue and foo.yaml as OpenAPI data.
												$ cue def openapi: bar.cue foo.yaml

												# Write a CUE package as OpenAPI encoded as YAML, using
												# an alternate file extension.
												$ cue def -o openapi+yaml:foo.openapi

												# Print the data for the current package as YAML.
												$ cue export --out=yaml

												# Print the string value of the "name" field as a string.
												$ cue export -e name --out=text

												# Write the string value of the "name" field to a text file.
												$ cue export -e name -o=foo.txt

												# Write the string value of the "name" field to a file foo.
												$ cue export -e name -o=text:foo


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
