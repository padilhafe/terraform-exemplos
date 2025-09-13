resource "proxmox_vm_qemu" "vm" {
  name        = var.name
  description = var.description
  target_node = var.target_node
  tags        = var.tags
  agent       = 0
  sshkeys     = var.sshkeys

  # Cloud Init Options
  clone       = var.clone
  os_type     = "cloud-init"
  ciuser      = var.ciuser
  cipassword  = var.cipassword

  qemu_os  = "l26"
  bios     = "seabios"
  vm_state = "running"
  boot     = "order=scsi0"
  onboot   = true

  cpu {
    type = "x86-64-v2-AES"
    cores   = var.cpu_cores
    sockets = var.cpu_sockets
  }

  memory  = var.memory
  scsihw  = "virtio-scsi-single"

  network {
    id        = 0
    model     = "virtio"
    bridge    = var.network0_bridge
    tag       = var.network0_tag
  }
  // ipconfig0 = "ip=${var.network0_ip}/${var.network0_subnet},gw=${var.network0_gateway}"
  ipconfig0 = "ip=dhcp"

  nameserver = var.nameserver
  searchdomain = var.searchdomain
  
  disks {
    ide {
      ide3 {
        cloudinit {
          storage = "local-lvm"
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          size       = var.disk0_size
          storage    = var.disk0_storage
        }
      }
    }
  }
}