// Copyright 2022 CUE Authors
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

package functions

import (
	"context"
	"fmt"
	"net/http"

	"github.com/apex/gateway"
	"github.com/aws/aws-lambda-go/events"
)

// ProxyHandler declares a convenience type for the AWS gateway proxy handler
// function signature.
type ProxyHandler func(events.APIGatewayProxyRequest) (*events.APIGatewayProxyResponse, error)

// BuildHandler wraps a net/http response handler as a ProxyHandler.  This
// allows us to reuse a regular net/http response handler (used via
// net/http.HandleFunc) as an AWS Lambda function.
func BuildHandler(handler func(http.ResponseWriter, *http.Request)) ProxyHandler {
	return func(request events.APIGatewayProxyRequest) (*events.APIGatewayProxyResponse, error) {
		r, err := gateway.NewRequest(context.Background(), request)
		if err != nil {
			return nil, fmt.Errorf("failed to create net/http.Request from proxy request: %w", err)
		}
		w := gateway.NewResponse()
		handler(w, r)
		resp := w.End()
		return &resp, nil
	}
}
