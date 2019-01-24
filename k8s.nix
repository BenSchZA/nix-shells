with import <nixpkgs> {};

stdenv.mkDerivation {
	name = "k8s";
	buildInputs = [
		kubectl
                awscli
		aws-iam-authenticator
		kubernetes-helm
		minikube libvirt qemu
		kubectx
		heptio-ark
	];
	shellHook = ''
		kubectl proxy &
		xdg-open http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/
	'';
}
