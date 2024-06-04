package site
{
	content: {
		docs: {
			reference: {
				cli: {
					"cue-registryconfig": {
						page: {
							cache: {
								multi_step: {
									hash:       "5JKQNOOP22NQ1H1QDARR7F34BRGJJTC92FU6KJU2VQ198II085H0===="
									scriptHash: "LK0L4EIBL3DILIMQ6KOL4N6P4VE6M2NRIVG839GN8PQCH0UBE8R0===="
									steps: [{
										doc:      ""
										cmd:      "cue help registryconfig"
										exitCode: 0
										output: """
												The registry configuration determines how CUE maps modules to their locations in
												OCI registries.

												Given a particular registry configuration, it's possible to work what registry a
												given module is stored in, and what repository within that registry, without
												making any network calls.

												If no explicit registry configuration is present, a default central registry
												(registry.cue.works) will be used for all modules.

												The simplest way of specifying a registry configuration is to set $CUE_REGISTRY
												to the hostname of that registry.

												Examples:

												\tCUE_REGISTRY=myregistry.example
												\tCUE_REGISTRY=localhost:5000
												\tCUE_REGISTRY='[::1]:5000'

												The special name "none" can be used to indicate that no registry
												should be used.

												If a path is present too, all modules will be stored under that path.

												For example:

												\tCUE_REGISTRY=localhost:5000/all/modules/will/be/stored/here

												By default for hosts other than localhost, a secure (HTTPS) connection will be
												used. This default can be set by appending "+insecure" or "+secure".

												For example:

												\tCUE_REGISTRY=100.98.141.117:5000+insecure
												\tCUE_REGISTRY=localhost:5000/modules+secure

												When specified in this way, the registry is used to fetch all modules.

												To use a specific registry for only certain subsets of modules, a prefix can be
												specified. This constrains a registry to be used only for modules that match
												that prefix. If there are multiple registries with a prefix, the longest
												matching prefix wins. When matching a prefix, only complete path elements
												(non-slash characters) are considered. It's an error if there are two identical
												prefixes in the same registry configuration.

												For example:

												\tCUE_REGISTRY='foo.example/bar=localhost:5000,myregistry.example'

												In the above example, modules with the prefix "foo.example/bar", such as
												"foo.example/bar/somemodule" (but not "foo.example/barry"), will be fetched from
												the registry at localhost:5000. All other modules will be fetched from
												"myregistry.example".

												Note that the syntax above implies that the ordering of the elements in
												CUE_REGISTRY isn't important because the resolution algorithm is
												order-independent.

												To specify that no registry should be used for a given module prefix,
												the special name "none" can be used.

												For example:

												\tCUE_REGISTRY='foo.example/bar=none,myregistry.example'

												In the above example, any attempt to fetch a module under
												"foo.example/bar" will result in a failure. Note that this will not
												take effect if the module is already present in the on-disk cache,
												which is consulted before looking at CUE_REGISTRY.


												Customizing Name Resolution

												Some registries have restrictions on what repositories can be used. For example,
												a registry implementation might restrict the depth of the available repository
												paths, or might even provide access to a single repository only. In order to
												accommodate these kinds of limitation, a registry configuration can also be
												specified in CUE syntax, usually as a configuration file.

												To do this, set CUE_REGISTRY to "file:" followed by the path to the
												configuration file. For example:

												\tCUE_REGISTRY=file:/home/alice/.config/cue/registry.cue

												To remove ambiguity, the simpler syntax described earlier can be explicitly
												requested with the "simple:" prefix. For example:

												\tCUE_REGISTRY=simple:myregistry.example

												If it is preferable not to create a file on disk for the configuration, the
												"inline:" prefix can be used:

												\tCUE_REGISTRY='inline:defaultRegistry: registry: "myregistry.example"'

												The configuration file syntax is described by the following CUE #file schema
												definition:

												\t// #file represents the registry configuration schema.
												\t#file: {
												\t\t// moduleRegistries specifies a mapping from module path prefix
												\t\t// (excluding any version suffix) to the registry to be used for
												\t\t// all modules under that path.
												\t\t//
												\t\t// A prefix is considered to match if a non-zero number of
												\t\t// initial path elements (sequences of non-slash characters) in
												\t\t// a module path match the prefix.
												\t\t//
												\t\t// If there are multiple matching prefixes, the longest
												\t\t// is chosen.
												\t\tmoduleRegistries?: [#modulePath]: #registry

												\t\t// defaultRegistry specifies a fallback registry to be used if no
												\t\t// prefix from moduleRegistry matches.
												\t\t// If it's not present, a system default will be used.
												\t\tdefaultRegistry?: #registry
												\t}

												\t#registry: {
												\t\t// registry specifies the registry host name and optionally, the
												\t\t// repository prefix to use for all modules in the repository,
												\t\t// and the security to use when accessing the host.
												\t\t//
												\t\t// It is in the form:
												\t\t// \thostname[:port][/repoPrefix][+insecure]
												\t\t//
												\t\t// The hostname must be specified in square brackets if it's an
												\t\t// IPv6 address.
												\t\t//
												\t\t// Connections will be secure unless explicitly specified
												\t\t// otherwise, except for localhost connections which default to
												\t\t// insecure.
												\t\t//
												\t\t// See the doc comment on pathEncoding for details as to how
												\t\t// repoPrefix is used to determine the repository to use for a
												\t\t// specific module.
												\t\t//
												\t\t// As a special case, the registry may be "none", indicating
												\t\t// that there is no registry for its associated modules.
												\t\t// If a module resolves to a "none" registry, the resolver
												\t\t// will return an error.
												\t\t//
												\t\t// Examples:
												\t\t//\t"localhost:1234"
												\t\t//\t"myregistry.example/my-modules+secure"
												\t\t//\t"none"
												\t\tregistry!: string

												\t\t// pathEncoding specifies how module versions map to
												\t\t// repositories within a registry.
												\t\t// Possible values are:
												\t\t// - "path": the repository is used as a prefix to the unencoded
												\t\t// module path. The version of the module is used as a tag.
												\t\t// - "hashAsPath": the hex-encoded SHA256 hash of the path is
												\t\t// used as a suffix to the above repository value. The version
												\t\t// of the module is used as a tag.
												\t\t// - "hashAsTag": the repository is used as is: the hex-encoded
												\t\t// SHA256 hash of the path followed by a hyphen and the version
												\t\t// is used as a tag.
												\t\tpathEncoding?: "path" | "hashAsRepo" | "hashAsTag"

												\t\t// prefixForTags specifies an arbitrary prefix that's added to
												\t\t// all tags. This can be used to disambiguate tags when there
												\t\t// might be some possibility of confusion with tags in use for
												\t\t// other purposes.
												\t\tprefixForTags?: #tag

												\t\t// TODO we could encode the invariant below in CUE but that
												\t\t// would result in poor error messages. With an error builtin,
												\t\t// that could perhaps be improved.

												\t\t// stripPrefix specifies that the pattern prefix should be
												\t\t// stripped from the module path before using as a repository
												\t\t// path. This only applies when pathEncoding is "path".
												\t\tstripPrefix?: bool
												\t}

												\t// TODO more specific schemas below
												\t#modulePath: string
												\t#tag:        string


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
