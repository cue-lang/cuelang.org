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

import (
	"fmt"
	"regexp"
	"testing"
)

func TestGenerateRandomValue(t *testing.T) {
	tests := []struct {
		Pattern string
		Result  string
	}{
		{
			Pattern: "${xxxx}-${XXX}-${dddddd}",
			Result:  `^[a-f0-9]{4}-[A-F0-9]{3}-[0-9]{6}$`,
		},
	}

	for i, v := range tests {
		t.Run(fmt.Sprintf("entry index %d", i), func(t *testing.T) {
			got := generateRandomValue(v.Pattern)
			want := regexp.MustCompile(v.Result)
			if !want.MatchString(got) {
				t.Errorf("pattern %q with random value %q did not match %v", v.Pattern, got, want)
			}
		})
	}
}
