package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-inputs": {
						page: {
							cache: {
								multi_step: {
									hash:       "S061P9EO2MIR74O7S8IH96EHU2B2B7KSBURFQ6RNNMKU1HATF9UG===="
									scriptHash: "FTHCPPU06BD4Q00EC3GVPFI3F83JGV082NPM54DBJMSK9T6OGL80===="
									steps: [{
										doc:      ""
										cmd:      "cue help inputs"
										exitCode: 0
										output: """
												Many commands apply to a set of inputs:

												cue <command> [inputs]

												The list [inputs] may specify CUE packages, CUE files, non-CUE
												files or some combinations of those. An empty list specifies
												the package in the current directory, provided there is a single
												named package in this directory.

												CUE packages are specified as an import path. An import path
												that begins with a "." or ".." element is a relative import path,
												is interpreted as a file system path, and denotes the
												package instance in that directory.

												Otherwise, the import path P is absolute and denotes a package that
												may be external, usually found in an external registry. It may also
												refer to a package in cue.mod/{pkg|gen|usr}/P - this is legacy
												behavior that might be removed at a later date.

												An absolute import path is of the form P or P@vN where vN is the major
												version of the module containing the package. An import path is mapped
												to a registry location by consulting cue.mod/module.cue and the
												registry configuration (see "cue help modules" and "cue help
												registryconfig" for more details).

												An import may contain a ":name" suffix to indicate a specific
												package to load within a given path. It is necessary to specify this
												when there is more than one package at the path.

												For example, the following import path specifies a package
												named "other" in some external module with major version v1.

												\tfoo.example/bar/baz@v1:other

												A local import path may contain one or more "..." to match any
												subdirectory: pkg/... matches all packages below pkg, including pkg
												itself, while foo/.../bar matches all directories named bar within
												foo. In all cases, directories containing cue.mod directories are
												excluded from the result. "..." is not currently supported in external
												import paths.

												Directory and file names that begin with "." or "_" are ignored,
												unless explicitly listed as inputs. File with names ending "_tool.cue"
												are ignored unless running "cue cmd" and they are in packages
												explicitly mentioned on the command line. Files with names ending
												"_test.cue" are ignored for the time being; they are reserved for
												future testing functionality.

												A package may also be specified as a list of .cue files.
												The special symbol '-' denotes stdin or stdout and defaults to
												the cue file type for stdin. For stdout, the default depends on
												the cue command. A .cue file package may not be combined with
												regular packages.

												Non-cue files are interpreted based on their file extension or,
												if present, an explicit file qualifier (see the "filetypes"
												help topic). By default, all recognized files are unified at
												their root value. See the "filetypes" and "flags" help topics
												on how to treat each file individually or how to combine them
												differently.

												If a data file has multiple values, such as allowed with JSON
												Lines or YAML, each value is interpreted as a separate file.

												If the --schema/-d is specified, data files are not merged, and
												are compared against the specified schema within a package or
												non-data file. For OpenAPI, the -d flag specifies a schema name.
												For JSON Schema the -d flag specifies a schema defined in
												"definitions". In all other cases, the -d flag is a CUE
												expression that is evaluated within the package.

												Examples (also see also "flags" and "filetypes" help topics):

												# Show the definition of each package named foo for each
												# directory dir under path.
												$ cue def ./path/.../dir:foo

												# Unify each document in foo.yaml with the value Foo in pkg.
												$ cue export ./pkg -d Foo foo.yaml

												# Unify data.json with schema.json.
												$ cue export data.json schema: schema.json


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
