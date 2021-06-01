#!bin/bash

date > src/files/test1.txt
date > src/files/test2.txt

go get github.com/gruntwork-io/terratest/modules/terraform
go mod init github.com/alexistdk/terraform-test
cd tests
go test
