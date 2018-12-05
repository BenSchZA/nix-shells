with import <nixpkgs> {};

stdenv.mkDerivation {
    name = "k8s";
    buildInputs = [
        kubectl
	aws-iam-authenticator
    ];
    shellHook = ''
	kubectl proxy
	xdg-open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
    '';
}
