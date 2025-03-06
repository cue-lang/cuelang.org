package site
{
	content: {
		docs: {
			howto: {
				"update-imports-after-reorganising-packages": {
					page: {
						cache: {
							upload: {
								"importing package": "dRAxsbrkpUAZC7saxspG2dVPsmm1SMVWgl05nqBg08E="
								"imported packages": "6zvPcPtsE0yCQDNHU2+1SvPWhrrwk3w3JUj5vC5YoUA="
								"updated packages":  "5jyqGVBdolUymf6xCwSd0m5rdxtyFN46q0Qx0d7e5iA="
							}
							multi_step: {
								hash:       "PTQK11P6DG902OLQ3CISMJ9TLGQI7BJTEIO7J1TAH4TGVOSBGFO0===="
								scriptHash: "AK3E0DQPLJDGE61QHFIEGGI19FKBKQJNNC1HNPJ7M98PQRGV4HHG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.13.0-0.dev.0.20250225142354-26a698fe9ae9:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-0.dev.0.20250225142354-26a698fe9ae9
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod init cue.example/refactor-imports"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											meta:
											  id: foo
											  release: 4.2.0
											  bar:
											    id: bar
											    release: 1.2.3

											"""
								}, {
									doc:      ""
									cmd:      "mv -v alpha beta"
									exitCode: 0
									output: """
											renamed 'alpha' -> 'beta'

											"""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 1
									output: """
											cue.example/refactor-imports@v0: import failed: cannot find package "cue.example/refactor-imports/alpha/foo": cannot find module providing package cue.example/refactor-imports/alpha/foo:
											    ./example.cue:3:8

											"""
								}, {
									doc:      ""
									cmd:      "cue refactor imports cue.example/refactor-imports/alpha cue.example/refactor-imports/beta"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv example.cue{,.got}"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "mv beta/foo/metadata.cue{,.got}"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff example.cue{,.got}"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff beta/foo/metadata.cue{,.got}"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											meta:
											  id: foo
											  release: 4.2.0
											  bar:
											    id: bar
											    release: 1.2.3

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
