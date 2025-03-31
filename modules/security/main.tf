resource "aws_accessanalyzer_analyzer" "thecloudsquad" {
    analyzer_name = "thecloudsquad-${var.stage}"
}