docker_tag = nicolov/bazel-buildroot-toolchain:0.0.1

# Update the image used in CI
PHONY: upload-image
upload-image:
	sudo docker build -t $(docker_tag) . &&  sudo docker push $(docker_tag)
