variable "core_security_lists" {
  description = <<EOT
Map of core_security_lists, attributes below
Required:
    - compartment_id
    - vcn_id
Optional:
    - defined_tags
    - display_name
    - freeform_tags
    - egress_security_rules (block):
        - description (optional)
        - destination (required)
        - destination_type (optional)
        - icmp_options (optional, block):
            - code (optional)
            - type (required)
        - protocol (required)
        - stateless (optional)
        - tcp_options (optional, block):
            - max (optional)
            - min (optional)
            - source_port_range (optional, block):
                - max (required)
                - min (required)
        - udp_options (optional, block):
            - max (optional)
            - min (optional)
            - source_port_range (optional, block):
                - max (required)
                - min (required)
    - ingress_security_rules (block):
        - description (optional)
        - icmp_options (optional, block):
            - code (optional)
            - type (required)
        - protocol (required)
        - source (required)
        - source_type (optional)
        - stateless (optional)
        - tcp_options (optional, block):
            - max (optional)
            - min (optional)
            - source_port_range (optional, block):
                - max (required)
                - min (required)
        - udp_options (optional, block):
            - max (optional)
            - min (optional)
            - source_port_range (optional, block):
                - max (required)
                - min (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    vcn_id         = string
    defined_tags   = optional(map(string))
    display_name   = optional(string)
    freeform_tags  = optional(map(string))
    egress_security_rules = optional(list(object({
      description      = optional(string)
      destination      = string
      destination_type = optional(string)
      icmp_options = optional(object({
        code = optional(number)
        type = number
      }))
      protocol  = string
      stateless = optional(bool)
      tcp_options = optional(object({
        max = optional(number)
        min = optional(number)
        source_port_range = optional(object({
          max = number
          min = number
        }))
      }))
      udp_options = optional(object({
        max = optional(number)
        min = optional(number)
        source_port_range = optional(object({
          max = number
          min = number
        }))
      }))
    })))
    ingress_security_rules = optional(list(object({
      description = optional(string)
      icmp_options = optional(object({
        code = optional(number)
        type = number
      }))
      protocol    = string
      source      = string
      source_type = optional(string)
      stateless   = optional(bool)
      tcp_options = optional(object({
        max = optional(number)
        min = optional(number)
        source_port_range = optional(object({
          max = number
          min = number
        }))
      }))
      udp_options = optional(object({
        max = optional(number)
        min = optional(number)
        source_port_range = optional(object({
          max = number
          min = number
        }))
      }))
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

