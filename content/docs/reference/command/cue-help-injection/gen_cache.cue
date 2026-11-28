package site
{
	content: {
		docs: {
			reference: {
				command: {
					"cue-help-injection": {
						page: {
							cache: {
								multi_step: {
									hash:       "IFOR06I9PU8NQ0C7CCFK455KEF0H5JCRDEJCC6663J7KET1GQSMG===="
									scriptHash: "G7MDBEVV39R93DVTSMSN78U1LFG85TJ9B56RK11NOP0I9KKMOSJG===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.19.0-0.dev.0.20261127222705-d53722b2b9cd:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue help injection"
										exitCode: 0
										output: """
												Many of the cue commands allow injecting values or
												selecting files from the command line using the --inject/-t flag.


												Injecting files

												A "build" attribute defines a boolean expression that causes a file
												to only be included in a build if its expression evaluates to true.
												There may only be a single @if attribute per file and it must
												appear before a package clause, or before any CUE declarations
												if there is no package clause.

												The expression is a subset of CUE consisting only of identifiers
												and the operators &&, ||, !, where identifiers refer to tags
												defined by the user on the command line.

												For example, the following file will only be included in a build
												if the user includes the flag "-t prod" on the command line.

												\t// File prod.cue
												\t@if(prod)

												\tpackage foo

												Ignoring files

												An "ignore" attribute causes a file to be unconditionally excluded
												from a build. The @ignore attribute must appear before a package
												clause or before any other CUE syntax if there is no package clause.

												For example:

												\t@ignore()

												\t// This file will be excluded for all purposes.

												\tpackage foo

												Injecting values

												The injection mechanism allows values to be injected into fields
												that are marked with a "tag" attribute, that are labeled with an
												identifier or a double-quoted string, and that are not defined
												within a comprehension, list, pattern constraint, dynamic field,
												optional field, or required field. For any field of the form

												\tfield: x @tag(key)

												an "--inject key=value" flag will modify the field to

												\tfield: x & "value"

												By default, the injected value is treated as a string.
												Alternatively, the "type" option allows a value to be interpreted
												as an int, number, or bool. For instance, for a field

												\tfield: x @tag(key,type=int)

												the flag "-t key=2" modifies the field to

												\tfield: x & 2

												Valid values for type are "int", "number", "bool", and "string".

												A tag attribute can also define shorthand values, which can be
												injected into the fields without having to specify the key. For
												instance, for

												\tenvironment: string @tag(env,short=prod|staging)

												"-t prod" sets the environment field to the value "prod". It is
												still possible to specify "-t env=prod" in this case.

												Use the usual CUE constraints to limit the possible values of a
												field. For instance

												\tenvironment: "prod" | "staging" @tag(env,short=prod|staging)

												ensures the user may only specify "prod" or "staging".


												Tag variables

												The injection mechanism allows for the injection of system variables:
												when variable injection is enabled by passing the --inject-vars/-T flag,
												tags of the form

												\t@tag(dir,var=cwd)

												will inject the named variable (here cwd) into the tag. An explicitly
												set value for a tag using --inject/-t takes precedence over an
												available tag variable.

												The following variables are supported:

												   now        current time in RFC3339 format.
												   os         OS identifier of the current system. Valid values:
												                aix       android   darwin    dragonfly
												                freebsd   illumos   ios       js (wasm)
												                linux     netbsd    openbsd   plan9
												                solaris   windows
												   arch       architecture identifier of the current system. Valid values:
												                386        amd64        amd64p32  arm
												                armbe      arm64        arm64be   loong64
												                mips       mipsle       mips64    mips64le
												                mips64p32  mips64p32le  ppc       ppc64
												                ppc64le    riscv        riscv64   s390
												                s390x      sparc        sparc64   wasm
												   cwd        working directory
												   username   current username
												   hostname   current hostname
												   env        environment variables as a {[string]: string};
												              use a hidden field to not export sensitive values
												   rand       a random 128-bit integer


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
