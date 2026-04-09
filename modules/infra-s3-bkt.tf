#S3 bucket
resource "aws_s3_bucket" "my-bucket" {
    bucket = "${var.my-env}-terraform-bkt-pj"
    tags = {
        Name = "${var.my-env}-terraform-bkt-project"
        environment = "${var.my-env}"
    }
}