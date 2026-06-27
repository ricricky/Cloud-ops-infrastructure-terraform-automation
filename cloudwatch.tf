resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name = "high-cpu-usage"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 2

  metric_name = "CPUUtilization"

  namespace = "AWS/EC2"

  period = 300

  statistic = "Average"

  threshold = 80

  alarm_description = "EC2 CPU exceeds 80 percent"

  dimensions = {
    InstanceId = aws_instance.web_server.id
  }

  alarm_actions = [
    aws_sns_topic.sns_alerts.arn
  ]
}