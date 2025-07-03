variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "Central US"
}

variable "subscription_id" {
  description = "The Azure subscription ID where resources will be created."
  type        = string
  default     = "dde349b6-e516-4976-bc8d-4e4036bd454d" # Replace with your actual subscription ID
  
}

variable "resource_group" {
  default = "secure-server-rg"
  description = "The name of the resource group where resources will be created."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the virtual machine."
  type        = string
  default     = "adminuser"
  
}

variable "ssh_public_key" {
  description = "The SSH public key for secure access to the virtual machine."
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCzV/a89HTJDrt8W7Z4AdeBJNliQYkvMY1po+Nrjc0pjUNyUv2+ljGxsn49XgP4K/uwmzdDmsyFoow921zZycAX/qI5EhwX8t8HU3HaCzt7gspbRNYZFf8TCqQw5THLDxkqE5Vxc3AkgWi1bm1/2bne7FOFvKtNfNsYIvbpqrHDlcCddr2fM95XpPg7ciKb+zq6dIBUcpZyeZfVYM4VFFv1Gsx+EkuWC2T4DTopRO0IqV6aOjd2/6X3X59w6A2uFHk67SuAetSTGucBIWxNuvIGVURNQfPuN5f3EgOVv+ECjAoJK3h0toyNVXTIvELtG0ofv5nnuQpHdEh0IurMh09mefzj2VnVWz/1IDvQXn/LuV/yKfkvTu/iepqXo8yOVUVpNoD7nOgj8pcYm5yek/a1snX61dQjp8dzdEOSQP+6HajOxzL7bclYpNdFpTclw6umuSsVMLj1nU7ey+Kz3PctCVSK0pip6tmh6x+sVii8oYYsDsmGnwOYkIXmD1DSrSmOkDizJa4Dx8FTmC8UIsKM2gThMH3XWQ18q1qHHrWMLIjEn3UCo2xRy7ohp1o1cE+WgjFmN+syMjtifjCkU3vtjtApje2dQTkLChfvX/Q3OaXM0jTFdx4to5fisBxyOhvd+4fyIsz5rwPnDUxJrvOgpE0IGFj6yazGtwjgoL+GdQ== sanjit1998@gmail.com"
  sensitive = true
}