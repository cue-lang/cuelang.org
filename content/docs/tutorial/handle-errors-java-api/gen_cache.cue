package site
{
	content: {
		docs: {
			tutorial: {
				"handle-errors-java-api": {
					page: {
						cache: {
							upload: {
								code: "Me+7m7hQiH6vZsbj6vT2fb1xuVtlHhvykLWDQrcQYnM="
							}
							multi_step: {
								hash:       "5R785D2SA829EGUK61ISRCDLALUVAIGH9FPGJPQH26G0N3NF6NU0===="
								scriptHash: "TRSUVCFLRJ44OPPHE184HJFKA3RF1MTCOC5314RL2IHVDLRPCFM0===="
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
									cmd:      "javac HandleErrors.java"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH HandleErrors"
									exitCode: 0
									output: """
											## Catch block #1
											expected '}', found 'EOF'

											## Catch block #2
											field not found: x

											## Catch block #3
											cannot use value 123 (type int) as string

											## Catch block #4
											cue: marshal error: x: cannot convert incomplete value "bool" to JSON

											## Unification #1
											ab is: {"A":true}
											printError() reports: 
											ok

											## Unification #2
											printError() reports: 
											B: conflicting values 2 and 1

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
