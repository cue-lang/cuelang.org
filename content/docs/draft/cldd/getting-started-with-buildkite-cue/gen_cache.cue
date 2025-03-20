package site
{
	content: {
		docs: {
			draft: {
				cldd: {
					"getting-started-with-buildkite-cue": {
						page: {
							cache: {
								upload: {
									"1":  "nwCojps78PmN1o9kWCH34Hfp8soHPCZgOqaqozqQjtc="
									yaml: "fubPPqMndi/1PaVhGnuFr4GFjGqV761bp5skIneKyG8="
								}
								multi_step: {
									hash:       "LD03QARGAKJMA6OE39J2KP4J39CM2HBCTF513MJG0JBC3VED24B0===="
									scriptHash: "I941VA9FBMON3VUTFS8O7IV75IA9DGNTIHTG9B9QS6OPE9L9CQPG===="
									steps: [{
										doc:      "# Registry auth"
										cmd:      "mkdir -p $HOME/.config/cue"
										exitCode: 0
										output:   ""
									}, {
										doc: ""
										cmd: """
												cat <<EOD >$HOME/.config/cue/logins.json
												{"registries":{"registry.cue.works":{"access_token":"${TEST_USER_AUTHN_CUE_USER_NEW}","token_type":"Bearer"}}}
												EOD
												"""
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# Switch to CUE tip, as this page will only be seen on tip.cuelang.org
												# and it's easiest to align behaviours here, inline, rather than using
												# the internal/patch/tip.diff mechanism.
												"""
										cmd:      "export PATH=/cues/v0.13.0-alpha.1.0.20250313135405-2fe368efde2b:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc: """
												# Use evalv3, as that's required for curated modules.
												# TODO(jm): remove this after the site's cmd/cue tip version reaches a version
												# which has evalv3 enabled by default.
												"""
										cmd:      "export CUE_EXPERIMENT=evalv3=1"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod init cue.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue mod tidy"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet -c"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mkdir .buildkite"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue export --outfile .buildkite/pipeline.yml -e pipelines.example"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv .buildkite/pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff -u .buildkite/pipeline.yml{,.got}"
										exitCode: 0
										output:   ""
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
