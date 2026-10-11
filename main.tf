resource "oci_core_security_list" "core_security_lists" {
  for_each = var.core_security_lists

  compartment_id = each.value.compartment_id
  vcn_id         = each.value.vcn_id
  defined_tags   = each.value.defined_tags
  display_name   = each.value.display_name
  freeform_tags  = each.value.freeform_tags

  dynamic "egress_security_rules" {
    for_each = each.value.egress_security_rules != null ? each.value.egress_security_rules : []
    content {
      description      = egress_security_rules.value.description
      destination      = egress_security_rules.value.destination
      destination_type = egress_security_rules.value.destination_type
      dynamic "icmp_options" {
        for_each = egress_security_rules.value.icmp_options != null ? [egress_security_rules.value.icmp_options] : []
        content {
          code = icmp_options.value.code
          type = icmp_options.value.type
        }
      }
      protocol  = egress_security_rules.value.protocol
      stateless = egress_security_rules.value.stateless
      dynamic "tcp_options" {
        for_each = egress_security_rules.value.tcp_options != null ? [egress_security_rules.value.tcp_options] : []
        content {
          max = tcp_options.value.max
          min = tcp_options.value.min
          dynamic "source_port_range" {
            for_each = tcp_options.value.source_port_range != null ? [tcp_options.value.source_port_range] : []
            content {
              max = source_port_range.value.max
              min = source_port_range.value.min
            }
          }
        }
      }
      dynamic "udp_options" {
        for_each = egress_security_rules.value.udp_options != null ? [egress_security_rules.value.udp_options] : []
        content {
          max = udp_options.value.max
          min = udp_options.value.min
          dynamic "source_port_range" {
            for_each = udp_options.value.source_port_range != null ? [udp_options.value.source_port_range] : []
            content {
              max = source_port_range.value.max
              min = source_port_range.value.min
            }
          }
        }
      }
    }
  }

  dynamic "ingress_security_rules" {
    for_each = each.value.ingress_security_rules != null ? each.value.ingress_security_rules : []
    content {
      description = ingress_security_rules.value.description
      dynamic "icmp_options" {
        for_each = ingress_security_rules.value.icmp_options != null ? [ingress_security_rules.value.icmp_options] : []
        content {
          code = icmp_options.value.code
          type = icmp_options.value.type
        }
      }
      protocol    = ingress_security_rules.value.protocol
      source      = ingress_security_rules.value.source
      source_type = ingress_security_rules.value.source_type
      stateless   = ingress_security_rules.value.stateless
      dynamic "tcp_options" {
        for_each = ingress_security_rules.value.tcp_options != null ? [ingress_security_rules.value.tcp_options] : []
        content {
          max = tcp_options.value.max
          min = tcp_options.value.min
          dynamic "source_port_range" {
            for_each = tcp_options.value.source_port_range != null ? [tcp_options.value.source_port_range] : []
            content {
              max = source_port_range.value.max
              min = source_port_range.value.min
            }
          }
        }
      }
      dynamic "udp_options" {
        for_each = ingress_security_rules.value.udp_options != null ? [ingress_security_rules.value.udp_options] : []
        content {
          max = udp_options.value.max
          min = udp_options.value.min
          dynamic "source_port_range" {
            for_each = udp_options.value.source_port_range != null ? [udp_options.value.source_port_range] : []
            content {
              max = source_port_range.value.max
              min = source_port_range.value.min
            }
          }
        }
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

