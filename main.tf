provider "aws" {
  region = "us-east-1"
}

# 🚨 S3 Bucket with no encryption, no logging, and no versioning
resource "aws_s3_bucket" "leaky_bucket" {
  bucket = "company-customer-data-bucket"
}

# 🚨 Security Group leaving SSH open to the entire public internet
resource "aws_security_group" "open_ssh" {
  name        = "allow_all_ssh"
  description = "Open SSH to the world"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
