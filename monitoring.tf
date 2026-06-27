resource "aws_sns_topic" "sns_alerts" {
  name = "cloudops_alerts"

}
resource "aws_sns_topic_subscription" "email_alerts" {
  topic_arn = aws_sns_topic.sns_alerts.arn
  protocol  = "email"
  endpoint  = "bholasahil1999@gmail.com"
}