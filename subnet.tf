resource "aws_subnet" "pub_subnet_1" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.0.0/24"
    availability_zone = "us-west-2a"
}

resource "aws_subnet" "pub_subnet_2" {
    vpc_id                  = aws_vpc.vpc.id
    cidr_block              = "10.0.4.0/24"
    availability_zone = "us-west-2b"
}
