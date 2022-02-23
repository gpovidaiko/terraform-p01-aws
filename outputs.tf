output "dev-public_ip" {
	value = aws_instance.dev[*].public_ip
}

output "dev4-public_ip" {
	value = aws_instance.dev4.public_ip
}

output "dev5-public_ip" {
	value = aws_instance.dev5.public_ip
}

output "dev6-public_ip" {
	value = aws_instance.dev6.public_ip
}

output "dev7-public_ip" {
	value = aws_instance.dev7.public_ip
}
