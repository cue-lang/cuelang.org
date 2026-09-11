package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "1JgZtJ3zfHRnzljAuxRRqzvfo54jQqlvbgC99hlyBrM="
								"1 new": "Qf6VNmWYgjqlFa5gVav9p+jDcAfSdnfa1kx7oA7+/x0="
							}
							code: {
								"2 new": "d5v7X+tmalTyOf69OB/zPt725bCWlexvLsy2CH8G9iM="
							}
							multi_step: {
								hash:       "EF9516DJPU56A7MKVFL1E84SFOTIIG3QVCQUD9FE864O61ID0BMG===="
								scriptHash: "7Q1GK3BASC7KFMLAIJ9SM56V3T3O3FDRU1RRGRP6SPDQB2TJMMSG===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.0.0-goreleaser.202609101448:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --language-version=v0.17.0 example.com"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp current-syntax.cue experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue fix --exp=aliasv2 experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export current-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}, {
									doc:      ""
									cmd:      "cue export experimental-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

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
