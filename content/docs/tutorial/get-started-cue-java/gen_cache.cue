package site
{
	content: {
		docs: {
			tutorial: {
				"get-started-cue-java": {
					page: {
						cache: {
							upload: {
								code: "TzUcUUVDur+hAFoVmIciDlmXXIKEwncKYwwcR9SGhF0="
							}
							multi_step: {
								hash:       "8ITID4DD6QPKOGRIGD45VLA90KPFBBCF51SI4IPGLSTNOEID68L0===="
								scriptHash: "T0PHHPSK4D6A7JS96MQHACJ64720C9HHCHC3NISF0GBCG8N3VO3G===="
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
									cmd:      "ls $LD_LIBRARY_PATH | grep libcue.so || echo 'fail!'"
									exitCode: 0
									output: """
											libcue.so

											"""
								}, {
									doc:      ""
									cmd:      "ls $CLASSPATH | grep /CUE.*jar$ || echo 'fail!'"
									exitCode: 0
									output: """
											/usr/local/share/java/CUE.jar

											"""
								}, {
									doc:      ""
									cmd:      "mkdir -p cue-java-api-tutorials"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cd cue-java-api-tutorials"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "javac GetStarted.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH GetStarted"
									exitCode: 0
									output: """
											a1 equals a2:\t\t\tfalse
											b1 equals b2:\t\t\ttrue
											c equals d:\t\t\t\ttrue
											A.val equals A.B.val:\ttrue

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
