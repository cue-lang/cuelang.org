package site
{
	content: {
		docs: {
			howto: {
				"use-the-built-in-function-matchn": {
					page: {
						cache: {
							upload: {
								basic:                   "15qKpglraBde7h3uE9nERrhrmtummNpPC3m/sGJzISU="
								"one of":                "R7QNCGIdlZsjm10jFhqgR2eUuJ31Pcym2XgEJlOGVrM="
								"any of":                "WPOAINSg94FNI60MQBANbIRnPY2XVkAWQl8xVuuN27o="
								"all of":                "AMk4vuMrhqEpoHmBjCJsMU6hDSbDC0paXrD+YZ8OLfw="
								not:                     "vFjzDjqhkzNYmQ6uEcZY15m+x0BhuaUyQg9cLaoBTLQ="
								"all but one":           "wf4yYNIwhmSIThFcSdbDfBOHC3F+zakuvgf81JhSTeU="
								composite:               "FtTVYKBbgKdUO9rkZyhIlRKmaT081yySvb8wpOdiRN0="
								"future: helper fields": "u8gsBlqe+ss4JnpU0hZMezXd2EaR52VAcOxSyXfAFgg="
							}
							multi_step: {
								hash:       "QIROHG7JNN17RC702QTA68JNNM14DR4KME67GUQH8QSE664LJDU0===="
								scriptHash: "M0NA2GTSRG9NPM0LLCU499MMLBC119FTA5G2SM0CT9U217MR4S60===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.11.0:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "cue version"
									exitCode: 0
									output: """
											cue version v0.11.0
											...

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:basic"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN): 2 matched, expected 1:
											    ./basic.cue:11:4
											    ./basic.cue:9:4
											    ./basic.cue:11:11
											    ./basic.cue:12:4
											B: invalid value 42 (does not satisfy matchN): 2 matched, expected 3:
											    ./basic.cue:12:4
											    ./basic.cue:9:4
											    ./basic.cue:11:4
											    ./basic.cue:12:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:oneOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN): 2 matched, expected 1:
											    ./one-of.cue:13:4
											    ./one-of.cue:11:4
											    ./one-of.cue:13:11
											    ./one-of.cue:14:4
											B: invalid value 42 (does not satisfy matchN): 0 matched, expected 1:
											    ./one-of.cue:14:4
											    ./one-of.cue:11:4
											    ./one-of.cue:13:4
											    ./one-of.cue:14:11
											C: invalid value 15 (does not satisfy matchN): 2 matched, expected 1:
											    ./one-of.cue:18:4
											    ./one-of.cue:16:4
											    ./one-of.cue:18:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:anyOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN): 0 matched, expected >0:
											    ./any-of.cue:10:4
											    ./any-of.cue:8:4
											    ./any-of.cue:10:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:allOf"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN): 2 matched, expected 3:
											    ./all-of.cue:13:4
											    ./all-of.cue:11:4
											    ./all-of.cue:13:11
											    ./all-of.cue:14:4
											B: invalid value 42 (does not satisfy matchN): 3 matched, expected 4:
											    ./all-of.cue:14:4
											    ./all-of.cue:11:4
											    ./all-of.cue:13:4
											    ./all-of.cue:14:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:not"
									exitCode: 1
									output: """
											B: invalid value 42 (does not satisfy matchN): 1 matched, expected 0:
											    ./not.cue:16:4
											    ./not.cue:14:4
											    ./not.cue:16:11
											    ./not.cue:17:4
											    ./not.cue:18:4
											B: invalid value 42 (does not satisfy matchN): 1 matched, expected 0:
											    ./not.cue:17:4
											    ./not.cue:14:4
											    ./not.cue:16:4
											    ./not.cue:17:11
											    ./not.cue:18:4
											B: invalid value 42 (does not satisfy matchN): 1 matched, expected 0:
											    ./not.cue:18:4
											    ./not.cue:14:4
											    ./not.cue:16:4
											    ./not.cue:17:4
											    ./not.cue:18:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:allButOne"
									exitCode: 1
									output: """
											B: invalid value 42.0 (does not satisfy matchN): 1 matched, expected 2:
											    ./all-but-one.cue:9:4
											    ./all-but-one.cue:8:4
											    ./all-but-one.cue:9:11

											"""
								}, {
									doc:      ""
									cmd:      "cue vet .:composite"
									exitCode: 1
									output: """
											B: invalid value {x:4.2,y:4.2,z:4.2} (does not satisfy matchN): 0 matched, expected >0:
											    ./composite.cue:9:4
											    ./composite.cue:9:11
											E: invalid value [11,12,13] (does not satisfy matchN): 2 matched, expected 1:
											    ./composite.cue:24:19
											    ./composite.cue:24:4
											    ./composite.cue:24:26

											"""
								}, {
									doc:      "# This command currently succeeds:"
									cmd:      "cue vet .:helperFields"
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
