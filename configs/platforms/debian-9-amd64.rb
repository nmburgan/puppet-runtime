platform "debian-9-amd64" do |plat|
  plat.servicedir "/lib/systemd/system"
  plat.defaultdir "/etc/default"
  plat.servicetype "systemd"
  plat.codename "stretch"

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot"
  plat.install_build_dependencies_with "DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends --force-yes"

  packages = [
    "libbz2-dev",
    "libreadline-dev",
    "libselinux1-dev",
    "make",
    "openjdk-8-jdk",
    "pkg-config",
    "pl-cmake",
    "pl-gcc",
    "swig",
    "systemtap-sdt-dev",
    "zlib1g-dev"
  ]

  plat.provision_with "export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends #{packages.join(' ')}"

  plat.vmpooler_template "debian-9-x86_64"
  plat.output_dir File.join("deb", plat.get_codename, "PC1")
end
