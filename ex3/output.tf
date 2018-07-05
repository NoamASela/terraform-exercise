output "addresses" {
  value = ["${aws_instance.web.*.public_ip}"]
}
