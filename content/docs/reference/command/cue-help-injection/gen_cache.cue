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
									hash:       "DM6KVD65EUTE0T4VV34F6CJGEL8OU7331G969SMSUNHEDIQ2SF00===="
									scriptHash: "KJEUF33S3HJAM1TPK0DJP6EC7JG37PP7C9QU7VO376RF2JAC4KT0===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.14.0:$PATH"
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
												that are not defined within the scope of a comprehension, list, or
												optional field and that are marked with a "tag" attribute. For any
												field of the form

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
