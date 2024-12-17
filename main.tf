
module "ec2"
#source = "git::https://github.com/Prakashja/aws-terraform-modules.git//aws-ec2-module/?ref=main"
source = "aws-terraform-module"

provider "aws" {
  region = "ap-south-1" # Change this to your desired AWS region
}
# Launch an EC2 instance
resource "aws_instance" "App" {
  ami           = "ami-0614680123427b75e" # Replace with your desired AMI ID
  instance_type = "t2.micro"              # Change to the desired instance type
  tags = {
    Name = "practiceVMAmazonunix"
  }
}


resource "aws_instance" "Web" {
  ami           = "ami-053b12d3152c0cc71" # Replace with your desired AMI ID
  instance_type = "t2.micro"              # Change to the desired instance type
  tags = {
    Name = "practiceVMAmazonubuntu"
  }
}


output "instance_public_ip_app" {
  value = aws_instance.App.public_ip

}
output "instance_id_app" {
  value = aws_instance.App.id
} 

output "instance_public_ip_web" {
  value = aws_instance.Web.public_ip

}
output "instance_id_web" {
  value = aws_instance.Web.id
}
