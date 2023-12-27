app_name = "lab"
ecs_role_arn = "arn:aws:iam::451412129039:role/lab-ecs-task-execution-role"
ecs_services = {
  frontend = {
    image          = "451412129039.dkr.ecr.us-west-2.amazonaws.com/frontend:1.0.0"
    cpu            = 256
    memory         = 512
    container_port = 8080
    host_port      = 8080
    desired_count  = 2
    is_public      = true
    protocol       = "HTTP"
    auto_scaling = {
      max_capacity    = 3
      min_capacity    = 2
      cpu_threshold    = 50
      memory_threshold = 50
    }
  }
  backend = {
    image          = "451412129039.dkr.ecr.us-west-2.amazonaws.com/backend:1.0.0"
    cpu            = 256
    memory         = 512
    container_port = 8080
    host_port      = 8080
    desired_count  = 2
    is_public      = false
    protocol       = "HTTP"
    auto_scaling = {
      max_capacity    = 3
      min_capacity    = 2
      cpu_threshold    = 75
      memory_threshold = 75
    }
  }
}
internal_alb_dns = "internal-lab-internal-1598346252.us-west-2.elb.amazonaws.com"
private_subnet_ids = [
  "subnet-06fe777a6ba0aac2a",
  "subnet-0dbde76917be47cec"
]
public_subnet_ids = [
  "subnet-0276451bca2053da0",
  "subnet-016fd67e9c7684c28"
]
security_group_ids = [
  "sg-070146e3163cd7729",
  "sg-02cd669e31d8ed836"
]
target_group_arns = {
  backend = {
    arn = "arn:aws:elasticloadbalancing:us-west-2:451412129039:targetgroup/backend-tg/891248102f72492f"
  }
  frontend = {
    arn = "arn:aws:elasticloadbalancing:us-west-2:451412129039:targetgroup/frontend-tg/8154758e7c34efac"
  }
}