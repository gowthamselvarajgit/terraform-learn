vpc_cidr            = "10.0.0.0/16"
public_subnet_cidrs = ["10.0.1.0/24"]
private_subnet_cidrs = ["10.0.2.0/24", "10.0.3.0/24"]


ami                 = "ami-0f918f7e67a3323f0"
instance_type       = "t2.micro"
ssh_ingress_ip      = "121.200.55.62/32"

db_name             = "appdb"
user_name           = "admin"
db_password         = "Gowtham_4026"
allocated_storage   = 20
engine              = "mysql"
engine_version      = "8.0"
instance_class      = "db.t3.micro"
