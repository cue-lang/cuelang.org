package site
{
	content: {
		docs: {
			howto: {
				"build-cue-api-java-jar": {
					page: {
						cache: {
							upload: {
								"HIDDEN: configure Maven download cache": "t4Yz0dMXCbVupdFBrZb7nVChiyYXPdRsMm28CtnZB6k="
							}
							multi_step: {
								hash:       "4GSKG3CELHQJUT3I70LBFS3M8L4VSEV5OUOPHO44H35N8TL58FO0===="
								scriptHash: "63D0OF50V0QQ8P18L1H27DNNDGBCF8363C2QJ8PJ5L5UVOKOQ8KG===="
								steps: [{
									doc:      ""
									cmd:      "javac --version"
									exitCode: 0
									output: """
											javac 22.0.2

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "java --version"
									exitCode: 0
									output: """
											openjdk 22.0.2 2024-07-16
											...

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "mvn --version"
									exitCode: 0
									output: """
											\u001b[1mApache Maven 3.9.8 (36645f6c9b5079805ea5009217e36f2cffd34256)\u001b[m
											...

											"""
								}, {
									doc:      ""
									cmd:      "git --version"
									exitCode: 0
									output: """
											git version 2.39.2

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java cue-api-java-source"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java-source"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e"
									exitCode: 0
									output: """
											Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
											...

											"""
								}, {
									doc:      "# ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											[\u001b[1;34mINFO\u001b[m] Scanning for projects...
											[\u001b[1;33mWARNING\u001b[m] 
											[\u001b[1;33mWARNING\u001b[m] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
											[\u001b[1;33mWARNING\u001b[m] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
											[\u001b[1;33mWARNING\u001b[m] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
											[\u001b[1;33mWARNING\u001b[m] 
											[\u001b[1;33mWARNING\u001b[m] It is highly recommended to fix these problems because they threaten the stability of your build.
											[\u001b[1;33mWARNING\u001b[m] 
											[\u001b[1;33mWARNING\u001b[m] For this reason, future Maven versions might no longer support building such malformed projects.
											[\u001b[1;33mWARNING\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--------------------------< \u001b[0;36morg.cuelang:CUE\u001b[0;1m >---------------------------\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1mBuilding CUE 0.0-devel\u001b[m
											[\u001b[1;34mINFO\u001b[m]   from pom.xml
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--------------------------------[ jar ]---------------------------------\u001b[m
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32mresources:3.3.1:resources\u001b[m \u001b[1m(default-resources)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;33mWARNING\u001b[m] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
											[\u001b[1;34mINFO\u001b[m] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/main/resources
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32mcompiler:3.10.1:compile\u001b[m \u001b[1m(default-compile)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;34mINFO\u001b[m] Changes detected - recompiling the module!
											[\u001b[1;33mWARNING\u001b[m] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
											[\u001b[1;34mINFO\u001b[m] Compiling 14 source files to /home/runner/cue-api-java-source/target/classes
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32mresources:3.3.1:testResources\u001b[m \u001b[1m(default-testResources)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;33mWARNING\u001b[m] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
											[\u001b[1;34mINFO\u001b[m] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/test/resources
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32mcompiler:3.10.1:testCompile\u001b[m \u001b[1m(default-testCompile)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;34mINFO\u001b[m] Changes detected - recompiling the module!
											[\u001b[1;33mWARNING\u001b[m] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
											[\u001b[1;34mINFO\u001b[m] Compiling 3 source files to /home/runner/cue-api-java-source/target/test-classes
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32msurefire:3.0.0-M5:test\u001b[m \u001b[1m(default-test)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] -------------------------------------------------------
											[\u001b[1;34mINFO\u001b[m]  T E S T S
											[\u001b[1;34mINFO\u001b[m] -------------------------------------------------------
											[\u001b[1;34mINFO\u001b[m] Running org.cuelang.cue.\u001b[1mCueContextTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1;32mTests run: \u001b[0;1;32m17\u001b[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.555 s - in org.cuelang.cue.\u001b[1mCueContextTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] Running org.cuelang.cue.\u001b[1mValueTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1;32mTests run: \u001b[0;1;32m32\u001b[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.316 s - in org.cuelang.cue.\u001b[1mValueTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] Running org.cuelang.cue.\u001b[1mAttributeTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1;32mTests run: \u001b[0;1;32m6\u001b[m, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.072 s - in org.cuelang.cue.\u001b[1mAttributeTest\u001b[m
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] Results:
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1;32mTests run: 55, Failures: 0, Errors: 0, Skipped: 0\u001b[m
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] 
											[\u001b[1;34mINFO\u001b[m] \u001b[1m--- \u001b[0;32mjar:3.4.1:jar\u001b[m \u001b[1m(default-jar)\u001b[m @ \u001b[36mCUE\u001b[0;1m ---\u001b[m
											[\u001b[1;34mINFO\u001b[m] Building jar: /home/runner/cue-api-java-source/target/CUE-0.0-devel.jar
											[\u001b[1;34mINFO\u001b[m] \u001b[1m------------------------------------------------------------------------\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1;32mBUILD SUCCESS\u001b[m
											[\u001b[1;34mINFO\u001b[m] \u001b[1m------------------------------------------------------------------------\u001b[m
											[\u001b[1;34mINFO\u001b[m] Total time:  9.093 s
											[\u001b[1;34mINFO\u001b[m] Finished at: 2024-08-05T09:21:55Z
											[\u001b[1;34mINFO\u001b[m] \u001b[1m------------------------------------------------------------------------\u001b[m
											\u001b[0m\u001b[0m
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
