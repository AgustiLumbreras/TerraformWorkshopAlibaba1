{
    "Statement": [
        {
            "Action": "sts:AssumeRoleWithSAML",
            "Effect": "Allow",
            "Principal": {
              "Federated": ["acs:ram::${account_id}:saml-provider/${ad_name}"]
            },
            "Condition":{
              "StringEquals": {
                "SAML:aud": "https://signin.alibabacloud.com/saml-role/sso" }
            }
        }
    ],
    "Version": "1"
}