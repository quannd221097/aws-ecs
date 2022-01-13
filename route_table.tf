resource "aws_route_table" "public" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet_gateway.id
    }
}

resource "aws_route_table_association" "public_subnet_1_route_table_association" {
    subnet_id      = aws_subnet.pub_subnet_1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_2_route_table_association" {
    subnet_id      = aws_subnet.pub_subnet_2.id
    route_table_id = aws_route_table.public.id
}