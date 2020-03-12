cask 'neurongpu' do
  version '1.0.8'
  sha256 '00892366728978b3dd3ba7f5fd38e3e304bf5459a67daeec536bd572d8c7ed87'

  url "https://github.com/golosio/NeuronGPU/releases/download/macOS-v1.0.8/NeuronGPU-macOS-1.0.8.tgz"
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
