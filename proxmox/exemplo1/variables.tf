# Opcoes Gerais
variable "name" {}
variable "description" {}
variable "target_node" {}
variable "tags" {}
variable "clone" {}
variable "ciuser" {}
variable "cipassword" {}

# Configuracao de Hardware da Maquia
variable "cpu_cores" {}
variable "cpu_sockets" {}
variable "memory" {}

# Configuracao de Disco
variable "disk0_size" {}
variable "disk0_storage" {}

# Configuracao de Rede
variable "network0_bridge" {}
variable "network0_tag" {}
variable "network0_ip" {}
variable "network0_subnet" {}
variable "network0_gateway" {}

variable "nameserver" {}
variable "searchdomain" {}
