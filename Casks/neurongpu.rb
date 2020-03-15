cask 'neurongpu' do
  version '1.2.2'
  sha256 'bf2958e55035ef6b47660f1698db841daeef8b45af970ffa4f7bc11f661bc21e'

  url "https://github.com/golosio/NeuronGPU/releases/download/v1.2.2-macOS/NeuronGPU_v1.2.2-macOS.tgz"
  name 'Neurongpu'
  homepage 'https://github.com/golosio/NeuronGPU'

  depends_on macos: [
                      :sierra,
                      :high_sierra,
                    ]

  depends_on formula: 'libomp'

  depends_on formula: 'openmpi'

  installer script: {
                      executable: "#{staged_path}/NeuronGPU/macOS/install.sh",
                      args: ["#{staged_path}"],
                      sudo:       true,
                    }
  uninstall script: {
                      executable: "#{staged_path}/NeuronGPU/macOS/uninstall.sh",
                      sudo:       true,
                    }
  caveats "If you have not already done so, for using this software"
  caveats "you have to install NVIDIA Web Drivers for your version of macOS,"
  caveats "either from this site: https://www.tonymacx86.com/nvidia-drivers/"
  caveats "or using homebrew:"
  caveats "brew cask install nvidia-web-driver"

end
