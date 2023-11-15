#!/bin/bash

namespace=$(kubectl config view --minify | grep namespace | awk '{print $2}')

echo "⚓ $namespace"
