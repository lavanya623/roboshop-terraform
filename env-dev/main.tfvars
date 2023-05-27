env              = "dev"
bastion_cidr     = ["172.31.11.111/32"]
default_vpc_id   = "vpc-0a8e3e6a0d6cb90d9"
default_vpc_cidr = "172.31.0.0/16"
default_vpc_rtid = "rtb-0b9a867762d6530ba"
kms_arn          = "arn:aws:kms:us-east-1:633788536644:key/dce90622-5a23-4f82-a639-be841f534702"

vpc = {
  main = {
    cidr_block = "10.0.0.0/16"
    subnets = {
      public = {
        name       = "public"
        cidr_block = ["10.0.0.0/24", "10.0.1.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      web = {
        name       = "web"
        cidr_block = ["10.0.2.0/24", "10.0.3.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      app = {
        name       = "app"
        cidr_block = ["10.0.4.0/24", "10.0.5.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
      db = {
        name       = "db"
        cidr_block = ["10.0.6.0/24", "10.0.7.0/24"]
        azs        = ["us-east-1a", "us-east-1b"]
      }
    }
  }
}

app = {
  frontend = {
    name             = "frontend"
    instance_type    = "t3.small"
    subnet_name      = "web"
    allow_app_cidr   = "public"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
  }
  catalogue = {
    name             = "catalogue"
    instance_type    = "t3.small"
    subnet_name      = "app"
    allow_app_cidr   = "web"
    desired_capacity = 2
    max_size         = 10
    min_size         = 2
  }
  //  cart = {
  //    name          = "cart"
  //    instance_type = "t3.small"
  //    subnet_name   = "app"
  //  }
  //  user = {
  //    name          = "user"
  //    instance_type = "t3.small"
  //    subnet_name   = "app"
  //  }
  //  shipping = {
  //    name          = "shipping"
  //    instance_type = "t3.small"
  //    subnet_name   = "app"
  //  }
  //  payment = {
  //    name          = "payment"
  //    instance_type = "t3.small"
  //    subnet_name   = "app"
  //  }
}


docdb = {
  main = {
    subnet_name    = "db"
    allow_db_cidr  = "app"
    engine_version = "4.0.0"
    instance_count = 1
    instance_class = "db.t3.medium"
  }
}
