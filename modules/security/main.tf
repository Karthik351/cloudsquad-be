resource "aws_accessanalyzer_analyzer" "jayananalytics" {
    analyzer_name = "jayanalytics-${var.stage}"
}