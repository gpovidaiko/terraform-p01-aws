terraform {
	backend "remote" {
		organization = "gpvdkorg"
		hostname = "app.terraform.io"
		
		workspaces {
			name = "aws-gpvdkorg"
		}
	}
}
