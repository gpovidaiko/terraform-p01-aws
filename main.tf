provider "aws" {
	version = "~> 2.0"
	region = "us-east-1"
}

provider "aws" {
	alias = "us-east-2"
	version = "~> 2.0"
	region = "us-east-2"
}

resource "aws_instance" "dev" {
	count = 3
	ami = var.amis["us-east-1"]
	instance_type = "t2.micro"
	key_name = var.key_name
	tags = {
		name = "dev${count.index}"
	}
	vpc_security_group_ids = [ "${aws_security_group.ssh-access.id}" ]
}

resource "aws_instance" "dev4" {
	ami = var.amis["us-east-1"]
	instance_type = "t2.micro"
	key_name = var.key_name
	tags = {
		name = "dev4"
	}
	vpc_security_group_ids = [ "${aws_security_group.ssh-access.id}" ]
	depends_on = [ aws_s3_bucket.bucket-dev4 ]
}

resource "aws_instance" "dev5" {
	ami = var.amis["us-east-1"]
	instance_type = "t2.micro"
	key_name = var.key_name
	tags = {
		name = "dev5"
	}
	vpc_security_group_ids = [ "${aws_security_group.ssh-access.id}" ]
}

resource "aws_instance" "dev6" {
	provider = aws.us-east-2
	ami = var.amis["us-east-2"]
	instance_type = "t2.micro"
	key_name = var.key_name
	tags = {
		name = "dev6"
	}
	vpc_security_group_ids = [ "${aws_security_group.ssh-access-us-east-2.id}" ]
	depends_on = [ aws_dynamodb_table.basic-dynamodb-table ]
}

resource "aws_instance" "dev7" {
	provider = aws.us-east-2
	ami = var.amis["us-east-2"]
	instance_type = "t2.micro"
	key_name = var.key_name
	tags = {
		name = "dev7"
	}
	vpc_security_group_ids = [ "${aws_security_group.ssh-access-us-east-2.id}" ]
}

resource "aws_s3_bucket" "bucket-dev4" {
	bucket = "gpovidaiko-bucket-dev4"
	acl = "private"

	tags = {
		Name = "gpovidaiko-bucket-dev4"
	}
}

resource "aws_s3_bucket" "bucket-homol" {
	bucket = "gpovidaiko-bucket-homol"
	acl = "private"

	tags = {
		Name = "gpovidaiko-bucket-homol"
	}
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
	provider = aws.us-east-2
	name = "GameScores"
	billing_mode = "PAY_PER_REQUEST"
	hash_key = "UserId"
	range_key = "GameTitle"

	attribute {
		name = "UserId"
		type = "S"
	}

	attribute {
		name = "GameTitle"
		type = "S"
	}
}