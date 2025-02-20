package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-refactor-imports": {
						page: {
							cache: {
								multi_step: {
									hash:       "7QO01OEDQ838NIFN0PL9CR1TFH019GU2E1JJSKCMRMCV6FS5ONQ0===="
									scriptHash: "3F4EFIM49J05HLHRJORHFBFFPVHJV25211MATB3CFJ1B8ELCL69G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250225142354-26a698fe9ae9:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help refactor imports"
										exitCode: 0
										output: """
												WARNING: THIS COMMAND IS EXPERIMENTAL.

												This command alters import directives in the current module. By
												default it rewrites any imports in the current module that have a path
												prefix matching oldImportPath to replace that prefix by newImportPath.
												It does not attempt to adjust the contents of the cue.mod/module.cue file:
												use "cue mod get" or "cue mod tidy" for that.

												If the major version suffix is omitted from oldImportPath, then the
												major version will match the default major version specified in the
												module.cue file for that import path unless --all-major is specified,
												in which case all major versions will match.

												If the --exact flag is specified, then oldImportPath is only
												considered to match when the entire path matches, rather than matching
												any path prefix. The --exact flag is implied if either oldImportPath
												or newImportPath contain an explicit package qualifier or when the
												--ident flag is specified.

												If oldImportPath is omitted and --exact is not specified,
												oldImportPath is taken to be the same as newImportPath but with the
												major version suffix omitted (see above for details). If oldImportPath
												is omitted and --exact *is* specified, oldImportPath is taken to be
												the same as newImportPath (this is useful in conjunction with
												--ident).

												By default the identifier that the package is imported as will be kept
												the same (this is to minimize code churn). However, if --update-ident
												is specified, the identifier that the package is imported as will be
												updated according to the new import path's default identifier. If
												--ident is specified, the identifier that the package is imported as
												will be updated to that identifier; this also implies --exact. The
												resulting CUE code is sanitized: that is, other than importing a
												different package, identifiers within the file will always refer to
												the same import directive.

												For example:

												\t# Change from k8s "cue get go" imports to new curated namespace
												\tcue refactor imports k8s.io cuelabs.dev/x/k8s

												\t# Update to use a new major version of the foo.com/bar module.
												\tcue refactor imports foo.com/bar@v0 foo.com/bar@v1

												\t# A shorter form of the above, assuming v0 is the default major
												\t# version for foo.com/bar.
												\tcue refactor imports foo.com/bar@v1

												\t# Use a different package from the pubsub package directory
												\tcue refactor imports github.com/cue-unity/services/pubsub github.com/cue-unity/services/pubsub:otherpkg

												\t# Use a different identifier for the import of the pubsub package.
												\tcue refactor imports --ident otherPubSub github.com/cue-unity/services/pubsub

												\t# Update only foo.com/bar, not (say) foo.com/baz/somethingelse
												\tcue refactor imports --exact foo.com/bar foo.com/baz

												\t# Refactor, for example github.com/foo/bar/something.v2/pkg to foo.example/something/v2/pkg
												\tcue refactor imports 'github.com/foo/bar/(.*)\\.(v[0-9]+)(.*)' 'foo.example/$1/$2$3'

												Usage:
												  cue refactor imports [<oldImportPath] <newImportPath> [flags]

												Flags:
												      --all-major      match all versions when major version omitted
												      --exact          exact match for package path instead of prefix match
												      --ident string   specify imported identifier (implies --exact)
												      --update-ident   update imported identifier name too

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
