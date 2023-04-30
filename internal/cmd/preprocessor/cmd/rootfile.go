// Copyright 2023 The CUE Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

package cmd

func (p *page) processRootFile(rootFile *rootFile, sourcePath, targetPath string) error {
	if rootFile.lang != langEn {
		return copyFile(sourcePath, targetPath)
	}
	// For now, we only support en as a main language. For other languages
	// we simply copy from source to target.
	//
	// For en idnex pages, the flow looks like this:
	//
	// 1. import
	return copyFile(sourcePath, targetPath)
}
