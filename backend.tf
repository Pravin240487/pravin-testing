terraform {
  backend "s3" {
    bucket = "pravin-240487"

    key = "ecs-testing/sample.state"

    encrypt = "true"
    region  = "us-east-1"
  }

  #Not adding required_version.  The idea is that if this is only applied/planned via jenkins, it should be the same
}