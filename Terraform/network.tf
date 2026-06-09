/* 
resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Name = "travelmemory-nat-eip"
  }
}
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "travelmemory-nat-gateway"
  }

  depends_on = [
    aws_internet_gateway.igw
  ]
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "travelmemory-private-rt"
  }
}
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
} 
*/