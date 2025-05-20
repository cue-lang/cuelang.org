package site
{
	content: {
		docs: {
			howto: {
				"mirror-modules-between-registries": {
					page: {
						cache: {
							multi_step: {
								hash:       "JK4PI9RLC46JDSH101V9E5LT6IL2HOQ3R6NFGTGRICHHM6A39MAG===="
								scriptHash: "1415QG7CSCP39CVTSAQO2NO4N18Q7J2DGD76QBFVJU6MHIHM1O2G===="
								steps: [{
									doc: """
											# Local registry.
											# TODO: this is inherently racey. But not a problem in practice...
											# for now. When it does become a problem we can solve this properly
											# using a nc-based wait loop or similar.
											"""
									cmd:      "nohup cue mod registry localhost:55443 >/tmp/cue_mod_registry 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# Access to \"cue mod mirror\" via tip of cmd/cue."
									cmd:      "export PATH=/cues/v0.13.0-rc.1:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.13.0-rc.1
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue mod mirror --to 127.0.0.1:55443 github.com/cue-tmp/jsonschema-pub/exp3/k8s.io"
									exitCode: 0
									output: """
											mirroring github.com/cue-tmp/jsonschema-pub/exp3/k8s.io@v0.1.0

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
