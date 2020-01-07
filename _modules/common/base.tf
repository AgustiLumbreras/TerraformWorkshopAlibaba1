data "alicloud_account" "current"{
}

data "template_file" "AssumeRoleWithSAML_policy" {
  template = "${file("${path.module}/policy.json.tpl")}"

  vars = {
    account_id = "${data.alicloud_account.current.id}"
    ad_name = "${var.ADName}"
  }
}

resource "alicloud_ram_account_alias" "alias" {
  account_alias = "${var.account_alias}"
}

##########################
## RAM ROLES

resource "alicloud_ram_role" "admin_role" {
  name = "ADFS-Administrator"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "iam_admin_role" {
  name = "ADFS-IAMAdmin"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "read_only_role" {
  name = "ADFS-ReadOnly"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "auditor_role" {
  name = "ADFS-Auditor"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "billing_role" {
  name = "ADFS-BillingAdmin"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "network_role" {
  name = "ADFS-NetworkAdmin"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

resource "alicloud_ram_role" "resource_role" {
  name = "ADFS-ResourceAdmin"
  document = "${data.template_file.AssumeRoleWithSAML_policy.rendered}"
  force = true
}

##########################
## RAM POLICY ATACHEMENTS

resource "alicloud_ram_role_policy_attachment" "admin_role_attach" {
  count = "${length(var.list_admin_policies)}"
  policy_name = "${element(var.list_admin_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.admin_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "iam_admin_role_attach" {
  count = "${length(var.list_iam_admin_policies)}"
  policy_name = "${element(var.list_iam_admin_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.iam_admin_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "read_only_role_attach" {
  count = "${length(var.list_readn_only_policies)}"
  policy_name = "${element(var.list_readn_only_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.read_only_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "auditor_role_attach" {
  count = "${length(var.list_auditor_policies)}"
  policy_name = "${element(var.list_auditor_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.auditor_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "billing_role_attach" {
  count = "${length(var.list_billing_policies)}"
  policy_name = "${element(var.list_billing_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.billing_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "network_role_attach" {
  count = "${length(var.list_network_admin_policies)}"
  policy_name = "${element(var.list_network_admin_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.network_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "resource_role_attach" {
  count = "${length(var.list_resource_admin_policies)}"
  policy_name = "${element(var.list_resource_admin_policies, count.index)}"
  policy_type = "System"
  role_name = "${alicloud_ram_role.resource_role.name}"
}

resource "alicloud_ram_role_policy_attachment" "resource_role_attach_deny" {
  policy_name = "${alicloud_ram_policy.resource_deny_policy.name}"
  policy_type = "${alicloud_ram_policy.resource_deny_policy.type}"
  role_name = "${alicloud_ram_role.resource_role.name}"
}

resource "alicloud_ram_policy" "resource_deny_policy" {
  name = "ResourceAdminPolicyRestrict"
  document = <<EOF
  {
    "Statement": [
      {
        "Action": [
          "vpc:*",
          "ram:*"
        ],
        "Effect": "Deny",
        "Resource": [
          "*"
        ]
      }
    ],
      "Version": "1"
  }
  EOF
  description = "Policy of a ResourceAdmin, role can do anything but the networking part"
  force = true
}

