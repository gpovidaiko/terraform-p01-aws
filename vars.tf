variable "amis" {
	type = map
	default = {
		"us-east-1" = "ami-0e472ba40eb589f49"
		"us-east-2" = "ami-0b614a5d911900a9b"
	}
}

variable "cdir_remote_access" {
	type = list
	default = [
		"177.16.173.151/32",
		"177.16.173.151/32"
	]
}

variable "key_name" {
	default = "terraform_key"
}
