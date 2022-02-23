resource "aws_security_group" "ssh-access" {
	name = "ssh-access"
	description = "ssh-access"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = var.cdir_remote_access
	}

	tags = {
		name = "ssh"
	}
}

resource "aws_security_group" "ssh-access-us-east-2" {
	provider = aws.us-east-2
	name = "ssh-access"
	description = "ssh-access"

	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = var.cdir_remote_access
	}

	tags = {
		name = "ssh"
	}
}
