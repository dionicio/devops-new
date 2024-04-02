
data "tls_certificate" "eks-deploy" {
  url = aws_eks_cluster.deployment.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks-deploy" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks-deploy.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.deployment.identity[0].oidc[0].issuer
}

/*
data "tls_certificate" "eks-dev" {
  url = aws_eks_cluster.development.identity[0].oidc[0].issuer
}

resource "aws_iam_openid_connect_provider" "eks-dev" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks-dev.certificates[0].sha1_fingerprint]
  url             = aws_eks_cluster.development.identity[0].oidc[0].issuer
}

*/