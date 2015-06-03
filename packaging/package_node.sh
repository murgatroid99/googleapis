#!/usr/bin/env sh

if [[ $# -ne 5 ]]; then
  cat <<EOF
Usage: package_node.sh package version semantic_version grpc_version out_dir

Arguments:

 package		The name of the package to generate. Must equal the name of the proto directory in googleapis (e.g. "pubsub")

 version		The version string in the googleapis subdirectory (e.g. "v1beta2")

 semantic_version	The semantic version of the package (e.g. "1.0.0-b2")

 grpc_version		The version of grpc to depend on (e.g. "0.9.0")

 out_dir		The directory to put the package into (e.g. "~/node_pubsub")
EOF
  exit 1;
fi

cd "$(dirname $0)";

node/bin/service_packager "../google/$1/$2/$1.proto" --include ".." \
  --name "$1" --version "$3" --grpc_version "$4" --out "$5"

status=$?

if [[ $status -ne 0 ]]; then
  echo "Failed to generate complete package";
  exit $status
fi

exit 0
