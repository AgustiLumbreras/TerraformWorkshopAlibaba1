
variable account_alias {
    description = "Account Alias name"
}

variable ADName {}

variable list_admin_policies {
    default = ["AliyunRAMFullAccess","AdministratorAccess"]
}

variable list_iam_admin_policies {
    default = ["AliyunRAMFullAccess"]
}

variable list_readn_only_policies {
    default = ["ReadOnlyAccess"]
}

variable list_auditor_policies {
    default = ["ReadOnlyAccess"]
}

variable list_billing_policies {
    default = []
}

variable list_network_admin_policies {
    default = ["AliyunVPCFullAccess"]
}

variable list_resource_admin_policies {
    default = ["AdministratorAccess"]
}