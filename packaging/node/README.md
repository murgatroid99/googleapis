# GoogleAPIs Node Package Generator

This library generates packages from proto files.

## Prerequesites

To run these scripts, you must have Node installed at version 0.10+, or io.js. You must also run `npm install` in this directory.

## Node Script

The usage is as follows

```shell
bin/service_packager proto_file [options]
```

Where `proto_file` is the name of the proto file to generate from, and the options are

 - `-i path`/`--include path`: An include path to load additional proto files from
 - `-o path`/`--out path`: The output path to put the package in
 - `-n name`/`--name name`: The name of the package
 - `-v version`/`--version version`: Semantic version string for the package
 - `--grpc_version version`: Semantic version string of the gRPC dependency

## Shell Script

The shell script in the parent directory specifically generates packages from protos in this repository. It has the following usage:

```shell
package_node.sh package version semantic_version grpc_version out_dir
```

With these arguments:

 - `package`: The name of the package to generate. Must equal the name of the proto directory in googleapis (e.g. "pubsub")
 - `version`: The version string in the googleapis subdirectory (e.g. "v1beta2")
 - `semantic_version`: The semantic version of the package (e.g. "1.0.0-b2")
 - `grpc_version`: The version of grpc to depend on (e.g. "0.9.0")
 - `out_dir`: The directory to put the package into (e.g. "~/node\_pubsub")

The script will then generate a package with the name `package` in `out_dir` with the proto files in `googleapis/google/package/version`.
