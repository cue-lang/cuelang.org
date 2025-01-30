package site
{
	content: {
		docs: {
			tutorial: {
				"convert-values-java-cue": {
					page: {
						cache: {
							upload: {
								code: "f0Ro7MklW6GEckKscbn6b96vF7KK5VziEmtPeeyAW5o="
							}
							multi_step: {
								hash:       "13H0P91SPC201G12BSME6OR45SE8RGJ0B9BSURE2J2RDD884OF4G===="
								scriptHash: "KP3LQMAO38O118K9QAE4UMMU79DG0VS53LQGRV2ASR4O56DF102G===="
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
									cmd:      "javac ConvertValues.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH ConvertValues"
									exitCode: 0
									output: """
											v1 equals v2: true

											aBool is: \tfalse
											aLong is: \t42
											aDouble is: 1.2345
											aString is: Hello!
											aSlice is: \t[1, 2, 3, 4, 5]

											aStruct as JSON: \t{"x":{"y":{"a":true,"b":42}}}
											aString as JSON: \t"Hello!"
											aBool as JSON: \t\tfalse

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
