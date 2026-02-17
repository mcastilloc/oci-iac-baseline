
output "public_ip" {
  description = "Public IP of the compute instance"
  value       = module.compute.public_ip
}
