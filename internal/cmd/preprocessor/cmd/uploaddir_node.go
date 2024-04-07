// Copyright 2024 The CUE Authors
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

const (
	fnUploadDir = "uploaddir"
)

type uploadDirNode struct {
	*nodeWrapper

	// dir is the relative directory to upload
	dir string

	// force indicates that the uploaddir should overwrite existing files if
	// they exist
	force bool
}

func (u *uploadDirNode) isHidden() bool {
	return true
}
