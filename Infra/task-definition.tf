data "aws_ecs_task_definition" "Devopstest" {
  task_definition = "${aws_ecs_task_definition.Devopstest.family}"
}

resource "aws_ecs_task_definition" "Devopstest" {
    family                = "php-app"
    container_definitions = <<DEFINITION
[
  {
    "name": "dev-test-nginx",
    "links": [
      "php-fpm"
    ],
    "volumes": [
      "./application:/var/www/html",
      "./nginx/logs/:/var/log/nginx",
      "./nginx/sites/:/etc/nginx/conf.d"
    ],
    "image": "dev-test-nginx",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "memory": 500,
    "cpu": 10
  },

  {
    "name": "php-fpm",
    "volumes": [
      "./application:/var/www/html"
    ],
    "image": "php-fpm",
    "environment": [
      "env/${ENV}.env"
    ]
    "essential": true,
    "portMappings": [
      {
        "containerPort": 9000,
        "hostPort": 80
      }
    ],
    "memory": 500,
    "cpu": 10
  },

{
    "name": "dev-test-postgresql",
    "volumes": [
      "./postgresql/data/:/var/lib/postgresql/data"
    ],
    "image": "dev-test-postgresql",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 5432,
        "hostPort": 5432
      }
    ],
    "memory": 500,
    "cpu": 10
  },
  {
    "environment": [
      "POSTGRES_DB=default,
      "POSTGRES_USER=default",
      "POSTGRES_PASSWORD=secret"
    ],
{
    "name": "dev-test-redis",
    "volumes": [
      "./redis/data/:/var/lib/redis/data"
    ],
    "image": "dev-test-redis",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 6379,
        "hostPort": 6379
      }
    ],
    "memory": 500,
    "cpu": 10
  },

  }
]
DEFINITION
}
