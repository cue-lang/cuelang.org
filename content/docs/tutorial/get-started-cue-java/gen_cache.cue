package site
{
	content: {
		docs: {
			tutorial: {
				"get-started-cue-java": {
					page: {
						cache: {
							multi_step: {
								hash:       "EG14EPC0OR3I16384N4LVBTF8FSUS3PBLHPFKUVQFVCONU9VDGFG===="
								scriptHash: "RCR0H0M2RD7NIP5LK9JTMVJ5H65C1PBFCG5BIBLQOCPL085359AG===="
								steps: [{
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=/usr/local/lib/"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export CLASSPATH='/usr/local/share/java/*'"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "echo \"$CLASSPATH\""
									exitCode: 0
									output: """
											/usr/local/share/java/*

											"""
								}, {
									doc:      ""
									cmd:      "javac --version"
									exitCode: 0
									output: """
											javac 22.0.2

											"""
								}, {
									doc:      ""
									cmd:      "ls $LD_LIBRARY_PATH | grep libcue.so"
									exitCode: 0
									output: """
											libcue.so

											"""
								}, {
									doc:      ""
									cmd:      "ls $CLASSPATH | grep /CUE.*jar$"
									exitCode: 0
									output: """
											/usr/local/share/java/CUE.jar

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
