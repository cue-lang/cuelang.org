package site
{
	content: {
		examples: {
			cue: {
				preprocessor: {
					page: {
						cache: {
							upload: {
								"upload initial files":   "RmUQhtGnfqa0IkhZJuLzssYTxwFZnDdC7lEz0RocAMI="
								"upload additional file": "jtmZWIgpfVtS0rWYeYAlusIuRg/5+YcUfdQHPrQa+8w="
								"a hidden file":          "x2iJw/wqIP3j/LYCxVXtQEmif5CkNO1TZp5VRczbVgo="
							}
							code: {
								"a code example": "Gx76TCL4WIJOwa3Z5fWDEg33Bch3AKPzoGnTMe1yeaU="
							}
							multi_step: {
								hash:       "CIHAOQ7S3D1BBMCBI9V146HBA70S484V7R4D1MSSPRPTDSG261I0===="
								scriptHash: "1K5IR4L5KQL27R6E7ANJ8AGBNEVTHEJKDL4DS7JRTOBCVG32LFNG===="
								steps: [{
									doc:      ""
									cmd:      "cue eval"
									exitCode: 0
									output: """
											y: 2
											x: 1

											"""
								}, {
									doc:      ""
									cmd:      "cue eval >result.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cat *.txt"
									exitCode: 0
									output: """
											y: 2
											z: 3
											x: 1

											"""
								}, {
									doc:      ""
									cmd:      "grep bar foo.txt"
									exitCode: 0
									output: """
											bar

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
